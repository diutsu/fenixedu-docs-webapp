package org.fenixedu.docs.task;

import java.util.ArrayList;
import java.util.List;

import jersey.repackaged.com.google.common.collect.Lists;

import org.fenixedu.bennu.core.domain.Bennu;
import org.fenixedu.bennu.core.domain.User;
import org.fenixedu.bennu.scheduler.custom.CustomTask;
import org.fenixedu.drive.domain.AbstractFileNode;
import org.fenixedu.drive.domain.DirNode;
import org.fenixedu.drive.domain.FileNode;

import pt.ist.fenixframework.Atomic.TxMode;
import pt.ist.fenixframework.FenixFramework;

public class FillSlugOfDirNodesTask extends CustomTask {

    @Override
    public TxMode getTxMode() {
        return TxMode.READ;
    }

    @Override
    public void runTask() throws Exception {
        taskLog("Going over %d users\n", Bennu.getInstance().getUserSet().size());

        List<List<User>> users = Lists.partition(new ArrayList<>(Bennu.getInstance().getUserSet()), 1000);
        int i = 0;
        for (List<User> userList : users) {
            FenixFramework.atomic(() -> {
                dealWith(userList);
            });
            taskLog("Doing %d users ...\n", ++i * 1000);
        }
    }

    private void dealWith(List<User> users) {
        for (User user : users) {
//            FileManagementSystem.getOrCreateFileRepository(user);
            final DirNode repo = user.getFileRepository();
            if (repo != null) {
                fixSlug(repo);
                if (user.getSharedFolder() != null) {
                    fixSlug(user.getSharedFolder());
                }
            }
        }
    }

    private void fixSlug(AbstractFileNode node) {
        if (node.isShared()) {
            return;
        }
        if (node instanceof DirNode) {
            final User user = ((DirNode) node).getUser();
            node.setName(user != null ? user.getUsername() : node.getName());
            for (AbstractFileNode child : ((DirNode) node).getChildSet()) {
                fixSlug(child);
            }
        } else if (node instanceof FileNode) {
            node.setName(node.getDisplayName());
        }
    }
}
