package com.go.web.controller.email;

import com.go.email.bean.ConfigGroup;
import com.go.email.bean.ConfigGroupMapping;
import com.go.email.bean.EmailConfig;
import com.go.email.bean.UserConfigGroupMapping;
import com.go.email.service.ConfigGroupMappingService;
import com.go.email.service.ConfigGroupService;
import com.go.email.service.EmailConfigService;
import com.go.email.service.UserGroupMappingService;
import com.go.util.PageInfo;
import com.go.web.util.JsonResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: xujian
 * Date: 14-12-4
 * Time: 下午1:50
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping("/email")
public class ConfigManageController {

    @RequestMapping(value = "/addConfigGroup.html", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult addConfigGroup(HttpServletRequest req,
                                     @RequestParam(value="configIds",required = false,defaultValue = "") String configIds,
                                     @RequestParam(value="groupId",required = false,defaultValue = "0") int groupId) {
        List<ConfigGroupMapping> configGroupMappings = new ArrayList<ConfigGroupMapping>();
        if (groupId != 0 && configIds != ""){
            String[] ids = configIds.split(",");
            for (String id : ids){
                ConfigGroupMapping configGroupMapping = new ConfigGroupMapping();
                configGroupMapping.setConfigGroupId(groupId);
                configGroupMapping.setConfigId(Integer.parseInt(id));
                configGroupMappings.add(configGroupMapping);
            }
            configGroupMappingService.addList(configGroupMappings);
        }

        return new JsonResult(true);
    }

    @RequestMapping(value = "/removeConfigGroup.html", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult removeConfigGroup(HttpServletRequest req,
                                        @RequestParam(value="configIds",required = false,defaultValue = "") String configIds,
                                        @RequestParam(value="groupId",required = false,defaultValue = "0") int groupId) {
        List<ConfigGroupMapping> configGroupMappings = new ArrayList<ConfigGroupMapping>();
        if (groupId != 0 && configIds != ""){
            String[] ids = configIds.split(",");
            for (String id : ids){
                ConfigGroupMapping configGroupMapping = new ConfigGroupMapping();
                configGroupMapping.setConfigGroupId(groupId);
                configGroupMapping.setConfigId(Integer.parseInt(id));
                configGroupMappings.add(configGroupMapping);
            }
            configGroupMappingService.removeList(configGroupMappings);
        }

        return new JsonResult(true);
    }

    @RequestMapping(value = "/addUserGroup.html", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult addUserGroup(HttpServletRequest req,
                                   @RequestParam(value="groupIds",required = false,defaultValue = "") String groupIds,
                                   @RequestParam(value="uid",required = false,defaultValue = "0") int uid) {
        List<UserConfigGroupMapping> userConfigGroupMappings = new ArrayList<UserConfigGroupMapping>();
        if (uid != 0 && groupIds != ""){
            String[] ids = groupIds.split(",");
            for (String id : ids){
                UserConfigGroupMapping userConfigGroupMapping = new UserConfigGroupMapping();
                userConfigGroupMapping.setConfigGroupId(Integer.parseInt(id));
                userConfigGroupMapping.setUid(uid);
                userConfigGroupMappings.add(userConfigGroupMapping);
            }
            userGroupMappingService.addList(userConfigGroupMappings);
        }

        return new JsonResult(true);
    }

    @RequestMapping(value = "/removeUserGroup.html", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult removeUserGroup(HttpServletRequest req,
                                      @RequestParam(value="groupIds",required = false,defaultValue = "") String groupIds,
                                      @RequestParam(value="uid",required = false,defaultValue = "0") int uid) {
        List<UserConfigGroupMapping> userConfigGroupMappings = new ArrayList<UserConfigGroupMapping>();
        if (uid != 0 && groupIds != ""){
            String[] ids = groupIds.split(",");
            for (String id : ids){
                UserConfigGroupMapping userConfigGroupMapping = new UserConfigGroupMapping();
                userConfigGroupMapping.setConfigGroupId(Integer.parseInt(id));
                userConfigGroupMapping.setUid(uid);
                userConfigGroupMappings.add(userConfigGroupMapping);
            }
            userGroupMappingService.removeList(userConfigGroupMappings);
        }

        return new JsonResult(true);
    }

    @RequestMapping(value = "/configGroup.html", method = RequestMethod.GET)
    public String configGroup(HttpServletRequest req, Model model,
                              @RequestParam(value="id",required = false,defaultValue = "0") int id) {
        if (id != 0){
            ConfigGroup configGroup = configGroupService.getById(id);
            model.addAttribute("configGroup",configGroup);
        }

        return "email/config/au_config_group";
    }

    @RequestMapping(value = "/configGroupAu.html", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult configGroupAu(HttpServletRequest req,@RequestBody ConfigGroup configGroup, Model model) {

        if (configGroup.getId() == 0)
            configGroupService.add(configGroup);
        else
            configGroupService.edit(configGroup);

        return new JsonResult(true);
    }

    @RequestMapping(value = "/configList.html", method = RequestMethod.GET)
    public String configList(HttpServletRequest req, Model model,
                             @RequestParam(value="page",required = false,defaultValue = "1") int page) {
        PageInfo<EmailConfig> configPage = emailConfigService.getPageInfo(page, 10);
        PageInfo<ConfigGroup> pageInfo = configGroupService.getPageInfo(1, 100);

        model.addAttribute("pageInfo",pageInfo);
        model.addAttribute("configPage",configPage);
        model.addAttribute("page",page);
        return "email/config/config_list";
    }

    @RequestMapping(value = "/config.html", method = RequestMethod.GET)
    public String config(HttpServletRequest req, Model model,
                         @RequestParam(value="id",required = false,defaultValue = "0") int id) {
        if (id != 0){
            EmailConfig config = emailConfigService.getById(id);
            model.addAttribute("config",config);
        }
        return "email/config/add_or_edit";
    }

    @RequestMapping(value = "/configAu.html", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult configAu(HttpServletRequest req,@RequestBody EmailConfig emailConfig, Model model) {

        if (emailConfig.getId() == 0)
            emailConfigService.add(emailConfig);
        else
            emailConfigService.update(emailConfig);

        return new JsonResult(true);
    }

    @Autowired
    private EmailConfigService emailConfigService = null;

    @Autowired
    private ConfigGroupService configGroupService = null;

    @Autowired
    private ConfigGroupMappingService configGroupMappingService = null;

    @Autowired
    private UserGroupMappingService userGroupMappingService = null;

}
