package org.fenixedu.docs.task;

import org.fenixedu.bennu.core.domain.Bennu;
import org.fenixedu.bennu.core.domain.User;
import org.fenixedu.bennu.scheduler.custom.CustomTask;
import org.joda.time.LocalDate;

public class SetUsersExpirationDateTask extends CustomTask {

    @Override
    public void runTask() throws Exception {
        for (User user : Bennu.getInstance().getUserSet()) {
            user.setExpiration(new LocalDate().minusDays(1));
        }
        User.findByUsername("ist24439").setExpiration(null);
        User.findByUsername("ist152416").setExpiration(null);
    }
}