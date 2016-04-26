package org.fenixedu;

import pt.ist.fenixframework.Atomic;
import pt.ist.fenixframework.Atomic.TxMode;
import pt.ist.fenixframework.FenixFramework;

import java.util.stream.Stream;

import org.fenixedu.bennu.core.domain.Bennu;
import org.fenixedu.bennu.core.domain.User;
import org.fenixedu.bennu.scheduler.custom.CustomTask;
import org.fenixedu.drive.domain.AbstractFileNode;
import org.fenixedu.drive.domain.DirNode;
import org.fenixedu.drive.domain.FileNode;
import org.fenixedu.drive.domain.VersionedFile;
import org.fenixedu.s3.domain.S3Storage;

/**
 * Created by diutsu on 13/07/16.
 */
public class UploadFilestoS3 extends CustomTask{
    @Override
    public TxMode getTxMode() {
        return TxMode.READ;
    }
    
    @Override
    public void runTask() throws Exception {
        Stream.concat(
            Bennu.getInstance().getRepositorySet().stream(),
            Bennu.getInstance().getUserSet().stream()
                .filter(user -> user.getFileRepository() != null)
                .map(User::getFileRepository))
        .forEach(repo -> FenixFramework.atomic(()->{
            repo.setS3Storage(Bennu.getInstance().getDefaultS3Storage());
            repo.setDefaultBucket(repo.getSlug());
            getRepoArray(repo).forEach(versionedFile -> upload(Bennu.getInstance().getDefaultS3Storage(), versionedFile,
                repo.getSlug()));
        }));
    }
    
    
    private Stream<VersionedFile> getRepoArray(DirNode repo){
        return flatChild(repo)
            .map(file->file.getDocument().getLastVersionedFile())
            .flatMap(this::streamPrevious);
    }
    
    private Stream<VersionedFile> streamPrevious(VersionedFile versionedFile) {
        if(versionedFile== null){
            return Stream.empty();
        }
        return Stream.concat(Stream.of(versionedFile), streamPrevious(versionedFile.getPreviousVersion()));
    }
    
    private Stream<FileNode> flatChild(DirNode node) {
        return Stream.concat(
            Stream.concat(Stream.of(node.getTrash()),
                node.getChildSet().stream())
                .filter(AbstractFileNode::isDir).filter(AbstractFileNode::isShared)
                .flatMap(child ->flatChild((DirNode) child)),
            node.getChildSet().stream().filter(AbstractFileNode::isFile).filter(AbstractFileNode::isShared).map(child ->
                (FileNode) child));
    }
    
    private void upload(S3Storage storage, VersionedFile versionedFile, String bucketname) {
        versionedFile.setStorage(storage);
        versionedFile.setBucket(bucketname);
        storage.getS3EndpointSet().forEach(versionedFile::addS3Endpoint);
    }
    
}
