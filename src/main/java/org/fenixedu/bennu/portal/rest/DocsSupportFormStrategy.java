package org.fenixedu.bennu.portal.rest;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

import org.joda.time.DateTime;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.common.base.Joiner;

public class DocsSupportFormStrategy implements SupportFormResource.SupportFormStrategy {

    final static String fileSeparator = System.getProperty("file.separator");
    final static String home = System.getProperty("user.home");
    final static String basePath;
    final static Logger logger = LoggerFactory.getLogger(DocsSupportFormStrategy.class);

    static {
        basePath = Joiner.on(fileSeparator).join(System.getProperty("user.home"), "store", "support-forms");
        final File f = new File(basePath);
        if (!f.exists()) {
            boolean mkdirs = f.mkdirs();
            if (!mkdirs) {
                logger.error("Couldn't create parent dirs {}", f.getAbsolutePath());
            } else {
                logger.debug("Parent dirs for support form logs created {}", f.getAbsolutePath());
            }
        }
    }

    @Override
    public void processSupportForm(StringBuilder formText) {

        try (FileWriter writer = getWriter()) {
            writer.write(formText.toString());
        } catch (IOException e) {
            logger.error(e.toString());
        }
    }

    public FileWriter getWriter() throws IOException {
        String path = Joiner.on(fileSeparator).join(basePath, new DateTime().toString("dd_M_YYYY__HH_mm_ss_SSSS") + ".log");
        logger.debug("write support form to {}", path);
        File file = new File(path);
        if (file.exists()) {
            return getWriter();
        }

        file.createNewFile();
        return new FileWriter(file);
    }
}
