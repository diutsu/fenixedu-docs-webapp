package org.fenixedu.drive.domain;

import pt.ist.fenixframework.Atomic.TxMode;
import pt.ist.fenixframework.FenixFramework;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.function.Consumer;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.fenixedu.bennu.core.domain.Bennu;
import org.fenixedu.bennu.core.domain.User;
import org.fenixedu.bennu.scheduler.custom.CustomTask;
import org.fenixedu.s3.api.bean.FileMetadata;
import org.fenixedu.s3.domain.S3Endpoint;
import org.fenixedu.s3.domain.S3File_Base;
import org.fenixedu.s3.domain.S3Storage;
import org.joda.time.DateTime;

import com.google.common.collect.Lists;
import com.google.common.collect.Sets;

/**
 * Created by diutsu on 13/07/16.
 */
public class SetS3InfoOnFiles extends CustomTask {

    @Override
    public TxMode getTxMode() {
        return TxMode.READ;
    }

    @Override
    public void runTask() throws Exception {
        taskLog("init s3");
        initS3();
        taskLog("set s3stores for repositories");
        setStoragesOnRepos();
        taskLog("set s3stores for files");
        List<DirNode> repos = Stream.concat(Bennu.getInstance().getRepositorySet().stream(),
            Bennu.getInstance().getUserSet().stream().filter(user -> user.getFileRepository() != null)
                .map(User::getFileRepository)).collect(Collectors.toList());
        taskLog("going up to "+repos.size());
        chunkalhate(repos, repo -> getRepoArray(repo).forEach(file ->
            setStorage(repo, file)), 200);

    }

    private void setStoragesOnRepos() {
        taskLog("going up to "+Bennu.getInstance().getRepositorySet().size());
        taskLog("and then again  up to "+Bennu.getInstance().getUserSet().size());
    
        chunkalhate(new ArrayList<>(Bennu.getInstance().getRepositorySet()),
            repo -> {
                repo.setS3Storage(findStorageForRepo(repo));
                repo.setFolder(repo.getSlug());
            }, 1000);
        chunkalhate(Bennu.getInstance().getUserSet().stream().filter(user -> user.getFileRepository() != null)
                .map(User::getFileRepository).collect(Collectors.toList()),
            repo -> {
                repo.setS3Storage(findStorageByBucket("drive-users"));
                repo.setFolder(repo.getSlug());
            },1000);

    }
    
    private S3Storage findStorageForRepo(DirNode repo) {
//        if(repo.getSlug().equals("vault"))
//            return findStorageByBucket("drive-glaciar");
//        if(repo.getSlug().equals("arquivo-fotografico---originais"))
//            return findStorageByBucket("drive-photo-originals");
        return findStorageByBucket("drive-repos");
    
    }
    
    private void initS3() {
        FenixFramework.atomic(() -> {
            S3Endpoint a1 = new S3Endpoint("rgw.al.dsi.tecnico.ulisboa.pt", true, false, "EAMT4KKJLEP18722HZVS",
                "L1DcCx6DbNsDErZXec3iahw4J4E9Zdm4WGQTZHnl", "8a7", "alameda-testes");
            S3Endpoint t1 = new S3Endpoint("rgw01.tp.dsi.tecnico.ulisboa.pt", true, false, "489AA05XHFIR6NOGL7SY",
                "P0HPiN5VCl8zGozlGwAgFRET8ByBoR7fJkqnygGG", "42c", "tagus-testes");

//            S3Endpoint al_glacier = new S3Endpoint("rgw.al.dsi.tecnico.ulisboa.pt",true,false, "UVTS8DO910GQO6MH9TTU",
//                "4eQ027SVXLc7QnOvLSIosk264EqDs0CTJeGQYZe6", "c63", "alameda-glacier");
//
//            S3Endpoint al_tungsten = new S3Endpoint("rgw.al.dsi.tecnico.ulisboa.pt", true, false, "T146FI7BGS7UN942R5VY",
//                "yQ8d24yP4kIp93jLGu1E0C9mmNVUKXtysGNjWlWe", "705", "alameda-tungsten");
//
//            S3Endpoint al_wood = new S3Endpoint("rgw.al.dsi.tecnico.ulisboa.pt", true, false, "BF7JK90J6F7CQ6B52AOY",
//                "sbmgnNhHkNzhCi2dD2yUaQ0GO4GXFYzMUndmAw6U", "da8", "alameda-wood");
//
//            S3Endpoint tp_glacier = new S3Endpoint( "rgw01.tp.dsi.tecnico.ulisboa.pt", true, false,"RY35GDB94U8ULIOKYLC5",
//                "ZPpDQVBQMhuYCkBPrmpKOHqXdl2qG9ENeNC413ad","4c9", "tagus-glacier");
//
//            S3Endpoint tp_tungsten = new S3Endpoint( "rgw01.tp.dsi.tecnico.ulisboa.pt", true, false,"YTBAD8253X99YA55ICY7",
//                "Bf9wPLoXZscLIksYbQDkdxCeV8gwp2uCA6ieTyI6","408", "tagus-tungsten");
//
//            S3Endpoint tp_wood = new S3Endpoint( "rgw01.tp.dsi.tecnico.ulisboa.pt", true, false,"RQUKOW8X811L4XCF76E1",
//                "t6yfFwd48q6XHBmrBfUwd0TDSAAyv1Llu44BvcOx","1dc", "tagus-wood");
    
            S3Storage users = new S3Storage("Drive Users", Sets.newHashSet(a1, t1), 1);
            new S3Storage("Drive Repos", Sets.newHashSet(a1, t1), 2);
//
//            S3Storage users = new S3Storage("Drive Users", Sets.newHashSet(al_wood, al_wood), 1);
//            new S3Storage("Drive Repos", Sets.newHashSet(al_tungsten, tp_tungsten), 2);
//            new S3Storage("Drive Photo Original", Sets.newHashSet(al_tungsten, tp_tungsten), 2);
//            new S3Storage("Drive Glaciar", Sets.newHashSet(al_glacier, tp_glacier), 2);
//
    
            Bennu.getInstance().setDefaultS3Storage(users);
        });
    }

    private S3Storage findStorageByBucket(String bucket) {
        return Bennu.getInstance().getS3StorageSet().stream().filter(s3Storage -> s3Storage.getDefaultBucket().equals(bucket))
            .findAny().orElseGet(() -> Bennu.getInstance().getDefaultS3Storage());
    }

    private Stream<VersionedFile> getRepoArray(DirNode repo) {
        ArrayList<VersionedFile> array = new ArrayList<VersionedFile>();
        Set<FileNode> files = flatChild(repo).collect(Collectors.toSet());
        for (FileNode fileNode : files) {
            VersionedFile file = fileNode.getDocument().getLastVersionedFile();
            addFile(file, array);
        }
        return array.stream();
    }

    private void addFile(VersionedFile file, List<VersionedFile> filearray) {
        filearray.add(file);
        if (file.getPreviousVersion() != null) {
            addFile(file.getPreviousVersion(), filearray);
        }
    }

    private Stream<FileNode> flatChild(DirNode node) {
        Set<AbstractFileNode> childs = Stream
            .concat(Optional.ofNullable(node.getTrash()).map(Stream::of).orElseGet(Stream::empty), node.getChildSet().stream())
            .collect(Collectors.toSet());

        return Stream.concat(
            childs.stream().filter(AbstractFileNode::isDir).filter(abstractFileNode -> !abstractFileNode.isShared())
                .flatMap(child -> flatChild((DirNode) child)),
            childs.stream().filter(AbstractFileNode::isFile).filter(abstractFileNode -> !abstractFileNode.isShared())
                .map(child -> (FileNode) child));
    }

    private void setStorage(DirNode repo, VersionedFile file) {
    
        String key = repo.getFolder() + "/" + file.getUploadKey();
        try {
            Method method = S3File_Base.class.getDeclaredMethod("setUploadKey", String.class);
            method.setAccessible(true);
            method.invoke(file,key);
        } catch (IllegalAccessException | NoSuchMethodException | InvocationTargetException e) {
            e.printStackTrace();
        }
        try {
            Method method = S3File_Base.class.getDeclaredMethod("setBucket", String.class);
            method.setAccessible(true);
            method.invoke(file,repo.getS3Storage().getDefaultBucket());
        } catch (IllegalAccessException | NoSuchMethodException | InvocationTargetException e) {
            e.printStackTrace();
        }
        
        file.setStorage(repo.getS3Storage());
        repo.getS3Storage().getS3EndpointSet().forEach(file::addS3Endpoint);
    }

    private <T> void chunkalhate(List<T> set, Consumer<T> consumer, int chunkSize) {
        AtomicInteger chunks = new AtomicInteger(0);
        Lists.partition(set, chunkSize).forEach(setChunk -> {
            FenixFramework.atomic(() -> setChunk.forEach(consumer));
            taskLog(System.currentTimeMillis() + "Chunk complete, total: " + chunks.incrementAndGet() * chunkSize);
        });
    }

}
