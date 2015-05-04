package com.go.web.controller.email;

import com.go.email.bean.EmailGroup;
import com.go.email.service.EmailListService;
import com.go.email.service.EmailLogService;
import com.go.user.bean.User;
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
 * Date: 14-11-4
 * Time: 上午10:56
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping("/report")
public class ReportController {

    @RequestMapping(value = "/click.html", method = RequestMethod.GET)
    public String click(HttpServletRequest req, Model model,
                        @RequestParam(value="gid",required = false,defaultValue = "0") int gid,
                        @RequestParam(value="tid",required = false,defaultValue = "0") int tid,
                        @RequestParam(value="uid",required = false,defaultValue = "0") int uid,
                        @RequestParam(value="mid",required = false,defaultValue = "0") int mid,
                        @RequestParam(value="tplId",required = false,defaultValue = "0") int tplId,
                        @RequestParam(value="redirect",required = false,defaultValue = "") String redirect) {
        emailLogService.updateUv(tid,mid);


        return "redirect:"+redirect;
    }

    @RequestMapping(value = "/unsubscribe.html", method = RequestMethod.GET)
    public String unsubscribe(HttpServletRequest req, Model model,
                              @RequestParam(value="gid",required = false,defaultValue = "0") int gid,
                              @RequestParam(value="tid",required = false,defaultValue = "0") int tid,
                              @RequestParam(value="uid",required = false,defaultValue = "0") int uid,
                              @RequestParam(value="mid",required = false,defaultValue = "0") int mid,
                              @RequestParam(value="tplId",required = false,defaultValue = "0") int tplId) {
        emailLogService.updateStatus(3, tid, mid);
        emailListService.updateStatus(1,mid);
        return "/email/success";
    }

    @RequestMapping(value = "/open.jpg", method = RequestMethod.GET)
    @ResponseBody
    public JsonResult open(HttpServletRequest req, Model model,
                           @RequestParam(value="gid",required = false,defaultValue = "0") int gid,
                           @RequestParam(value="tid",required = false,defaultValue = "0") int tid,
                           @RequestParam(value="uid",required = false,defaultValue = "0") int uid,
                           @RequestParam(value="mid",required = false,defaultValue = "0") int mid,
                           @RequestParam(value="tplId",required = false,defaultValue = "0") int tplId) {
        emailLogService.updatePv(tid,mid);

        return new JsonResult(true);
    }

    @Autowired
    private EmailLogService emailLogService = null;

    @Autowired
    private EmailListService emailListService = null;

}
