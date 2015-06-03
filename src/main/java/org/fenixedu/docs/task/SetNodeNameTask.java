package org.fenixedu.docs.task;

import org.fenixedu.bennu.core.domain.User;
import org.fenixedu.bennu.scheduler.custom.CustomTask;
import org.fenixedu.docs.domain.AbstractFileNode;
import org.fenixedu.docs.domain.DirNode;

import com.google.common.base.Strings;

public class SetNodeNameTask extends CustomTask {

    @Override
    public void runTask() throws Exception {
        final User tiago = User.findByUsername("tiago");
        process(tiago.getFileRepository());
    }

    private void process(DirNode fileRepository) {
        for (AbstractFileNode node : fileRepository.getChildSet()) {
            if (node.isDir()) {
                process((DirNode) node);
            }
            if (Strings.isNullOrEmpty(node.getSlug())) {
                node.setName(node.getDisplayName());
                taskLog("set slug %s for %s\n", node.getSlug(), node.getName());
            }
        }

    }

}
