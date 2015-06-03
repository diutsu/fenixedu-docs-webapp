package org.fenixedu.docs.task;

import java.util.Locale;

import org.fenixedu.bennu.core.domain.User;
import org.fenixedu.bennu.core.domain.UserProfile;
import org.fenixedu.bennu.scheduler.custom.CustomTask;

public class ChangeUserLocale extends CustomTask {

    @Override
    public void runTask() throws Exception {
        final User admin = User.findByUsername("admin");
        final Locale locale = Locale.forLanguageTag("en-GB");
        if (admin.getProfile() == null) {
            admin.setProfile(new UserProfile("admin", "admin", "admin", "admin@admin.eu", locale));
        } else {
            admin.getProfile().setPreferredLocale(locale);
        }
    }

}
