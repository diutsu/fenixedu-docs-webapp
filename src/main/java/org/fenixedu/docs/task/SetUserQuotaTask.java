package org.fenixedu.docs.task;

import org.fenixedu.bennu.core.domain.User;
import org.fenixedu.bennu.scheduler.custom.CustomTask;
import org.fenixedu.drive.domain.FileManagementSystem;

public class SetUserQuotaTask extends CustomTask {

    @Override
    public void runTask() throws Exception {
        long quota = 21474836480L; // 20gb
        setQuota(User.findByUsername("ist400326"), quota);
    }

    private void setQuota(User user, long quota) {
        if (user != null) {
            FileManagementSystem.getOrCreateFileRepository(user).setQuota(quota);
            taskLog("set quota %s to %s\n", quota, user.getDisplayName());
        }
    }

}