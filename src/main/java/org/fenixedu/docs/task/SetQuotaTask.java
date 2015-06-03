package org.fenixedu.docs.task;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import jersey.repackaged.com.google.common.collect.Lists;

import org.fenixedu.bennu.core.domain.Bennu;
import org.fenixedu.bennu.core.domain.User;
import org.fenixedu.bennu.scheduler.custom.CustomTask;
import org.fenixedu.docs.domain.DirNode;

import pt.ist.fenixframework.Atomic.TxMode;
import pt.ist.fenixframework.CallableWithoutException;
import pt.ist.fenixframework.FenixFramework;

public class SetQuotaTask extends CustomTask {

    private static final int PARTITION_SIZE = 1000;
    private static final long DEFAULT_QUOTA = 20_000_000_000L;

    @Override
    public TxMode getTxMode() {
        return TxMode.READ;
    }

    @Override
    public void runTask() throws Exception {
        final Set<User> userSet = Bennu.getInstance().getUserSet();
        Lists.partition(new ArrayList(userSet), PARTITION_SIZE).forEach(users -> {
            changeQuota((List<User>) users);
        });
    }

    public void changeQuota(List<User> users) {
        FenixFramework.getTransactionManager().withTransaction(new CallableWithoutException<Void>() {

            @Override
            public Void call() {
                taskLog("Processing users %d\n", users.size());
                for (User user : users) {
                    final DirNode repo = user.getFileRepository();
                    if (repo != null && repo.getQuota() != DEFAULT_QUOTA) {
                        repo.setQuota(DEFAULT_QUOTA);
                    }
                }
                return null;
            }

        });
    }
}
