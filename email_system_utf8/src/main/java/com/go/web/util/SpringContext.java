package com.go.web.util;

import org.springframework.context.ApplicationContext;

/**
 * @author zhaoweiwei
 *
 *         May 9, 2012
 */
public class SpringContext {
    private static ApplicationContext applicationContext = null;

    private static String realPath = null;

    public static ApplicationContext getApplicationContext() {
        return applicationContext;
    }

    public static void setApplicationContext(ApplicationContext applicationContext) {
        SpringContext.applicationContext = applicationContext;
    }

    public static Object getBean(String name) {
        return applicationContext.getBean(name);
    }

    /**
     * @return the realPath
     */
    public static String getRealPath() {
        return realPath;
    }

    /**
     * @param realPath
     *            the realPath to set
     */
    public static void setRealPath(String realPath) {
        SpringContext.realPath = realPath;
    }
}
