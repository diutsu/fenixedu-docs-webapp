package org.fenixedu.docs.task;

import java.util.Locale;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.fenixedu.bennu.core.domain.User;
import org.fenixedu.bennu.core.groups.Group;
import org.fenixedu.bennu.scheduler.custom.CustomTask;
import org.fenixedu.commons.i18n.LocalizedString;
import org.fenixedu.drive.domain.DirNode;
import org.fenixedu.drive.domain.FileManagementSystem;

public class CreateMOOCRepositoryTask extends CustomTask {

    @Override
    public void runTask() throws Exception {
        Set<User> users =
                Stream.of("ist25125", "ist12543", "ist24869", "ist24983", "ist173221", "ist12916", "ist165721")
                        .map(User::findByUsername).collect(Collectors.toSet());

        LocalizedString type =
                new LocalizedString.Builder().with(Locale.forLanguageTag("pt-PT"), "Projeto")
                        .with(Locale.forLanguageTag("en-GB"), "Project").build();

        DirNode repo = new DirNode("MOOC", type, Group.users(users.stream()));

        repo.setQuota(21_474_836_480L);

        users.forEach(u -> {
            u.openLoginPeriod();
            repo.addRepositoryUser(u);
            FileManagementSystem.getOrCreateFileRepository(u).setQuota(21_474_836_480L);
        });
    }

}
