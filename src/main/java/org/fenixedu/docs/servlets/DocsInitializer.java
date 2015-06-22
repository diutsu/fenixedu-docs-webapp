package org.fenixedu.docs.servlets;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class DocsInitializer implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
//        if (CoreConfiguration.getConfiguration().developmentMode()) {
//            SupportFormResource.registerSupportFormStrategy(new DocsSupportFormStrategy());
//        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {

    }

}
