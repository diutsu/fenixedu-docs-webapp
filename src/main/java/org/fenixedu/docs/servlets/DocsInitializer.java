package org.fenixedu.docs.servlets;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import org.fenixedu.bennu.core.util.CoreConfiguration;
import org.fenixedu.bennu.portal.rest.DocsSupportFormStrategy;
import org.fenixedu.bennu.portal.rest.SupportFormResource;

@WebListener
public class DocsInitializer implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        if (CoreConfiguration.getConfiguration().developmentMode()) {
            SupportFormResource.registerSupportFormStrategy(new DocsSupportFormStrategy());
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {

    }

}
