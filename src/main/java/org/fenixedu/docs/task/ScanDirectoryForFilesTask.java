package org.fenixedu.docs.task;

import java.io.File;
import java.io.IOException;
import java.nio.file.DirectoryStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.fenixedu.bennu.core.domain.User;
import org.fenixedu.bennu.scheduler.CronTask;
import org.fenixedu.bennu.scheduler.annotation.Task;
import org.fenixedu.drive.domain.DirNode;
import org.fenixedu.drive.domain.FileManagementSystem;

import pt.ist.fenixframework.Atomic.TxMode;
import pt.ist.fenixframework.FenixFramework;

@Task(englishTitle = "Scan directory for files and create them in user's scanned directory")
public class ScanDirectoryForFilesTask extends CronTask {
    private static final String SCANNED_DOCUMENTS_DIRNAME = "Documentos Digitalizados";

    @Override
    public TxMode getTxMode() {
        return TxMode.READ;
    }

    @Override
    public void runTask() throws Exception {
        //         String scannedFileDirectoryPath = ScannerDriveIntegrationConfiguration.getConfiguration().scannedFileDirectory();
        String scannedFileDirectoryPath = "/mnt/digibuffer/tmp";
        Path scanFileDirectory = Paths.get(scannedFileDirectoryPath);
        taskLog("Process existing files in %s\n", scannedFileDirectoryPath);
        processFiles(scanFileDirectory);
    }

    public static String getFilename(Path path) {
        return path.toFile().getName();
    }

    public static String getFilenameWithoutExtension(Path path) {
        final String filename = getFilename(path);
        return filename.substring(0, filename.lastIndexOf("."));
    }

    protected void processFiles(Path scanFileDirectory) throws IOException {
        try (DirectoryStream<Path> files = Files.newDirectoryStream(scanFileDirectory)) {
            for (Path file : files) {
                final String filename = getFilename(file);
                taskLog("Process file %s\n", filename);
                if (!filename.endsWith(".XST")) {

                    String lockDir = getFilenameWithoutExtension(file) + ".LCK";

                    if (scanFileDirectory.resolve(lockDir).toFile().exists()) {
                        taskLog("Skip %s. Lock file still exists.\n", filename);
                        continue;
                    }

                    createFile(file);
                } else {
                    taskLog("Ignore %s\n", filename);
                }
            }
        }
    }

    private void createFile(Path path) {
        File file = path.toFile();
        String name = file.getName();
        String username = name.substring(0, name.indexOf("_"));

        User user = User.findByUsername(username);
        if (user == null) {
            taskLog("Username %s does not exist, skip.\n", username);
            return;
        }
        try {
            FenixFramework.atomic(() -> writeFile(file, user));
            taskLog(file.delete() ? "delete file" : "can't delete file");
        } catch (Throwable e) {
            taskLog("Error occured: %s %s", e.getClass().getName(), e.getLocalizedMessage());
        }
    }

    private void writeFile(File file, User user) {
        DirNode userRepository = FileManagementSystem.getOrCreateFileRepository(user);

        DirNode scannedDocumentDir = userRepository.searchDir(SCANNED_DOCUMENTS_DIRNAME);
        if (scannedDocumentDir == null) {
            taskLog("create %s directory\n", SCANNED_DOCUMENTS_DIRNAME);
            scannedDocumentDir = userRepository.createDir(SCANNED_DOCUMENTS_DIRNAME, user);
        }
        taskLog("create file %s for %s\n", file.getName(), user.getDisplayName());
        scannedDocumentDir.createFile(file, file.getName(), file.getName(), file.length(), user);
    }

}
