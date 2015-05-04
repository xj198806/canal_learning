package com.go.web.controller;

import com.go.email.bean.EmailTask;
import com.go.email.service.EmailTaskService;
import com.go.user.bean.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: xujian
 * Date: 13-10-28
 * Time: 下午1:10
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping("/email")
public class IndexController {

    @RequestMapping(value = "/edit.html", method = RequestMethod.GET)
    public String edit(HttpServletRequest req, Model model) {

        return "email/demo";
    }

    @RequestMapping(value = "/index.html", method = RequestMethod.GET)
    public String index(HttpServletRequest req, Model model) {
        User user = (User)req.getAttribute("currentUser");

        List<EmailTask> tasks = emailTaskService.getList(user.getUid(),-1);

        List<EmailTask> timeTasks = new ArrayList<EmailTask>();
        List<EmailTask> ingTasks = new ArrayList<EmailTask>();
        List<EmailTask> doneTasks = new ArrayList<EmailTask>();
        for (EmailTask task : tasks){
            if(task.getStatus() == 1)
                doneTasks.add(task);
            else if (task.getSendDate().getTime() <= new Date().getTime())
                ingTasks.add(task);
            else
                timeTasks.add(task);
        }

        model.addAttribute("user",user);
        model.addAttribute("timeTasks",timeTasks);
        model.addAttribute("ingTasks",ingTasks);
        model.addAttribute("doneTasks",doneTasks);
        model.addAttribute("date",new Date());
        return "email/index";
    }

    @Autowired
    private EmailTaskService emailTaskService = null;
}
