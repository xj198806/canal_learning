<#import "/include/admin_layout.ftl" as layout />
<#import "/include/component.ftl" as component />
<@layout.standard "通讯录管理" 2>
<style type="text/css">

.listall {
    border-bottom: 2px solid #EEEEEE;
    float: left;
    padding-bottom: 5px;
    width: 100%;
}

.listitle2 {
    background: none repeat scroll 0 0 #F9F9F9;
    border-bottom: 1px solid #EEEEEE;
    float: left;
    line-height: 30px;
    width: 100%;
}

.listitle2 li.first {
    padding-left: 10px;
    width: 45%;
}
.listitle2 li {
    color: #666666;
    float: left;
    font-size: 12px;
    width: 10%;
}
.listitle2 div.sty3, .listitle2 div.sty4 {
    float: left;
    padding-right: 10px;
}


.bgsty {
    background: none repeat scroll 0 0 #FFFFFF;
}
.listitle2 {
    background: none repeat scroll 0 0 #F9F9F9;
    border-bottom: 1px solid #EEEEEE;
    float: left;
    line-height: 30px;
    width: 100%;
}


.listitle {
    border-bottom: 2px solid #CCCCCC;
    float: left;
    line-height: 30px;
    width: 100%;
}

.listitle li.first {
    padding-left: 10px;
    width: 45%;
}
.listitle li {
    color: #666666;
    float: left;
    font-size: 14px;
    width: 10%;
}
</style>
<div id="container">

<div class="send_body">
    <div style="margin:25px 25px 0 25px;">
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td class="newnav1">&nbsp;</td>
                <td class="newnav">
                    <span class="newnav_t"><img src="/static/images/sub_001.gif" align="absmiddle" />创建通讯录步骤</span>
                    <span class="newnav_w1"><img src="/static/images/step_1.gif" align="absmiddle" />创建联系组<img src="/static/images/right.gif" align="absmiddle" /></span>
                    <span class="newnav_w"><img src="/static/images/step2.gif" align="absmiddle" />添加联系人</span>
                    <span class="newnav_w"><img src="/static/images/step3.gif" align="absmiddle" />管理联系人</span>
                </td>
                <td class="newnav2">&nbsp;</td>
            </tr>
        </table>
    </div>
</div>
<div class="clear"></div>
<div>
    <ul class="nav1">
        <li><a id="nav_sub" href="/email/groupList.html">联系组</a></li>
        <li><a class="sel" id="nav_subs">联系人</a></li>
    </ul>
</div>


   <div>
           <div id="ctl00_ContentPlaceHolder1_uptSubscribers">

                   <#if pageInfo.count gt 0>
                   <div id="subList" class="send_body sublist">
                       <div style="padding: 0 25px;">
                       	<table width="100%" border="0" cellspacing="0" cellpadding="0">

   			           </table>
                           <div class="u_note_box2">
                               <b class="u_note"><b class="u_note1"><b></b></b><b class="u_note2"><b></b></b><b class="u_note3"></b><b class="u_note4"></b><b class="u_note5"></b></b>
                               <div class="u_note_content">
                                   <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                       <tbody><tr>
                                           <td width="100%" class="u_p">
                                               <span id="ctl00_ContentPlaceHolder1_lblShowUser">所有联系人显示：</span>(1-50)&nbsp;&nbsp;&nbsp;&nbsp;共（${pageInfo.count}）
                                           </td>
                                       </tr>
                                   </tbody></table>
                               </div>
                               <b class="u_note"><b class="u_note5"></b><b class="u_note4"></b><b class="u_note3"></b>
                                   <b class="u_note2"><b></b></b><b class="u_note1"><b></b></b></b><br>
                           </div>

                           <div id="zhezhao" class="convd">
                               <div style=" vertical-align:middle; margin:0 auto; margin-top:400px; display:none; z-index:1000px;" id="Son">
                                    <img width="260" vspace="2" height="55" style="border: solid 1px #c00;" src="/static/images/loading.gif">
                                </div>
                           </div>
                       <div id="subscriberList">
                           <div class="listitle">
                               <ul>
                                   <li class="first">Email</li>
                                   <li>姓名</li>
                                   <li>状态</li>
                                   <li>订阅日期</li>
                                   <li>客户活跃度</li>
                                   <li class="last">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;操作</li>
                               </ul>
                           </div>

                           <div class="clear">
                           </div>
                           <#list pageInfo.items as email>
                           <input type="hidden" value="subscriber_11941" id="ctl00_ContentPlaceHolder1_hidTable" name="ctl00$ContentPlaceHolder1$hidTable">

                                   <div name="subscriberList" id="divCKALL" class="listitle2">
                                       <ul>
                                           <li class="first">
                                               <table border="0" cellspacing="0" cellpadding="0" id="GuiGeDetail">
                                                   <tbody><tr>
                                                       <td>
                                                           <input type="checkbox" title="740201" value="740201">
                                                       </td>
                                                       <td>
                                                           ${email.email}
                                                       </td>
                                                   </tr>
                                               </tbody></table>
                                           </li>
                                           <li style="width: 115px;">

                                               <span name="fullName" class="fullName"><font style="color:#ccc;">&mdash; &mdash;</font></span>
                                               </li>
                                           <li>
                                               <span style="font-size:12px;" class=" sublist_p3" id="ctl00_ContentPlaceHolder1_rptSubscriber_ctl00_lblStatus">正常</span></li>
                                           <li>
                                               ${email.createdAt?string("yyyy-MM-dd")}</li>
                                           <li class="hyd">


                                         <table>
   							            <tbody><tr>
   								            <td><p title="当前活跃数:0,级别为:睡眠" name="0" class="items act00">&nbsp;</p></td>
   								            <td><p><a href="javascript:void(0)"><img align="absmiddle" name="whyActivity" src="/static/images/why.gif" title="活跃度增减规则：打开:+1,点击:+3,转发2,退订:-10,硬退:-1。"></a></p></td>
   							            </tr>
                                         </tbody></table>
                                               </li>
                                               <li class="last">
                                                   <div class="sty3">
                                                       <a style="color: #35639c;" href="javascript:;">编辑</a>
                                                   </div>
                                                   <div class="sty4">

                                                           <a href="javascript:;" id="ctl00_ContentPlaceHolder1_rptSubscriber_ctl00_btnDelete">删除</a>
                                                  </div>
                                                   <div class="sty4">

                                               </div>
                                               </li>
                                         </ul>
                                   </div>
                           <div class="clear">
                           </div>
                           </#list>

                           <div class="u_note_box2">
                               <b class="u_note"><b class="u_note1"><b></b></b><b class="u_note2"><b></b></b><b class="u_note3"></b><b class="u_note4"></b><b class="u_note5"></b></b>
                               <div class="u_note_content">
                                   <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                       <tbody><tr>
                                           <td width="50%" class="u_p">
                                               显示联系人(1-50)&nbsp;&nbsp;&nbsp;&nbsp;共（${pageInfo.count}）
                                           </td>
                                           <td width="50%" class="send_p1">

                                                    <!-- AspNetPager 7.3.2  Copyright:2008-2011 Focussend Computer Co., Ltd. (http://www.focussend.com) -->
                                                    <div id="ctl00_ContentPlaceHolder1_AspNetPager1">
                                                        <@component.page pageInfo "/email/emailList.html?page={page}&groupId=${groupId}" ""/>
                                                   </div>

                                           </td>
                                       </tr>
                                   </tbody></table>
                               </div>
                               <b class="u_note"><b class="u_note5"></b><b class="u_note4"></b><b class="u_note3"></b>
                                   <b class="u_note2"><b></b></b><b class="u_note1"><b></b></b></b>
                           </div>
                       </div>
                   </div>
                   </div>

                    </div>
                   <#else>
                        <div id="subList" class="send_body sublist"><br/><br/><br/>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;该组暂无数据 </div>
                   </#if>
           </div>
           <input type="hidden" value="活跃度增减规则：打开:+1,点击:+3,转发2,退订:-10,硬退:-1。" id="ctl00_ContentPlaceHolder1_hidActivity" name="ctl00$ContentPlaceHolder1$hidActivity">
           <div class="clear">
           <input type="hidden" id="ctl00_ContentPlaceHolder1_hidSId" name="ctl00$ContentPlaceHolder1$hidSId">
           </div>
   </div>

<div class="clear">
</div>

</div>
</@layout.standard>