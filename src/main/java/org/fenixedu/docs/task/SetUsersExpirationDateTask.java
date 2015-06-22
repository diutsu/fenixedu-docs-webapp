package org.fenixedu.docs.task;

import org.fenixedu.bennu.core.domain.Bennu;
import org.fenixedu.bennu.core.domain.User;
import org.fenixedu.bennu.scheduler.custom.CustomTask;

public class SetUsersExpirationDateTask extends CustomTask {

    @Override
    public void runTask() throws Exception {
        for (User user : Bennu.getInstance().getUserSet()) {
            user.closeLoginPeriod();
        }
        User.findByUsername("ist24439").openLoginPeriod();
        User.findByUsername("ist152416").openLoginPeriod();
    }
}