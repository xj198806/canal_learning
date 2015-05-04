<#macro standard title="" tag=1>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>邮件系统-${title}</title>
    <link rel="stylesheet" type="text/css" href="/static/css/style_product.css" />

    <script type="text/javascript" src="/static/js/jquery-1.3.2.js"></script>
</head>
<body>

    <div id="header">
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
            <tr valign="top">
                <td class="logo">
                <a href="#">
                        <img src="/static/images/logo.jpg" width="400px" height="50px" id="imgLogo" border="0" alt="logo" /></a>

                </td>
                <td class="logo"><strong style="color: #35639C;font-size:16px;">Max Send提供最专业有效的邮件营销</strong></td>
                <td class="status">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td style="padding: 15px 0px;">
                                <#if currentUser?exists && currentUser.userType == 1><a href="/user/list.html" >账户管理</a>
                                <#else>
                                <#if currentUser?exists && currentUser.parentUid ==0>
                                <a href="/email/user/list.html" >账户管理</a>
                                </#if>
                                </#if>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img src="/static/images/dot01.gif" align="absmiddle" />
                                <#if currentUser?exists>
                                <a href="/email/user/register.html?uid=${currentUser.uid}">
                                    <span id="lblUserName" class="email">${currentUser.username}</span></a></#if>
                                <img src="/static/images/dot02.gif" align="absmiddle" />
                                <a id="btnLogOut" class="offline" href="/user/logout.html">退出</a>
                            </td>
                        </tr>
                        <!--tr>
                            <td >
                                <a>选择活动:</a><select name="ddlActivityList" onchange="javascript:setTimeout('__doPostBack(\'ddlActivityList\',\'\')', 0)" id="ddlActivityList">
                                <option selected="selected" value="-1"> 默 认 活 动 </option>
                                <option value="473">df发送</option>

                            </select>
                                <img src="/static/images/dot02.gif" align="absmiddle" />
                                <a href="Activity/UserActivityList.aspx" id="activityManage">活动管理</a>
                            </td>
                        </tr-->
                    </table>
                </td>
            </tr>
        </table>
        <div>
            <ul id="mainnav">
                <li><a href="/email/index.html" class="<#if tag==1>sel<#else>disAble</#if>">操作台</a> </li>
                <li><a href="/email/groupList.html" class="<#if tag==2>sel<#else>disAble</#if>" name="1">通讯录</a></li>
                <li><a href="/email/templateList.html" class="<#if tag==3>sel<#else>disAble</#if>"  name="2">邮件模板</a></li>
                <li><a href="/email/send.html" class="<#if tag==4>sel<#else>disAble</#if>"  name="3">邮件发送</a> </li>
                <li><a href="/email/taskList.html" class="<#if tag==5>sel<#else>disAble</#if>" class="disAble" name="4">发送报表</a> </li>
                <#if currentUser?exists && currentUser.userType == 1><li><a href="/user/list.html" class="<#if tag==6>sel<#else>disAble</#if>"  name="5">账号管理</a> </li>
                <#else>
                <#if currentUser?exists && currentUser.parentUid ==0>
                    <li><a href="/email/user/list.html" class="<#if tag==6>sel<#else>disAble</#if>"  name="5">账号管理</a> </li>
                </#if>
                </#if>
                <#if currentUser?exists && currentUser.userType == 1>
                <li><a href="/email/configList.html" class="<#if tag==7>sel<#else>disAble</#if>"  name="6">信道设置</a> </li>
                </#if>
                <!--li><a href="Forms/FormList.aspx" class="disAble"  name="3">订阅表单</a> </li>
                <li id="divSurvey"><a href="Survery/Survery.aspx" class="disAble"  name="3">调查问卷</a> </li-->
            </ul>
            <ul id="sub_mainnav" style="height: 6px;">
                &nbsp;</ul>
        </div>
    </div>
	<#nested/>
    <div id="footer">
        <input name="hidDisable" type="hidden" id="hidDisable" class="hidDisable" value="," />
        <div>
            <span id="lblCompanyName" style="color:#666666;">Copyright @2008-2014  |  <a href='http://www.maxsend.cn/' target='_blank'>安全</a>  | <a target='_blank' href='http://www.maxsend.cn/' target='_blank'>反垃圾邮件声明</a>  |  <a href='http://www.maxsend.cn/' target='_blank'>MaxSend 绿色许可邮件服务使用协议</a></span>
        </div>
    </div>

</body>
</html>
</#macro>