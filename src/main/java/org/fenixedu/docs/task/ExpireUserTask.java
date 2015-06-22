package org.fenixedu.docs.task;

import org.fenixedu.bennu.core.domain.User;
import org.fenixedu.bennu.scheduler.custom.CustomTask;

public class ExpireUserTask extends CustomTask {

    @Override
    public void runTask() throws Exception {
        final User user = User.findByUsername("ist158444");
        user.closeLoginPeriod();
    }

}
