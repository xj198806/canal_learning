package com.go.web.listener;

import com.go.web.util.SpringContext;

import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 *
 * @author: lujian
 * @date: 2011-11-29 12:32
 */
public class ContextListener implements ServletContextListener {


    public void contextInitialized(ServletContextEvent sce) {
        SpringContext.setApplicationContext(WebApplicationContextUtils.getWebApplicationContext(sce.getServletContext()));
        SpringContext.setRealPath(sce.getServletContext().getRealPath("/"));
    }

    public void contextDestroyed(ServletContextEvent sce) {
    }
}
