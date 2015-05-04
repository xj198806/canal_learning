package com.go.web.interceptor;

import com.go.user.bean.User;
import com.go.user.service.UserService;
import com.go.web.util.GeneralUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 14-9-13
 * Time: 上午7:37
 * To change this template use File | Settings | File Templates.
 */
public class UserInterceptor implements HandlerInterceptor {

    public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3) throws Exception {
        // TODO Auto-generated method stub

    }

    //after the handler is executed
    public void postHandle(HttpServletRequest request, HttpServletResponse arg1, Object handler, ModelAndView arg3) throws Exception {
        if (arg3 != null)
            arg3.getModelMap().addAttribute("currentUser",request.getAttribute("currentUser")) ;
    }

    //before the actual handler will be executed
    public boolean preHandle(HttpServletRequest request, HttpServletResponse arg1, Object arg2) throws Exception {
        Cookie cookie = GeneralUtil.getCookieByName(request,"uid");
        if (cookie != null) {
            int uid = Integer.parseInt(cookie.getValue());
            User user = userService.getById(uid);
            if (user == null) {
                arg1.sendRedirect("/user/login.html");
                return false;
            }
            else
                request.setAttribute("currentUser",user);

        } else{
            arg1.sendRedirect("/user/login.html");
            return false;
        }
        return true;
    }

    @Autowired
    private UserService userService = null;

}
