/**
 *
 */
package com.go.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 * intercept the web request, and log the controller execution time.
 *
 * @author zhaoweiwei
 *
 * Jun 20, 2012
 */
public class ExecuteTimeInterceptor implements HandlerInterceptor {

    private static final Logger logger = Logger.getLogger(ExecuteTimeInterceptor.class);

    public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3) throws Exception {
        // TODO Auto-generated method stub

    }

    //after the handler is executed
    public void postHandle(HttpServletRequest request, HttpServletResponse arg1, Object handler, ModelAndView arg3) throws Exception {
        long startTime = (Long) request.getAttribute("startTime");
        long endTime = System.currentTimeMillis();

        long executeTime = endTime - startTime;
        logger.info("-----------------------[" + handler + "] executeTime : " + executeTime + " ms -------------------");
    }

    //before the actual handler will be executed
    public boolean preHandle(HttpServletRequest request, HttpServletResponse arg1, Object arg2) throws Exception {
        long startTime = System.currentTimeMillis();
        request.setAttribute("startTime", startTime);

        return true;
    }

}
