<#import "/include/admin_layout.ftl" as layout />
<@layout.standard "任务管理" 5>
<div id="container">

        <br/>
        <div class="clear ">
            </div>
        <div class="send_body">

            <div class="topnav4">
                <div class="report_list">
                    <div class="bgreport">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="list_p1">
                            <tbody><tr>
                                <td class="list_p2" colspan="6">
                                    <img align="absmiddle" src="/static/images/icon15.gif">定时任务 <font>(<span style="color:#4E4E4E;" id="ctl00_ContentPlaceHolder1_lblScheduled">${timeTasks?size}</span>)</font>
                                </td>
                            </tr>
                        </tbody></table>
                    </div>
                    <div>
                        <div id="ctl00_ContentPlaceHolder1_uplScheduled">

                                <table width="100%" cellspacing="0" cellpadding="0">
                                    <tbody><tr>
                                        <td width="30%" class="list_tt2">
                                            任务名称
                                        </td>
                                        <td width="20%" class="list_tt1">
                                            任务主题
                                        </td>
                                        <td width="15%" align="center" class="list_tt1">
                                            发送总数
                                        </td>
                                        <td width="15%" align="center" class="list_tt1">
                                            发送时间
                                        </td>
                                        <td width="10%" align="center" class="list_tt1">
                                            发送状态
                                        </td>
                                    </tr>
                                            <#list timeTasks as timeTask>
                                            <tr class="list_tt">
                                                <td width="30%" align="left" class="bdomain2">
                                                    <font>
                                                        ${timeTask.name}</font>
                                                </td>
                                                <td width="20%">
                                                    ${timeTask.subject}
                                                </td>
                                                <td width="15%" align="center" class="bdomain2">
                                                    -
                                                </td>
                                                <td width="15%" align="center">
                                                    ${timeTask.sendDate?string("yyyy-MM-dd HH:mm")}
                                                </td>
                                                <td width="10%" align="center" class="bdomain2">
                                                    <span id="ctl00_ContentPlaceHolder1_rptScheduled_ctl00_lblScheduleStatus">等待发送</span>
                                                </td>
                                            </tr>
                                            </#list>
                                            <tr>

                                            </tr>

                                </tbody></table>

                        </div>
                    </div>
                    <div class="bgreport3">
                        <table width="100%" cellspacing="0" cellpadding="0" class="domain_export">
                            <tbody><tr>
                                <td class="submenu03 submenu01">

                                    <!-- AspNetPager 7.3.2  Copyright:2008-2011 Focussend Computer Co., Ltd. (http://www.focussend.com) -->
                                    <!--AspNetPager is hidden because there're only one page of records-->
                                    <!-- AspNetPager 7.3.2  Copyright:2008-2011 Focussend Computer Co., Ltd. (http://www.focussend.com) -->


                                </td>
                            </tr>
                        </tbody></table>
                    </div>
                </div>


                <div id="ctl00_ContentPlaceHolder1_uplSending">

                        <div class="report_list">
                            <div class="bgreport">
                                <table width="100%" cellspacing="0" cellpadding="0" class="list_p1">
                                    <tbody><tr>
                                        <td class="list_p2" colspan="6">
                                            <img align="absmiddle" src="/static/images/icon13.gif">发送中的任务 <font>(<span style="color:#4E4E4E;" id="ctl00_ContentPlaceHolder1_lblSending">${ingTasks?size}</span>)</font>
                                        </td>
                                    </tr>
                                </tbody></table>
                            </div>
                            <div>
                                <table width="100%" cellspacing="0" cellpadding="0">
                                    <tbody><tr>
                                        <td width="30%" class="list_tt2">
                                            任务名称
                                        </td>
                                        <td width="25%" class="list_tt1">
                                            任务主题
                                        </td>
                                        <td width="15%" align="center" class="list_tt1">
                                            发送总数
                                        </td>
                                        <td width="10%" align="center" class="list_tt1">
                                            发送状态
                                        </td>
                                    </tr>

                                    <#list ingTasks as ingTask>
                                    <tr>
                                        <td width="30%" class="list_tt2">
                                            ${ingTask.name}
                                        </td>
                                        <td width="25%" class="list_tt1">
                                            ${ingTask.subject}
                                        </td>
                                        <td width="15%" align="center" class="list_tt1">
                                            ${ingTask.total}
                                        </td>
                                        <td width="10%" align="center" class="list_tt1">
                                            正在发送
                                        </td>
                                    </tr>
                                    </#list>
                                    <#if ingTasks?size == 0>
                                    <tr>
                                        <td style="background-color: #FFFFCC;" colspan="5" id="ctl00_ContentPlaceHolder1_rptSending_ctl00_Div1">
                                            <div style="padding-top: 12px;" class="bgreport2 report2" id="ctl00_ContentPlaceHolder1_rptSending_ctl00_Div2">
                                                <p style="padding-left: 8px">
                                                    <img align="absmiddle" src="/static/images/icon14.gif">当前没有发送中的任务</p>
                                            </div>
                                        </td>

                                    </tr>
                                    </#if>
                                </tbody></table>
                            </div>
                            <div class="bgreport3">
                                <table width="100%" cellspacing="0" cellpadding="0" class="domain_export">
                                    <tbody><tr>
                                        <td class="submenu03 submenu01">
                                            <div class="newbt" style="float: right">

                                                <!-- AspNetPager 7.3.2  Copyright:2008-2011 Focussend Computer Co., Ltd. (http://www.focussend.com) -->
                                                <!--AspNetPager is hidden because there're only one page of records-->
                                                <!-- AspNetPager 7.3.2  Copyright:2008-2011 Focussend Computer Co., Ltd. (http://www.focussend.com) -->


                                            </div>
                                        </td>
                                    </tr>
                                </tbody></table>
                            </div>
                        </div>

                </div>


                <div id="divDisable" class="report_list">
                            <div class="bgreport">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="list_p1">
                                    <tbody><tr>
                                        <td class="list_p2">
                                            <img align="absmiddle" src="/static/images/icon05.gif">已完成的任务 <font>(<span style="color:#4E4E4E;" id="ctl00_ContentPlaceHolder1_lblReportCount">${doneTasks?size}</span>)</font>
                                        </td>
                                    </tr>
                                </tbody></table>
                            </div>


                <div id="ctl00_ContentPlaceHolder1_uplReport">

                            <div id="zhezhao" class="convd">
                                <div style="vertical-align: middle; margin: 0 auto; display: none;
                                    z-index: 1000px;" id="Son">
                                    <img width="260" vspace="2" height="55" style="border: solid 1px #c00;" src="/static/images/loading.gif">
                                </div>
                            </div>
                            <div>
                                <table width="100%" border="0" cellspacing="0" cellpadding="0" id="seeReportInfo">
                                    <tbody><tr>
                                        <td width="15%" class="list_tt2">
                                            任务名称
                                        </td>
                                        <td width="10%" class="list_tt1">
                                            任务主题
                                        </td>
                                        <td width="9%" align="center" class="list_tt1">
                                            发送总数
                                        </td>
                                        <!--td width="5%" align="center" class="list_tt1">
                                            硬退
                                        </td>
                                        <td width="5%" align="center" class="list_tt1">
                                            软退
                                        </td>
                                        <td width="8%" align="center" class="list_tt1">
                                            成功
                                        </td-->
                                        <td width="9%" align="center" class="list_tt1">
                                            独立打开/总打开
                                        </td>
                                        <td width="8%" align="center" class="list_tt1">
                                            独立点击/总点击
                                        </td>
                                        <td width="6%" align="center" class="list_tt1">
                                            退订
                                        </td>
                                        <!--td width="6%" align="center" class="list_tt1">
                                            转发
                                        </td-->
                                        <td width="9%" align="center" class="list_tt1">
                                            发送时间
                                        </td>
                                        <td width="6%" align="center" class="list_tt3">
                                            操作
                                        </td>
                                    </tr>
                                        <#list doneTasks as doneTask>
                                            <tr class="list_success">
                                                <td align="left" style="width: 12%" class="bdomain2">
                                                    <a class="disableJump">
                                                        ${doneTask.name}</a>
                                                </td>
                                                <td align="left" style="width: 15%">
                                                    ${doneTask.subject}
                                                </td>
                                                <td align="center" style="width: 9%" class="bdomain2">
                                                    ${doneTask.taskLog.total}
                                                </td>
                                                <!--td align="center" style="width: 5%">
                                                        ${doneTask.taskLog.hardBack}<font></font>
                                                </td>
                                                <td class="bdomain2" style="width: 5%">
                                                        ${doneTask.taskLog.softBack}<font></font>
                                                </td>
                                                <td style="width: 8%">
                                                    ${doneTask.taskLog.success}
                                                </td-->
                                                <td align="center" class="bdomain2" style="width: 8%">
                                                    <#if doneTask.taskLog.open?exists>
                                                        ${doneTask.taskLog.open2!} / ${doneTask.taskLog.open!}
                                                        <#if doneTask.taskLog.total!=0>
                                                        <!--font>(${(doneTask.taskLog.open!/doneTask.taskLog.total)?string("#.####")})</font-->
                                                        </#if>
                                                    </#if>
                                                </td>
                                                <td align="center" style="width: 5%">
                                                    <#if doneTask.taskLog.open?exists>
                                                        ${doneTask.taskLog.click2!} / ${doneTask.taskLog.click!}
                                                        <#if doneTask.taskLog.total!=0>
                                                        <!--font>(${(doneTask.taskLog.click!/doneTask.taskLog.total)?string("#.####")})</font-->
                                                        </#if>
                                                    </#if>
                                                </td>
                                                <td align="center" class="bdomain2" style="width: 6%">
                                                    ${doneTask.taskLog.back!}
                                                </td>
                                                <!--td align="center" style="width: 6%">
                                                        -
                                                </td-->
                                                <td align="center" class="bdomain2">
                                                    ${doneTask.sendDate?string("yyyy-MM-dd HH:mm")}
                                                </td>
                                                <td style="display: none;" class="SentOver">
                                                    -
                                                </td>
                                                <td name="10" style="display: none;" class="FieldTaskEdit">
                                                   <a style="font-size: 12px; color: #006699; text-decoration: underline;" href="javascript:__doPostBack('ctl00$ContentPlaceHolder1$rptReport$ctl00$lbtUpdateReport','')" title="此类任务需要导出报表时需点击此按钮" id="ctl00_ContentPlaceHolder1_rptReport_ctl00_lbtUpdateReport">同步数据</a>
                                                   <a style="font-size: 12px; color: #FF8F5F;cursor:pointer;" href="javascript:__doPostBack('ctl00$ContentPlaceHolder1$rptReport$ctl00$lbtSuspend','')" title="将您的触发任务停掉,停掉后将不会再进行周期处理" id="ctl00_ContentPlaceHolder1_rptReport_ctl00_lbtSuspend">暂停</a>

                                                    <a style="font-size: 12px; color: #FF8F5F;cursor:pointer;" href="javascript:__doPostBack('ctl00$ContentPlaceHolder1$rptReport$ctl00$lbtFieldDelete','')" title="删除此触发任务" id="ctl00_ContentPlaceHolder1_rptReport_ctl00_lbtFieldDelete" onclick="return ShowHideT();">删除</a>
                                                </td>
                                                <td style="display: none;" class="MergerTask">
                                                   <a class="MergerTask" title="您可继续对该任务添加子任务" style="font-size: 12px;text-decoration: underline;" href="../NewReport/MergeTask.aspx?TaskId=1001401">继续添加</a>
                                                    <a style="font-size: 12px; color: #FF5F5F; text-decoration: underline;" href="javascript:__doPostBack('ctl00$ContentPlaceHolder1$rptReport$ctl00$lbtUpdate','')" title="将您的合并任务数据同步到最新" id="ctl00_ContentPlaceHolder1_rptReport_ctl00_lbtUpdate">同步</a>
                                                   <a style="font-size: 12px; color: #FF8F5F;cursor:pointer;" href="javascript:__doPostBack('ctl00$ContentPlaceHolder1$rptReport$ctl00$lbtMergerTaskDel','')" title="删除合并任务" id="ctl00_ContentPlaceHolder1_rptReport_ctl00_lbtMergerTaskDel" onclick="return ShowHideT();">删除</a>

                                                </td>
                                            </tr>
                                        </#list>
                                        <#if doneTasks?size == 0>
                                        <tr>
                                            <td style="background-color: #FFFFCC;" colspan="15" id="ctl00_ContentPlaceHolder1_rptSending_ctl00_Div1">
                                                <div style="padding-top: 12px;" class="bgreport2 report2" id="ctl00_ContentPlaceHolder1_rptSending_ctl00_Div2">
                                                    <p style="padding-left: 8px">
                                                        <img align="absmiddle" src="/static/images/icon14.gif">当前没有已完成的任务</p>
                                                </div>
                                            </td>

                                        </tr>
                                        </#if>
                                </tbody></table>
                            </div>
                            <div class="bgreport3">
                                <table width="100%" cellspacing="0" cellpadding="0" class="domain_export">
                                    <tbody><tr>
                                        <td class="submenu03 submenu01">
                                        <div>

                                         </div>
                                        </td>
                                    </tr>
                                </tbody></table>
                            </div>

                        </div>
                        <div style="float:right; padding-top:10px;">
                      <!--input type="submit" style="height:25px;" id="ctl00_ContentPlaceHolder1_btn_Export" value="导出报表" name="ctl00$ContentPlaceHolder1$btn_Export"-->
                </div>
                </div>
            </div>

            <div class="clear">
                <input type="hidden" value="按任务名查询" id="ctl00_ContentPlaceHolder1_hidSearch" name="ctl00$ContentPlaceHolder1$hidSearch">
                 <input type="hidden" id="ctl00_ContentPlaceHolder1_txtHighCondition" name="ctl00$ContentPlaceHolder1$txtHighCondition">
                 <input type="hidden" value="," id="ctl00_ContentPlaceHolder1_hidDisable" name="ctl00$ContentPlaceHolder1$hidDisable">
            </div>
        </div>
        <div class="clear"></div>
    </div>

</@layout.standard>