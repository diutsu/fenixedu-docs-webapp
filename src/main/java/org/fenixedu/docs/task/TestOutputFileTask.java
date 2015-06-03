package org.fenixedu.docs.task;

import org.fenixedu.bennu.scheduler.custom.CustomTask;

import pt.ist.fenixframework.Atomic.TxMode;

public class TestOutputFileTask extends CustomTask {

    @Override
    public TxMode getTxMode() {
        return TxMode.READ;
    }

    @Override
    public void runTask() throws Exception {
        taskLog("Let's output a bunch of files just for testing");

        output("file1.txt", "This is file one".getBytes());
        output("file2.txt", "This is file two".getBytes());
        output("file3.txt", "This is file three".getBytes());
    }

}
