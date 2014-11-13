package org.fenixedu.docs.task;

import java.util.Locale;
import java.util.Optional;

import org.fenixedu.bennu.core.domain.Bennu;
import org.fenixedu.bennu.core.domain.User;
import org.fenixedu.bennu.core.domain.UserProfile;
import org.fenixedu.bennu.core.groups.AnyoneGroup;
import org.fenixedu.bennu.core.groups.Group;
import org.fenixedu.bennu.core.groups.LoggedGroup;
import org.fenixedu.bennu.core.groups.UserGroup;
import org.fenixedu.bennu.scheduler.custom.CustomTask;
import org.fenixedu.commons.i18n.LocalizedString;
import org.fenixedu.docs.domain.DirNode;

public class CreateRepositoriesTask extends CustomTask {

    @Override
    public void runTask() throws Exception {

        User rita = getUser("rita");
        User sergio = getUser("sergio");
        User sandro = getUser("sandro");
        User joao = getUser("joao");

        LocalizedString type =
                new LocalizedString.Builder().with(Locale.forLanguageTag("pt-PT"), "Unidade")
                        .with(Locale.forLanguageTag("en-GB"), "Unit").build();

        DirNode repoMtaForte = getRepo(UserGroup.of(sergio, sandro, joao, rita), type, "Sala muita forte");

        rita.addRepository(repoMtaForte);
        sergio.addRepository(repoMtaForte);
        sandro.addRepository(repoMtaForte);
        joao.addRepository(repoMtaForte);

        User tiago = getUser("tiago");
        User joana = getUser("joana");

        DirNode repoSalaBoss = getRepo(UserGroup.of(tiago, joana), type, "Sala boss");

        tiago.addRepository(repoSalaBoss);
        joana.addRepository(repoSalaBoss);

        DirNode repoIST = getRepo(LoggedGroup.get(), type, "Instituto Superior Técnico");

        DirNode publico = getRepo(AnyoneGroup.get(), type, "Público");
    }

    private DirNode getRepo(final Group group, final LocalizedString type, final String name) {
        final Optional<DirNode> findAny =
                Bennu.getInstance().getRepositorySet().stream().filter(r -> r.getDisplayName().equals(name)).findAny();
        if (findAny.isPresent()) {
            return findAny.get();
        }
        return new DirNode(name, type, group);
    }

    private User getUser(String username) {
        User userBoss = User.findByUsername(username);
        if (userBoss == null) {
            userBoss =
                    new User(username, new UserProfile(username, username, username, username + "@docs.eu", Locale.getDefault()));
        }
        return userBoss;
    }
}
