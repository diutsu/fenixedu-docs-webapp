package org.fenixedu;

import pt.ist.fenixframework.Atomic;
import pt.ist.fenixframework.Atomic.TxMode;
import pt.ist.fenixframework.FenixFramework;

import java.io.File;
import java.io.FileReader;
import java.util.HashSet;
import java.util.Set;

import org.fenixedu.bennu.core.domain.Bennu;
import org.fenixedu.bennu.scheduler.custom.CustomTask;
import org.fenixedu.drive.domain.S3Endpoint;
import org.fenixedu.drive.domain.S3Storage;
import org.fenixedu.drive.domain.VersionedFile;
import org.fenixedu.drive.service.EndpointService;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.transfer.TransferManager;
import com.amazonaws.services.s3.transfer.Upload;
import com.amazonaws.services.s3.transfer.model.UploadResult;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

/**
 * Created by diutsu on 13/07/16.
 */
public class UploadFilestoS3 extends CustomTask{
    private static final boolean secure = true;
    //
    private static final String storageName = "DefaultStorage";

    private static final String al_endpoint = "rgw01.al.dsi.tecnico.ulisboa.pt";
    private static final String al_accessKey = "EAMT4KKJLEP18722HZVS";
    private static final String al_secretKey = "L1DcCx6DbNsDErZXec3iahw4J4E9Zdm4WGQTZHnl";
    private static final String al_bucketName = "drive-default-al";

    private static final String tp_endpoint = "rgw01.tp.dsi.tecnico.ulisboa.pt";
    private static final String tp_accessKey = "489AA05XHFIR6NOGL7SY";
    private static final String tp_secretKey = "P0HPiN5VCl8zGozlGwAgFRET8ByBoR7fJkqnygGG";
    private static final String tp_bucketName = "drive-default-tg";

    @Override
    public TxMode getTxMode() {
        return TxMode.READ;
    }

    @Override
    public void runTask() throws Exception {
        S3Storage storage =
            FenixFramework.atomic(()-> {
                Set<S3Endpoint> endpointSet  = createS3Endpoints();
                return createS3StorageAndSetDefault(endpointSet);
            });

        JsonArray files = new JsonParser().parse(new FileReader("/home/diutsu/Downloads/filemapping.json")).getAsJsonArray();
        for (JsonElement fileJson : files) {
            String id = fileJson.getAsJsonObject().get("oid").getAsString();
            String path = fileJson.getAsJsonObject().get("path").getAsString();
            File oldFile = new File(path);
            VersionedFile versionedFile = FenixFramework.getDomainObject(id);

            FenixFramework.atomic(()->addToStorageAndEndpoint(versionedFile,storage));

            for(S3Endpoint endpoint : storage.getS3EndpointSet() ) {
                managedUpload(EndpointService.clientFor(endpoint), oldFile, endpoint.getBucketName(), id);
            }
        }
    }

    private void addToStorageAndEndpoint(VersionedFile versionedFile, S3Storage storage) {
        versionedFile.setStorage(storage);
        storage.getS3EndpointSet().forEach(versionedFile::addS3Endpoint);
    }

    private S3Storage createS3StorageAndSetDefault(Set<S3Endpoint> endpoints) throws Exception {
        return FenixFramework.atomic(() -> {
            S3Storage defaultStorage = new S3Storage(storageName, endpoints, 1);
            Bennu.getInstance().addS3Storage(defaultStorage);
            Bennu.getInstance().setDefaultS3Storage(defaultStorage);
            return defaultStorage;
        });
    }

    private Set<S3Endpoint> createS3Endpoints() throws Exception {
       return FenixFramework.atomic(() -> {
            HashSet<S3Endpoint> endpoints
                = new HashSet<>();

            S3Endpoint al_s3endpoint = new S3Endpoint(al_endpoint, true, al_bucketName, false, al_accessKey,al_secretKey);
            Bennu.getInstance().addS3Endpoint(al_s3endpoint);
            endpoints.add(al_s3endpoint);

            S3Endpoint tp_s3endpoint = new S3Endpoint(tp_endpoint, true, tp_bucketName, false, tp_accessKey,tp_secretKey);
            Bennu.getInstance().addS3Endpoint(tp_s3endpoint);
            endpoints.add(tp_s3endpoint);

            return endpoints;
        });
    }




    private static void managedUpload(AmazonS3 conn, File file,String bucketName, String uploadKey) {
        try {
            TransferManager manager = new TransferManager(conn);
            Upload upload = manager.upload(bucketName, uploadKey, file);
            UploadResult result = upload.waitForUploadResult();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

}
