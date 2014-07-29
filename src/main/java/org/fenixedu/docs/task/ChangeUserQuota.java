package org.fenixedu.docs.task;

import org.fenixedu.bennu.core.domain.User;
import org.fenixedu.bennu.scheduler.custom.CustomTask;
import org.fenixedu.docs.domain.DirNode;
import org.fenixedu.docs.domain.FileRepository;

public class ChangeUserQuota extends CustomTask {

    @Override
    public void runTask() throws Exception {
        final User admin = User.findByUsername("admin");
        final DirNode repo = FileRepository.getOrCreateFileRepository(admin);
        repo.setQuota(new Long(21474836480L));
    }

}
