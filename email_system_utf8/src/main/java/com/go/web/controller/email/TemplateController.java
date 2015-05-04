package com.go.web.controller.email;

import com.go.base.SystemVariable;
import com.go.email.bean.Template;
import com.go.email.service.TemplateService;
import com.go.user.bean.User;
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
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created with IntelliJ IDEA.
 * User: xujian
 * Date: 14-9-17
 * Time: 下午2:29
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping("/email")
public class TemplateController {

    @RequestMapping(value = "/templateList.html", method = RequestMethod.GET)
    public String templateList(HttpServletRequest req, Model model,
                               @RequestParam(value="page",required = true,defaultValue = "1") int page) {
        User user = (User)req.getAttribute("currentUser");
        PageInfo<Template> pageInfo = templateService.getPageInfo(user.getUid(),page,10);

        model.addAttribute("pageInfo",pageInfo);
        return "email/template/template_list";
    }

    @RequestMapping(value = "/newTemplate.html", method = RequestMethod.GET)
    public String newTemplate(HttpServletRequest req, Model model,
                              @RequestParam(value="tid",required = true,defaultValue = "0") int tid) {
        Template template = null;
        if (tid != 0){
            template = templateService.getById(tid);
            if (template.getContent().contains("{#emailUserName}"))
                model.addAttribute("name",1);
        }

        model.addAttribute("template",template);
        model.addAttribute("tid",tid);
        return "email/template/editor2";
    }

    @RequestMapping(value = "/addTemplate.html", method = RequestMethod.POST)
    public String addTemplate(HttpServletRequest req, Model model,
                              @RequestParam(value="tid",required = false,defaultValue = "0") int tid,
                              @RequestParam(value="addName",required = false,defaultValue = "0") int addName,
                              @RequestParam(value="t_title",required = true,defaultValue = "") String t_title,
                              @RequestParam(value="editor01",required = true,defaultValue = "") String editor01) {
        User user = (User)req.getAttribute("currentUser");
        Template template = new Template();
        template.setUid(user.getUid());

        template.setOriginal(editor01);
        String content = replaceUrl(editor01);
        if (addName == 1 && !content.contains("{#emailUserName}")){
            content = "<p>亲爱的{#emailUserName}</p><br/>"+content;
        }else if (addName == 0 && content.contains("{#emailUserName}")){
            String[] contentArray = content.split("emailUserName}</p>");
            content = contentArray[1];
        }
        if (!content.contains("report/open.jpg")){
            content = content + "<table style='display:none'><tr><td><img src='"+systemVariable.getHost()+"report/open.jpg?{#tid=0}&{#mid=0}&{#gid=0}&{#uid=0}'/></td></tr>";
        }
        if (!content.contains("report/unsubscribe.html")){
            content = content + "<table><tr><td>If you don't want to receive these Emails, please click <a href='"+systemVariable.getHost()+"report/unsubscribe.html?{#tid=0}&{#mid=0}&{#gid=0}&{#uid=0}' target='_blank'>unsubscribe</a>.</td></tr></table>";
        }

        template.setTitle(t_title);
        template.setContent(content);

        if (tid == 0)
            templateService.addTemplate(template);
        else {
            template.setId(tid);
            templateService.update(template);
        }

        return "redirect:/email/templateList.html";
    }

    @RequestMapping(value = "/deleteTemplate.html", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult deleteTemplate(HttpServletRequest req, Model model,
                                     @RequestParam(value="tid",required = false,defaultValue = "0") int tid) {

        templateService.deleteById(tid);
        return new JsonResult(true);
    }

    @RequestMapping(value = "/preview.html", method = RequestMethod.GET)
    public String preview(HttpServletRequest req, Model model,
                          @RequestParam(value="tid",required = true,defaultValue = "0") int tid) {

        Template template = templateService.getById(tid);

        model.addAttribute("template",template);
        return "email/template/preview";
    }

    private String replaceUrl(String template){
        String regex = "<a\\s.*?href\\s*=\\s*\'?\"?([^(\\s\")]+)\\s*\'?\"?[^>]*>";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(template);
        StringBuffer result = new StringBuffer();
        while (matcher.find()) {
            StringBuffer replace = new StringBuffer();
            String matchStr = matcher.group();
            //replace.append("<a href=\"").append();
            if (matchStr.contains("report/click.html"))
                replace.append(matchStr);
            else
                replace.append(matchStr.replaceAll("http",systemVariable.getHost()+"report/click.html?{#tid=0}&{#mid=0}&{#gid=0}&{#uid=0}&redirect=http"));
            if (replace.toString().contains("$"))
                matcher.appendReplacement(result, java.util.regex.Matcher.quoteReplacement(replace.toString()));
            else
                matcher.appendReplacement(result, replace.toString());
        }
        matcher.appendTail(result);
        return result.toString();
    }

    @Autowired
    private TemplateService templateService = null;

    @Autowired
    private SystemVariable systemVariable = null;

}
