package org.fenixedu.docs.task;

import java.util.ArrayList;
import java.util.List;

import org.fenixedu.bennu.core.domain.Bennu;
import org.fenixedu.bennu.core.domain.User;
import org.fenixedu.bennu.scheduler.custom.CustomTask;
import org.fenixedu.drive.domain.DirNode;
import org.fenixedu.drive.domain.FileManagementSystem;

import pt.ist.fenixframework.Atomic.TxMode;
import pt.ist.fenixframework.CallableWithoutException;
import pt.ist.fenixframework.FenixFramework;

import com.google.common.collect.Lists;

public class ChangeUserPasswordAndQuotaTask extends CustomTask {

    private static final int PARTITION_SIZE = 1000;
    private static final long DEFAULT_QUOTA = 20000000000L;

    String defaultPassword;
    String rootPassword;

    @Override
    public TxMode getTxMode() {
        return TxMode.READ;
    }

    @Override
    public void runTask() throws Exception {

        defaultPassword = System.getenv("DOCS_DEFAULT_PASSWORD");
        if (defaultPassword == null) {
            throw new Error("Must define DOCS_DEFAULT_PASSWORD env variable");
        }

        rootPassword = System.getenv("DOCS_ROOT_PASSWORD");
        if (rootPassword == null) {
            throw new Error("Must define DOCS_ROOT_PASSWORD env variable");
        }

        int i = 0;
        List<User> users = new ArrayList<>(Bennu.getInstance().getUserSet());
        taskLog("Number of users %d\n", users.size());
        for (List<User> partition : Lists.partition(users, PARTITION_SIZE)) {
            changeQuota(partition);
            taskLog("Processing %d\n", ++i * PARTITION_SIZE);
        }

        changeAdminPassword();
    }

    void changeQuota(List<User> users) {
        FenixFramework.getTransactionManager().withTransaction(new CallableWithoutException<Void>() {

            @Override
            public Void call() {
                taskLog("Processing users %d\n", users.size());
                for (User user : users) {
                    final DirNode repo = FileManagementSystem.getOrCreateFileRepository(user);
                    if (repo.getQuota() != DEFAULT_QUOTA) {
                        repo.setQuota(DEFAULT_QUOTA);
                    }
                    user.changePassword(defaultPassword);
                }
                return null;
            }

        });
    }

    void changeAdminPassword() {
        FenixFramework.getTransactionManager().withTransaction(new CallableWithoutException<Void>() {

            @Override
            public Void call() {
                User.findByUsername("admin").changePassword(rootPassword);
                return null;
            }
        });
    }
}
