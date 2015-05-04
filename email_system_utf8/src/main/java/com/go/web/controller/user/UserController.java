package com.go.web.controller.user;

import com.go.email.bean.ConfigGroup;
import com.go.email.service.ConfigGroupService;
import com.go.user.bean.LoginRet;
import com.go.user.bean.User;
import com.go.user.bean.UserScore;
import com.go.user.service.UserScoreService;
import com.go.user.service.UserService;
import com.go.util.PageInfo;
import com.go.web.util.GeneralUtil;
import com.go.web.util.JsonResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 14-9-13
 * Time: 上午7:41
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @RequestMapping(value = "/login.html", method = RequestMethod.GET)
    public String loginPage(HttpServletRequest req, Model model) {

        return "/user/login";
    }

    @RequestMapping(value = "/logout.html", method = RequestMethod.GET)
    public String logout(HttpServletRequest req,HttpServletResponse resp, Model model) {
        GeneralUtil.dropCookie(resp,"uid");
        return "/user/login";
    }

    @RequestMapping(value = "/login.html", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult login(HttpServletRequest req,HttpServletResponse resp, Model model,
                            @RequestParam(value="uid",required = true,defaultValue = "0") int uid,
                            @RequestParam(value="username",required = true,defaultValue = "") String username,
                            @RequestParam(value="password",required = true,defaultValue = "") String password) {

        LoginRet ret = userService.login(resp,uid,username,password);
        if (ret.getCode() == 0)
            return new JsonResult(true);
        else
            return new JsonResult(false);
    }

    @RequestMapping(value = "/register.html", method = RequestMethod.GET)
    public String registerView(HttpServletRequest req, Model model,
                               @RequestParam(value="uid",required = false,defaultValue = "0") int uid) {
        if (uid != 0){
            User user = userService.getById(uid);
            model.addAttribute("user",user);
        }
        return "/user/register";
    }

    @RequestMapping(value = "/register.html", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult register(HttpServletRequest req, Model model,
                               @RequestParam(value="uid",required = false,defaultValue = "0") int uid,
                               @RequestParam(value="email",required = true,defaultValue = "") String email,
                               @RequestParam(value="username",required = true,defaultValue = "") String username,
                               @RequestParam(value="password",required = true,defaultValue = "") String password) {
        User currentUser = (User)req.getAttribute("currentUser");
        if (currentUser.getUserType() != 1)
            return new JsonResult(false);
        if (uid != 0){
            User user = new User();
            user.setUid(uid);
            user.setEmail(email);
            user.setUsername(username);
            user.setPassword(password);
            userService.update(user);
        }else{
            User user = new User();
            user.setEmail(email);
            user.setUsername(username);
            user.setPassword(password);
            userService.register(user);
        }
        return new JsonResult(0);
    }

    @RequestMapping(value = "/list.html", method = RequestMethod.GET)
    public String list(HttpServletRequest req, Model model,
                       @RequestParam(value="page",required = true,defaultValue = "1") int page) {
        User currentUser = (User)req.getAttribute("currentUser");
        if (currentUser.getUserType() != 1)
            return "/error/404";
        PageInfo pageInfo = userService.getPageInfo(0,page,10);
        model.addAttribute("pageInfo",pageInfo);

        PageInfo<ConfigGroup> pageInfo2 = configGroupService.getPageInfo(1, 100);

        model.addAttribute("pageInfo2",pageInfo2);
        model.addAttribute("currentUser",currentUser);
        model.addAttribute("addType",0);
        model.addAttribute("page",page);
        return "/user/list";
    }

    @RequestMapping(value = "/addScore.html", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult addScore(HttpServletRequest req, Model model,
                               @RequestParam(value="uid",required = true,defaultValue = "0") int uid,
                               @RequestParam(value="score",required = true,defaultValue = "0") int score) {
        User currentUser = (User)req.getAttribute("currentUser");
        if (currentUser.getUserType() != 1)
            return new JsonResult(false);
        UserScore userScore = new UserScore();
        userScore.setUid(uid);
        userScore.setScoreChange(score);
        userScore.setAction("充值"+score);
        userScoreService.add(userScore);

        userService.updateScore(uid,score);
        return new JsonResult(0);
    }

    @Autowired
    private UserService userService = null;

    @Autowired
    private UserScoreService userScoreService = null;

    @Autowired
    private ConfigGroupService configGroupService = null;

}
