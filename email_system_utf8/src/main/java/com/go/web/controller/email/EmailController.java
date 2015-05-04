package com.go.web.controller.email;

import com.go.base.TaskLog;
import com.go.email.bean.*;
import com.go.email.service.*;
import com.go.user.bean.User;
import com.go.user.service.UserService;
import com.go.util.ExcelUtil;
import com.go.util.ExcelUtils;
import com.go.util.PageInfo;
import com.go.web.util.JsonResult;
import com.go.web.util.SpringContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;


/**
 * Created with IntelliJ IDEA.
 * User: xujian
 * Date: 14-7-25
 * Time: 下午3:19
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping("/email")
public class EmailController {

    @RequestMapping(value = "/groupList.html", method = RequestMethod.GET)
    public String groupList(HttpServletRequest req, Model model,
                            @RequestParam(value="page",required = true,defaultValue = "1") int page) {
        User user = (User)req.getAttribute("currentUser");
        PageInfo<EmailGroup> pageInfo = emailGroupService.getPageInfo(user.getUid(),page,10);

        model.addAttribute("pageInfo",pageInfo);
        return "email/group/group_list";
    }

    @RequestMapping(value = "/addGroupPage.html", method = RequestMethod.GET)
    public String addGroupPage(HttpServletRequest req, Model model,
                               @RequestParam(value="groupId",required = false,defaultValue = "0") int groupId) {

        if (groupId != 0)
            model.addAttribute("group",emailGroupService.getById(groupId));
        return "email/group/add_group";
    }

    @RequestMapping(value = "/addGroup.html", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult addGroup(HttpServletRequest req, Model model,
                               @RequestParam(value="groupId",required = false,defaultValue = "0") int groupId,
                               @RequestParam(value="name",required = true,defaultValue = "") String name,
                               @RequestParam(value="desc",required = false,defaultValue = "") String desc) {
        if (groupId != 0) {
            EmailGroup group = new EmailGroup();
            group.setId(groupId);
            User user = (User)req.getAttribute("currentUser");
            group.setUid(user.getUid());
            group.setName(name);
            group.setDesc(desc);
            emailGroupService.update(group);
        }else{
            EmailGroup group = new EmailGroup();
            User user = (User)req.getAttribute("currentUser");
            group.setUid(user.getUid());
            group.setName(name);
            group.setDesc(desc);
            emailGroupService.add(group);
        }

        return new JsonResult(true);
    }

    @RequestMapping(value = "/deleteGroup.html", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult deleteGroup(HttpServletRequest req, Model model,
                                  @RequestParam(value="gid",required = false,defaultValue = "0") int gid) {

        emailGroupService.delete(gid);
        return new JsonResult(true);
    }

    @RequestMapping(value = "/deleteGroupList.html", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult deleteGroupList(HttpServletRequest req, Model model,
                                      @RequestParam(value="gid",required = false,defaultValue = "0") int gid) {

        emailGroupService.delete(gid);
        emailListService.deleteByGid(gid);
        return new JsonResult(true);
    }

    @RequestMapping(value = "/addList.html", method = RequestMethod.GET)
    public String addList(HttpServletRequest req, Model model,
                          @RequestParam(value="groupId",required = true,defaultValue = "0") int groupId) {
        model.addAttribute("groupId",groupId);
        return "email/group/add_list";
    }

    @RequestMapping(value="/uploadFile.html", method=RequestMethod.POST)
    public String uploadFile(User user, @RequestParam MultipartFile myFile, HttpServletRequest request, Model model,
                             @RequestParam(value="groupId",required = true,defaultValue = "0") int groupId) throws IOException {
        //如果只是上传一个文件，则只需要MultipartFile类型接收文件即可，而且无需显式指定@RequestParam注解
        String uploadName = "";
        if(myFile.isEmpty()){
            System.out.println("文件未上传");
        }else{
            System.out.println("文件长度: " + myFile.getSize());
            System.out.println("文件类型: " + myFile.getContentType());
            System.out.println("文件名称: " + myFile.getName());
            System.out.println("文件原名: " + myFile.getOriginalFilename());
            System.out.println("========================================");
            //如果用的是Tomcat服务器，则文件会上传到\\%TOMCAT_HOME%\\webapps\\YourWebProject\\WEB-INF\\upload\\文件夹中
            String realPath = UPLOAD_PATH;
            //这里不必处理IO流关闭的问题，因为FileUtils.copyInputStreamToFile()方法内部会自动把用到的IO流关掉，我是看它的源码才知道的
            try{
                String originalName =  myFile.getOriginalFilename();
                uploadName = System.currentTimeMillis() + originalName.substring(originalName.lastIndexOf("."));
                File file = new File(realPath + "/" + uploadName);
                myFile.transferTo(file);
                //saveFileFromInputStream(myFile.getInputStream(),realPath,myFile.getOriginalFilename());
            } catch(Exception e){

            }
        }
        model.addAttribute("groupId",groupId);
        return "redirect:/email/addConfig.html?fileName="+ uploadName;
    }

    @RequestMapping(value = "/addConfig.html", method = RequestMethod.GET)
    public String addConfig(HttpServletRequest req, Model model,
                            @RequestParam(value="groupId",required = true,defaultValue = "0") int groupId,
                            @RequestParam(value="fileName",required = true,defaultValue = "") String fileName) {
        String realPath = UPLOAD_PATH;
        List<List<Object>> result = null;
        try{
            String _fileName = fileName;
            model.addAttribute("decodeFileName",_fileName);
            File file = new File(realPath + "/" + _fileName);


            result = ExcelUtils.readExcel(file);


            /*int rowLength = result.length;
            for(int i=0;i<rowLength;i++) {
                rows.add(result[i][0]);
                for(int j=0;j<result[i].length;j++) {
                    System.out.print(result[i][j]+"\t\t");
                }
                System.out.println();
            }*/
        } catch (Exception e){
            e.printStackTrace();
        }
        model.addAttribute("groupId",groupId);
        model.addAttribute("result",result);
        model.addAttribute("fileName",fileName);
        return "email/group/add_config";
    }

    @RequestMapping(value = "/import.html", method = RequestMethod.GET)
    public String importPage(HttpServletRequest req, Model model,
                             @RequestParam(value="groupId",required = true,defaultValue = "0") int groupId,
                             @RequestParam(value="fileName",required = true,defaultValue = "") String fileName,
                             @RequestParam(value="rowSelect",required = true,defaultValue = "") String rowSelect) {
        EmailGroup group = emailGroupService.getById(groupId);

        model.addAttribute("rowSelect",rowSelect);
        model.addAttribute("fileName",fileName);
        model.addAttribute("group",group);
        return "email/group/import";
    }

    @RequestMapping(value = "/importProcess.html", method = RequestMethod.GET)
    public String importProcess(HttpServletRequest req, Model model,
                                @RequestParam(value="groupId",required = true,defaultValue = "0") int groupId,
                                @RequestParam(value="fileName",required = true,defaultValue = "") String fileName,
                                @RequestParam(value="rowSelect",required = true,defaultValue = "") String rowSelect) {
        User user = (User)req.getAttribute("currentUser");
        EmailGroup group = emailGroupService.getById(groupId);
        ImportLog _importLog = importLogService.getByUidFileGid(user.getUid(),fileName,groupId);
        if (_importLog != null) {
            model.addAttribute("rowSelect",rowSelect);
            model.addAttribute("fileName",fileName);
            model.addAttribute("group",group);
            return "email/group/process";
        }


        String realPath = UPLOAD_PATH;
        File file = new File(realPath + "/" + fileName);
        int email = 0;
        int name = -1;

        String[] selectArray = rowSelect.split(",");
        for (String select : selectArray) {
            String[] selArray = select.split("-");
            if (selArray.length > 1 && "email".equals(selArray[1]))
                email = Integer.parseInt(selArray[0]);
            if (selArray.length > 1 && "name".equals(selArray[1]))
                name = Integer.parseInt(selArray[0]);
        }
        try{
            List<List<Object>> result = ExcelUtils.readExcel(file);
            ImportLog importLog = new ImportLog();
            importLog.setUid(user.getUid());
            importLog.setFile(fileName);
            importLog.setCount(result.size());
            importLog.setGid(group.getId());
            int importId = importLogService.add(importLog);
            new ImportThread(importId,result,user,groupId,email,name).start();
        }catch (Exception e){

        }

        model.addAttribute("rowSelect",rowSelect);
        model.addAttribute("fileName",fileName);
        model.addAttribute("group",group);
        return "email/group/process";
    }

    @RequestMapping(value = "/importRate.html", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult importRate(HttpServletRequest req, Model model,
                                 @RequestParam(value="groupId",required = true,defaultValue = "0") int groupId,
                                 @RequestParam(value="originalCount",required = true,defaultValue = "0") int originalCount,
                                 @RequestParam(value="fileName",required = true,defaultValue = "") String fileName){
        User user = (User)req.getAttribute("currentUser");
        int currentCount = emailListService.getCountByGidUid(groupId) - originalCount;

        ImportLog importLog = importLogService.getByUidFileGid(user.getUid(),fileName,groupId);
        float  rate = ((float) currentCount)/importLog.getCount();
        DecimalFormat df = new DecimalFormat("0.00");
        int rateInt = (int)(Double.parseDouble(df.format(rate))*100);
        if (importLog.getStatus() == 1)
            return new JsonResult(1,true,rateInt+"%");
        else
            return new JsonResult(0,true,rateInt+"%");
    }

    @RequestMapping(value = "/emailList.html", method = RequestMethod.GET)
    public String emailList(HttpServletRequest req, Model model,
                            @RequestParam(value="page",required = true,defaultValue = "1") int page,
                            @RequestParam(value="groupId",required = true,defaultValue = "0") int groupId) {
        PageInfo<EmailList> pageInfo = emailListService.getPageInfo(groupId,page,10);

        model.addAttribute("pageInfo",pageInfo);
        model.addAttribute("groupId",groupId);
        return "email/group/email_list";
    }

    @RequestMapping(value = "/taskList.html", method = RequestMethod.GET)
    public String taskList(HttpServletRequest req, Model model,
                           @RequestParam(value="page",required = true,defaultValue = "1") int page,
                           @RequestParam(value="status",required = true,defaultValue = "0") int status) {
        User user = (User)req.getAttribute("currentUser");
        List<EmailTask> tasks = emailTaskService.getList(user.getUid(),-1);

        List<EmailTask> timeTasks = new ArrayList<EmailTask>();
        List<EmailTask> ingTasks = new ArrayList<EmailTask>();
        List<EmailTask> doneTasks = new ArrayList<EmailTask>();
        for (EmailTask task : tasks){
            if(task.getStatus() == 1)
                doneTasks.add(task);
            else if (task.getSendDate().getTime() <= new Date().getTime()) {
                EmailGroup group = emailGroupService.getById(task.getGid());
                if (group != null) task.setTotal(group.getCount());
                ingTasks.add(task);
            }
            else
                timeTasks.add(task);
        }

        for (EmailTask doneTask : doneTasks){
            List<TaskLog> taskLogs = emailLogService.getListByTid(doneTask.getId());
            TaskLog taskLog = new TaskLog();
            taskLog.setTotal(taskLogs.size());
            for (TaskLog taskLog1 : taskLogs) {
                if (taskLog1.getStatus() < 1) taskLog.setSuccess(taskLog.getSuccess()+1);
                else if (taskLog1.getStatus() == 1) taskLog.setHardBack(taskLog.getHardBack()+1);
                else if (taskLog1.getStatus() > 1) taskLog.setSoftBack(taskLog.getSoftBack()+1);
                if (taskLog1.getClick() >0) {
                    taskLog.setClick(taskLog.getClick()+taskLog1.getClick());
                    taskLog.setClick2(taskLog.getClick2()+1);
                }
                if (taskLog1.getOpen() >0) {
                    taskLog.setOpen(taskLog.getOpen()+taskLog1.getOpen());
                    taskLog.setOpen2(taskLog.getOpen2()+1);
                }
                if (taskLog1.getStatus() == 3){
                    taskLog.setBack(taskLog.getBack()+1);
                }
            }

            doneTask.setTaskLog(taskLog);
        }

        model.addAttribute("timeTasks",timeTasks);
        model.addAttribute("ingTasks",ingTasks);
        model.addAttribute("doneTasks",doneTasks);
        return "email/send/task_list";
    }

    @RequestMapping(value = "/send.html", method = RequestMethod.GET)
    public String send(HttpServletRequest req, Model model) {
        User user = (User)req.getAttribute("currentUser");
        List<Template> templates = templateService.getListByUid(user.getUid());
        List<EmailGroup> groups = emailGroupService.getListByUid(user.getUid());

        model.addAttribute("templates",templates);
        model.addAttribute("groups",groups);
        return "email/send/send";
    }


    @RequestMapping(value = "/addTask.html", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult addTask(HttpServletRequest req,@RequestBody EmailTask emailTask, Model model) {
        User user = (User)req.getAttribute("currentUser");
        int totalCount = 0;
        Template template = templateService.getById(emailTask.getTplId());
        if (template.getContent().contains("{#emailUserName}") && !emailTask.getSubject().contains("{#emailUserName}"))
            emailTask.setSubject("亲爱的{#emailUserName}："+emailTask.getSubject());
        String[] gidArray = emailTask.getGroupIds().split(",");
        for(String gid : gidArray){
            totalCount += emailGroupService.getById(Integer.parseInt(gid)).getCount();
        }
        if (user.getScore() >= totalCount) {
            emailTask.setUid(user.getUid());
            if ("".equals(emailTask.getSendDateStr())){
                emailTask.setSendDate(new Date());
            } else
                try {
                    emailTask.setSendDate(new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(emailTask.getSendDateStr()));
                }catch (ParseException e){
                    return new JsonResult(false);
                }

            for(String gid : gidArray){
                emailTask.setGid(Integer.parseInt(gid));

                emailTaskService.add(emailTask);
            }
            userService.updateScore(user.getUid(),-totalCount);
            return new JsonResult(true);
        } else
            return new JsonResult(1,false,"not enough score");
    }

    /*
    @RequestMapping(value = "/addTask.html", method = RequestMethod.POST)
    public String addTask(HttpServletRequest req, Model model,
                            @RequestParam(value="groupIds",required = true,defaultValue = "") String groupIds,
                            @RequestParam(value="subject",required = true,defaultValue = "") String subject,
                            @RequestParam(value="tplId",required = true,defaultValue = "0") int tplId) {

        User user = (User)req.getAttribute("currentUser");
        String[] gidArray = groupIds.split(",");
        for(String gid : gidArray){
            EmailTask emailTask = new EmailTask();
            emailTask.setGid(Integer.parseInt(gid));
            emailTask.setSubject(subject);
            emailTask.setUid(user.getUid());
            emailTaskService.add(emailTask);
        }

        return "redirect:/email/taskList.html";
    }*/

    final String UPLOAD_PATH = "D:/upload";


    @Autowired
    private EmailGroupService emailGroupService = null;

    @Autowired
    private EmailListService emailListService = null;

    @Autowired
    private TemplateService templateService = null;

    @Autowired
    private EmailTaskService emailTaskService = null;

    @Autowired
    private ImportLogService importLogService = null;

    @Autowired
    private EmailLogService emailLogService = null;

    @Autowired
    private UserService userService = null;
}

class ImportThread extends Thread{
    private int importId = 0;
    private List<List<Object>> data;
    private User user;
    private int email=0;
    private int name;
    private int groupId;

    public ImportThread(int importId,List<List<Object>> data,User user,int groupId,int email,int name){
        this.importId = importId;
        this.data = data;
        this.user = user;
        this.email = email;
        this.name = name;
        this.groupId = groupId;
    }

    public void run(){

        ApplicationContext context = SpringContext.getApplicationContext();
        EmailListService emailListService = (EmailListService)context.getBean("emailListService");
        EmailGroupService emailGroupService = (EmailGroupService)context.getBean("emailGroupService");
        ImportLogService importLogService = (ImportLogService)context.getBean("importLogService");
        int rowLength = data.size();
        List<EmailList> emails = new ArrayList<EmailList>();
        List<String> emailAddresses = emailListService.getEmailsByGid(groupId);
        for(int i=0;i<rowLength;i++) {
            String email_val = data.get(i).get(email).toString().trim();
            String name_val = "";
            if (name != -1)
                name_val = data.get(i).get(name).toString();
            if (email_val.contains("@") && !emailAddresses.contains(email_val))  {
                EmailList emailList = new EmailList();
                emailList.setEmail(email_val);
                if (name_val != "") emailList.setName(name_val);
                emailList.setUid(user.getUid());
                emailList.setGid(groupId);
                emails.add(emailList);
                emailAddresses.add(email_val);
            }
            if ((i == rowLength-1 || emails.size()==10000) && emails.size() > 0){
                emailListService.addList(emails);
                emails = new ArrayList<EmailList>();
            }
        }
        emailGroupService.updateCountById(groupId,emailListService.getCountByGidUid(groupId));
        importLogService.updateStatus(importId);
    }
}
