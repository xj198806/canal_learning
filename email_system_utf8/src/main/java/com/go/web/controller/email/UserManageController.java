package com.go.web.controller.email;

import com.go.user.bean.User;
import com.go.user.bean.UserScore;
import com.go.user.service.UserScoreService;
import com.go.user.service.UserService;
import com.go.util.PageInfo;
import com.go.web.util.JsonResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * Created with IntelliJ IDEA.
 * User: xujian
 * Date: 14-12-3
 * Time: 下午1:58
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping("/email")
public class UserManageController {

    @RequestMapping(value = "/user/register.html", method = RequestMethod.GET)
    public String registerView(HttpServletRequest req, Model model,
                               @RequestParam(value="uid",required = false,defaultValue = "0") int uid) {
        if (uid != 0){
            User user = userService.getById(uid);
            model.addAttribute("user",user);
        }
        model.addAttribute("addType",1);
        return "/user/register";
    }

    @RequestMapping(value = "/user/register.html", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult register(HttpServletRequest req, Model model,
                               @RequestParam(value="uid",required = false,defaultValue = "0") int uid,
                               @RequestParam(value="email",required = true,defaultValue = "") String email,
                               @RequestParam(value="username",required = true,defaultValue = "") String username,
                               @RequestParam(value="password",required = true,defaultValue = "") String password) {
        User currentUser = (User)req.getAttribute("currentUser");
        if (uid != 0){
            User user = new User();
            user.setUid(uid);
            user.setParentUid(currentUser.getUid());
            user.setEmail(email);
            user.setUsername(username);
            user.setPassword(password);
            userService.update(user);
        }else{
            User user = new User();
            user.setEmail(email);
            user.setParentUid(currentUser.getUid());
            user.setUsername(username);
            user.setPassword(password);
            userService.register(user);
        }
        return new JsonResult(1);
    }

    @RequestMapping(value = "/user/list.html", method = RequestMethod.GET)
    public String list(HttpServletRequest req, Model model,
                       @RequestParam(value="page",required = true,defaultValue = "1") int page) {
        User currentUser = (User)req.getAttribute("currentUser");
        PageInfo pageInfo = userService.getPageInfo(currentUser.getUid(), page,10);
        model.addAttribute("pageInfo",pageInfo);

        model.addAttribute("currentUser",currentUser);
        model.addAttribute("addType",1);
        model.addAttribute("page",page);
        return "/user/list";
    }

    @RequestMapping(value = "/user/addScore.html", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult addScore(HttpServletRequest req, Model model,
                               @RequestParam(value="uid",required = true,defaultValue = "0") int uid,
                               @RequestParam(value="score",required = true,defaultValue = "0") int score) {
        User currentUser = (User)req.getAttribute("currentUser");
        if (score > currentUser.getScore())
            return new JsonResult(false);

        userService.updateScore(uid,score);
        UserScore userScore = new UserScore();
        userScore.setUid(uid);
        userScore.setScoreChange(score);
        userScore.setAction("充值"+score);
        userScoreService.add(userScore);

        userService.updateScore(currentUser.getUid(),-score);
        UserScore userScore2 = new UserScore();
        userScore2.setUid(uid);
        userScore2.setScoreChange(score);
        userScore2.setAction("为子账户充值-"+score);
        userScoreService.add(userScore2);
        return new JsonResult(1);
    }

    @Autowired
    private UserService userService = null;

    @Autowired
    private UserScoreService userScoreService = null;

}
