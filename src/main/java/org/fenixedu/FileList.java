//package org.fenixedu;
//
//import pt.ist.fenixframework.Atomic.TxMode;
//
//import java.io.File;
//import java.lang.reflect.Method;
//import java.util.stream.Stream;
//
//import org.apache.ojb.broker.util.Version;
//import org.fenixedu.bennu.core.domain.Bennu;
//import org.fenixedu.bennu.io.domain.GenericFile;
//import org.fenixedu.bennu.io.domain.GenericFile_Base;
//import org.fenixedu.bennu.io.domain.LocalFileSystemStorage;
//import org.fenixedu.bennu.scheduler.custom.CustomTask;
//import org.fenixedu.drive.domain.VersionedFile;
//
//import com.google.gson.JsonArray;
//import com.google.gson.JsonObject;
//
///**
// * Created by diutsu on 13/07/16.
// */
//public class FileList extends CustomTask {
//
//    private int errors;
//
//    @Override
//    public TxMode getTxMode() {
//        return TxMode.READ;
//    }
//
//    @Override
//    public void runTask() throws Exception {
//        JsonArray array = new JsonArray();
//        Integer errors= 0;
//        getFileStream().map(file ->
//        {
//            JsonObject obj = new JsonObject();
//            obj.addProperty("oid", file.getExternalId());
//            obj.addProperty("path", extract((VersionedFile) file));
//            return obj;
//        }).forEach( el -> array.add(el));
//
//        taskLog("There were " + getFileStream().count());
//        output("filemapping.json", array.toString().getBytes());
//        taskLog("There were " + errors + " errors");
//    }
//
//
//    private String extract(VersionedFile candidacySummaryFile) {
//        try {
//            Method getStorage = GenericFile_Base.class.getDeclaredMethod("getStorage", null);
//            getStorage.setAccessible(true);
//            LocalFileSystemStorage storage = (LocalFileSystemStorage) getStorage.invoke(candidacySummaryFile, null);
//            Method getFullPath = LocalFileSystemStorage.class.getDeclaredMethod("getFullPath", String.class);
//            getFullPath.setAccessible(true);
//            String path = (String) getFullPath.invoke(storage, candidacySummaryFile.getExternalId());
//            String filepath = path + candidacySummaryFile.getExternalId();
//            File fpath = new File(filepath);
//            if (!fpath.exists()) {
//                taskLog("File does not exist: %s\n", filepath);
//            }
//            return filepath;
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        errors++;
//        return null;
//
//    }
//
//    public Stream<GenericFile> getFileStream() {
//        return Bennu.getInstance().getFileSupport().getFileSet().stream().filter(file -> file instanceof VersionedFile);
//
//    }
//}
//
//
