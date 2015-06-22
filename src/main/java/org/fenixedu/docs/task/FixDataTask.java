package org.fenixedu.docs.task;

import org.fenixedu.bennu.core.domain.User;
import org.fenixedu.bennu.scheduler.custom.CustomTask;
import org.fenixedu.drive.domain.DirNode;

import pt.ist.fenixframework.FenixFramework;

public class FixDataTask extends CustomTask {

    @Override
    public void runTask() throws Exception {
        User user = User.findByUsername("ist24439");
        DirNode root = FenixFramework.getDomainObject("7078106103810");
        DirNode favs = FenixFramework.getDomainObject("570028059525261");
        favs.setFavoritesFolderUser(user);
        root.setUser(user);
    }

}
