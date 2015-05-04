package com.go.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

/**
 * Created with IntelliJ IDEA.
 * User: xujian
 * Date: 14-11-28
 * Time: 下午1:46
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping("/index.html")
public class SiteController {

    @RequestMapping(method = RequestMethod.GET)
    public String index(HttpServletRequest req, Model model) {
        return "index";
    }

}
