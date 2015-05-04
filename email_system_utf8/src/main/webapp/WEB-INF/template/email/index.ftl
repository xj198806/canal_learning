<#import "/include/admin_layout.ftl" as layout />
<@layout.standard "操作台" 1>
<div id="container">
<div class="e-nam">
    <h2 class="date1">
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td class="welcome">
                    欢迎您，<span id="lblUserName1" class="welcome">${currentUser.username}</span>
                </td>
                <td align="right" style="font-weight: normal; padding-right: 5px;">
                    <span id="lblDate" class="date2">${date?string("yyyy-MM-dd HH:mm")}</span>
                </td>
            </tr>
        </table>
    </h2>
</div>
<div class="send_body">
    <div style="margin: 10px 25px;">
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td>
                    <table border="0" cellpadding="0" cellspacing="0" width="100%" id="tbAllInfo">
                        <tr>
                            <td width="20%" class="dash_p1">
                                <a href="/email/groupList.html" class="disAble" name="1">
                                    <img src="/static/images/liebiao.gif" align="absmiddle" title="<i style='font-size:12px; font-style:normal; font-weight:normal; letter-spacing:1.2px; line-height:16px; color:#4e4e4e;'>在此模块里加入您希望收到邮件的对象，并确认将这些对象添加或导入到一个组内，因为最后的邮件发送是针对组的。</i>"
                                         altbg="#fefed4" altcolor="#4e4e4e" altborder="#fef083" />
                                    <p style="display: none; position: absolute; padding: 5px; width: 200px; text-decoration: none;"
                                       id="_altlayer">
                                    </p>
                                    通讯录<img src="/static/images/right1.gif" align="absmiddle" /></a>
                            </td>
                            <td width="20%" class="dash_p1" style="border-left: 0;">
                                <a href="/email/templateList.html" class="disAble" name="2">
                                    <img src="/static/images/muban.gif" align="absmiddle" title="<i style='font-size:12px; font-style:normal; font-weight:normal; letter-spacing:1.2px; line-height:16px; color:#4e4e4e;'>建立一个新的邮件内容，请注重内容的美观和实用性，这将帮助您发送的对象愉悦的阅读这封邮件。</i>"
                                         altbg="#fefed4" altcolor="#4e4e4e" altborder="#fef083" />邮件模板<img src="/static/images/right1.gif"
                                                                                                           align="absmiddle" /></a>
                            </td>
                            <td width="20%" class="dash_p2" style="border-left: 0;">
                                <a href="/email/send.html" class="disAble" name="3">
                                    <img src="/static/images/mail_send.gif" align="absmiddle" title="<i style='font-size:12px; font-style:normal; font-weight:normal; letter-spacing:1.2px; line-height:16px; color:#4e4e4e;'>选择您要发送的内容、主题及收件人无误后进行发送，发送时间可以自由进行选择。</i>"
                                         altbg="#fefed4" altcolor="#4e4e4e" altborder="#fef083" />邮件发送<img src="/static/images/right1.gif"
                                                                                                           align="absmiddle" /></a>
                            </td>
                            <td width="20%" class="dash_p2" style="border-left: 0;">
                                <a href="/email/taskList.html" id="SeeReport" class="disAble" name="4">
                                    <img src="/static/images/baobiao.gif" align="absmiddle" title="<i style='font-size:12px; font-style:normal; font-weight:normal; letter-spacing:1.2px; line-height:16px; color:#4e4e4e;'>了解所有的邮件任务状态是定时、发送中还是发送完毕，并能详细了解每一次邮件发送完的结果。</i>"
                                         altbg="#fefed4" altcolor="#4e4e4e" altborder="#fef083" />查看报表<img src="/static/images/right1.gif"
                                                                                                           align="absmiddle"  /></a>
                            </td>
                        </tr>
                        <tr>
                            <td class="dash_p3">
                                <img src="/static/images/001.gif" align="absmiddle" />
                                创建通讯录并添加联系人
                            </td>
                            <td class="dash_p3">
                                <img src="/static/images/002.gif" align="absmiddle" />
                                新建一个电子邮件模板
                            </td>
                            <td class="dash_p3">
                                <img src="/static/images/003.gif" align="absmiddle" />
                                对发送任务进行设置并发送
                            </td>
                            <td class="dash_p3">
                                <img src="/static/images/004.gif" align="absmiddle" />
                                查看发送任务的整体效果
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
</div>
<div class="send_body9">

    <div class="dashblue_box">
        <b class="dashblue"><b class="dashblue1"><b></b></b><b class="dashblue2"><b></b></b>
            <b class="dashblue3"></b><b class="dashblue4"></b><b class="dashblue5"></b></b>
        <div class="dashblue_content">
            <div class="dashlight_blue_box" style="padding: 0pt;">
                <b class="dashlight_blue"><b class="dashlight_blue1"><b></b></b><b class="dashlight_blue2">
                    <b></b></b><b class="dashlight_blue3"></b><b class="dashlight_blue4"></b><b class="dashlight_blue5">
                </b></b>
                <div class="dashlight_blue_content">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <!--tr>
                            <td class="dash_td3">
                                消费点数
                                <input type="hidden" name="hdnCredit" id="hdnCredit" value="69" />
                            </td>
                            <td class="dash_td5">
                                <span id="lblCreditPercent" class="dash_td5">69.13%</span>
                            </td>
                        </tr-->
                    </table>
                </div>
                <b class="dashlight_blue"><b class="dashlight_blue5"><b></b></b><b class="dashlight_blue4">
                    <b></b></b><b class="dashlight_blue3"></b><b class="dashlight_blue2"></b><b class="dashlight_blue1">
                </b><b style="background: #cdddfb; height: 5px;"></b></b>
            </div>
        </div>
        <div class="dashblue_content"  style="overflow:hidden;"  >
            <div class="dashwhite_box" style="padding: 0pt;overflow:hidden; width:99%;">
                <b class="dashwhite"><b class="dashwhite1"><b></b></b><b class="dashwhite2"><b></b></b>
                    <b class="dashwhite3"></b><b class="dashwhite4"></b><b class="dashwhite5"></b>
                </b>
                <div class="dashwhite_content" style="overflow:hidden;" >
                    <p class="fill" id="progress" style="width: 5%;">
                    </p>
                </div>
                <b class="dashwhite"><b class="dashwhite5"><b></b></b><b class="dashwhite4"><b></b></b>
                    <b class="dashwhite3"></b><b class="dashwhite2"></b><b class="dashwhite1"></b><b
                            style="background: #cdddfb; height: 5px;"></b></b>
            </div>
            <div class="dashwhite_box" style="padding: 0pt;">
                <b class="dashwhite"><b class="dashwhite1"><b></b></b><b class="dashwhite2"><b></b></b>
                    <b class="dashwhite3"></b><b class="dashwhite4"></b><b class="dashwhite5"></b>
                </b>
                <div class="dashwhite_content">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td class="dash_dianshu">
                                可用积分：<span id="lblAll" class="dash_dianshu">${user.score}</span>
                                <!--&nbsp;&nbsp;&nbsp;&nbsp;使用中：<span id="lblUsing" class="dash_dianshu">0</span>
                                &nbsp;&nbsp;&nbsp;&nbsp;已使用：<span id="lblUsed" class="dash_dianshu">654546</span-->
                            </td>
                            <td  class="dash_dianshu" style="display:none;"> <a href="Pay/ShowPackages.aspx" id="linkCharge" class="dash_dianshu" target="_blank"><img src="/static/images/Recharge.gif" border="0" /></a>
                            </td>
                        </tr>
                    </table>
                </div>
                <b class="dashwhite"><b class="dashwhite5"><b></b></b><b class="dashwhite4"><b></b></b>
                    <b class="dashwhite3"></b><b class="dashwhite2"></b><b class="dashwhite1"></b>
                </b>
            </div>
        </div>
        <b class="dashblue"><b class="dashblue5"></b><b class="dashblue4"></b><b class="dashblue3">
        </b><b class="dashblue2"><b></b></b><b class="dashblue1"><b></b></b></b>
    </div>
    <div class="dashblue_box">
        <b class="dashblue"><b class="dashblue1"><b></b></b><b class="dashblue2"><b></b></b>
            <b class="dashblue3"></b><b class="dashblue4"></b><b class="dashblue5"></b></b>
        <div class="dashblue_content">
            <div class="dashlight_blue_box" style="padding: 0pt;">
                <b class="dashlight_blue"><b class="dashlight_blue1"><b></b></b><b class="dashlight_blue2">
                    <b></b></b><b class="dashlight_blue3"></b><b class="dashlight_blue4"></b><b class="dashlight_blue5">
                </b></b>
                <div class="dashlight_blue_content">
                    <p class="dash_td3">
                        投诉表</p>
                </div>
                <b class="dashlight_blue"><b class="dashlight_blue5"><b></b></b><b class="dashlight_blue4">
                    <b></b></b><b class="dashlight_blue3"></b><b class="dashlight_blue2"></b><b class="dashlight_blue1">
                </b><b style="background: #cdddfb; height: 5px;"></b></b>
            </div>
        </div>
        <div class="dashblue_content">
            <div class="dashwhite_box" style="padding: 0pt;">
                <b class="dashwhite"><b class="dashwhite1"><b></b></b><b class="dashwhite2"><b></b></b>
                    <b class="dashwhite3"></b><b class="dashwhite4"></b><b class="dashwhite5"></b>
                </b>
                <div class="dashwhite_content">
                    <table border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="dash_td4">
                                <img src="/static/images/bar_001.gif" align="middle" style="margin: 0px 5px 2px 0px;" /><a href="NewReport/ComplainList.aspx">查看过去的30天投诉情况...</a>
                            </td>
                        </tr>
                    </table>
                </div>
                <b class="dashwhite"><b class="dashwhite5"><b></b></b><b class="dashwhite4"><b></b></b>
                    <b class="dashwhite3"></b><b class="dashwhite2"></b><b class="dashwhite1"></b>
                </b>
            </div>
        </div>
        <b class="dashblue"><b class="dashblue5"></b><b class="dashblue4"></b><b class="dashblue3">
        </b><b class="dashblue2"><b></b></b><b class="dashblue1"><b></b></b></b>
    </div>

</div>
<div class="send_body8">
    <div class="dashblue_box1">
        <b class="dashblue"><b class="dashblue1"><b></b></b><b class="dashblue2"><b></b></b>
            <b class="dashblue3"></b><b class="dashblue4"></b><b class="dashblue5"></b></b>
        <div class="dashblue_content">
            <div class="dashlight_blue_box" style="padding: 0pt;">
                <b class="dashlight_blue"><b class="dashlight_blue1"><b></b></b><b class="dashlight_blue2">
                    <b></b></b><b class="dashlight_blue3"></b><b class="dashlight_blue4"></b><b class="dashlight_blue5">
                </b></b>
                <div class="dashlight_blue_content">
                    <p class="dash_td3">
                        任务情况</p>
                </div>
                <b class="dashlight_blue"><b class="dashlight_blue5"><b></b></b><b class="dashlight_blue4">
                    <b></b></b><b class="dashlight_blue3"></b><b class="dashlight_blue2"></b><b class="dashlight_blue1">
                </b><b style="background: #cdddfb; height: 5px;"></b></b>
            </div>
        </div>
        <div class="dashblue_content">
            <div class="dashwhite_box" style="padding: 0pt;">
                <b class="dashwhite"><b class="dashwhite1"><b></b></b><b class="dashwhite2"><b></b></b>
                    <b class="dashwhite3"></b><b class="dashwhite4"></b><b class="dashwhite5"></b>
                </b>
                <div class="dashwhite_content">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td class="dash_img">
                                <img src="/static/images/dot13.gif" align="absmiddle" />发送中的任务
                            </td>
                            <td class="dash_view">
                                <a href="/email/taskList.html" id="SeeReportT">查看<img src="/static/images/dot08.gif" align="absmiddle" /></a>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">

                                <p id="rptSending_ctl00_P1" class="dash_none">
                                    <img src="/static/images/dot14.gif" align="absmiddle" />
                                    <#if ingTasks?exists&&ingTasks?size gt 0>
                                    当前有${ingTasks?size}个发送中的任务
                                    <#else>当前没有发送中的任务</#if></p>

                            </td>
                        </tr>
                    </table>
                </div>
                <b class="dashwhite"><b class="dashwhite5"><b></b></b><b class="dashwhite4"><b></b></b>
                    <b class="dashwhite3"></b><b class="dashwhite2"></b><b class="dashwhite1"></b><b
                            style="background: #cdddfb; height: 5px;"></b></b>
            </div>
            <div class="dashwhite_box" style="padding: 0pt;">
                <b class="dashwhite"><b class="dashwhite1"><b></b></b><b class="dashwhite2"><b></b></b>
                    <b class="dashwhite3"></b><b class="dashwhite4"></b><b class="dashwhite5"></b>
                </b>
                <div class="dashwhite_content">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td class="dash_img">
                                <img src="/static/images/dot15.gif" align="absmiddle" />定时任务
                            </td>
                            <td class="dash_view">
                                <a href="/email/taskList.html" id="SeeReportF">查看<img src="/static/images/dot08.gif" align="absmiddle" /></a>
                            </td>
                        </tr>

                        <tr>
                            <td colspan="2">
                                <p id="rptScheduled_ctl00_P2" class="dash_none">
                                    <img src="/static/images/dot14.gif" align="absmiddle" />
                                    <#if timeTasks?exists&&timeTasks?size gt 0>
                                    当前有${timeTasks?size}个定时任务
                                    <#else>当前没有定时任务</#if></p>
                            </td>
                        </tr>

                    </table>
                </div>
                <b class="dashwhite"><b class="dashwhite5"><b></b></b><b class="dashwhite4"><b></b></b>
                    <b class="dashwhite3"></b><b class="dashwhite2"></b><b class="dashwhite1"></b>
                </b>
            </div>
        </div>
        <b class="dashblue"><b class="dashblue5"></b><b class="dashblue4"></b><b class="dashblue3">
        </b><b class="dashblue2"><b></b></b><b class="dashblue1"><b></b></b></b>
    </div>

</div>
<div class="clear">
</div>
</div>
</div>
</@layout.standard>

