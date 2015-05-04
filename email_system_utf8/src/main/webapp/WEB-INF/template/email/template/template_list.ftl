<#import "/include/admin_layout.ftl" as layout />
<#import "/include/component.ftl" as component />
<@layout.standard "模板管理" 3>
<script type="text/javascript">

</script>

<div id="container">
    <div id="ctl00_ContentPlaceHolder1_uplEmail">

        <div class="send_body">
            <div style="margin: 25px 25px 0 25px;">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tbody><tr>
                        <td class="newnav1">
                            &nbsp;
                        </td>
                        <td class="newnav">
                            <span class="newnav_t">
                                <img align="absmiddle" src="/static/images/sub_002.gif">邮件模板</span> <span class="newnav_w1">
                                    <img align="absmiddle" src="/static/images/step_1.gif">新建EMAIL<img align="absmiddle" src="/static/images/right.gif"></span> <span class="newnav_w">
                                            <img align="absmiddle" src="/static/images/step2.gif">选择邮件类型</span>
                            <span class="newnav_w">
                                <img align="absmiddle" src="/static/images/step3.gif">编辑邮件模板</span> <span class="newnav_w">
                                    <img align="absmiddle" src="/static/images/step4.gif">保存邮件</span>
                        </td>
                        <td class="newnav2">
                            &nbsp;
                        </td>
                    </tr>
                </tbody></table>
            </div>
        </div>
        <div class="clear"></div>

        <div style="margin-top:20px;" class="send_u2">
            <ul class="tabs">
                <li class="current"><a href="EmailList.aspx" id="nav_allmb" class="sel">&nbsp;所 有 模 版&nbsp;</a></li>
            </ul>
        </div>

        <div style="width:72%;" class="send_body1">
            <div class="send_u1">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tbody><tr>
                        <td style="padding-top: 10px;">
                            <p class="send_up">
                                <a href="/email/newTemplate.html">
                                    <img align="absmiddle" src="/static/images/star.gif">新建一封电子邮件</a><br>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;创建你要发送的内容，然后对你的客户进行发送。</p>
                        </td>
                        <td>
                            <ul class="button left">
                                <li><a id="btn_creat" href="/email/newTemplate.html">新建email</a></li></ul>
                        </td>
                    </tr>
                </tbody></table>
            </div>
            <div class="sendlist">
                <div id="zhezhao" class="convd">
                    <div style=" vertical-align:middle; margin:0 auto; margin-top:400px; display:none; z-index:1000px;" id="Son">
                            <img width="260" vspace="2" height="55" style="border:solid 1px #c00;" src="/static/images/loading.gif">
                     </div>
            </div>
                <#if pageInfo.count gt 0>
                <table width="100%" border="0" cellspacing="0" cellpadding="0" style="table-layout:fixed;">
                    <tbody><tr>
                        <td colspan="2">
                            <div class="u_note_box2">
                                <b class="u_note"><b class="u_note1"><b></b></b><b class="u_note2"><b></b></b><b class="u_note3"></b><b class="u_note4"></b><b class="u_note5"></b></b>
                                <div class="u_note_content">
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tbody><tr>
                                            <td width="50%" class="u_p">
                                                显示邮件&nbsp;&nbsp;共(<span class="cibiaoti" id="ctl00_ContentPlaceHolder1_lblRecordCountTop">${pageInfo.count}</span>)
                                            </td>
                                            <td width="50%" class="send_p1">

                                                <!-- AspNetPager 7.3.2  Copyright:2008-2011 Focussend Computer Co., Ltd. (http://www.focussend.com) -->
                                                <@component.page pageInfo "/email/templateList.html?page={page}" ""/>
                                                <!-- AspNetPager 7.3.2  Copyright:2008-2011 Focussend Computer Co., Ltd. (http://www.focussend.com) -->


                                            </td>
                                        </tr>
                                    </tbody></table>
                                </div>
                                <b class="u_note"><b class="u_note5"></b><b class="u_note4"></b><b class="u_note3"></b>
                                    <b class="u_note2"><b></b></b><b class="u_note1"><b></b></b></b>
                            </div>
                        </td>
                    </tr>


                    <#list pageInfo.items as template>
                    <tr class="listTr">
                        <td width="75%" style="overflow:hidden;text-overflow:ellipsis;white-space:nowrap;" class="sendlist_p4">
                            <a title="mk outlet" href="#">
                                <img align="absmiddle" src="/static/images/tag.gif">${template.title}</a>&nbsp;
                            <span class="yulan"></span>
                        </td>
                        <td class="sendlist_p5">
                            <a href="/email/preview.html?tid=${template.id}" target="_blank">
                                <img align="absmiddle" src="/static/images/html.gif">预览&nbsp;&nbsp;</a><img align="absmiddle" src="/static/images/dot02.gif">
                            <a href="/email/newTemplate.html?tid=${template.id}">编辑</a>
                            <img align="absmiddle" src="/static/images/dot02.gif">
                            <span class="sendlist_del">
                                <a href="javascript:deleteTemplate(${template.id});" id="ctl00_ContentPlaceHolder1_rptEmail_ctl00_btnDelete"><img align="absmiddle" src="/static/images/dot_del.gif">删除</a></span>
                        </td>
                    </tr>
                    </#list>


                    <tr>
                        <td colspan="2">
                            <div class="u_note_box2">
                                <b class="u_note"><b class="u_note1"><b></b></b><b class="u_note2"><b></b></b><b class="u_note3"></b><b class="u_note4"></b><b class="u_note5"></b></b>
                                <div class="u_note_content">
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tbody><tr>
                                            <td width="50%" class="u_p">
                                                显示邮件&nbsp;&nbsp;共(<span class="cibiaoti" id="ctl00_ContentPlaceHolder1_lblRecordCountTop">${pageInfo.count}</span>)
                                            </td>
                                            <td width="50%" class="send_p1">

                                                <@component.page pageInfo "/email/templateList.html?page={page}" ""/>
                                            </td>
                                        </tr>
                                    </tbody></table>
                                </div>
                                <b class="u_note"><b class="u_note5"></b><b class="u_note4"></b><b class="u_note3"></b>
                                    <b class="u_note2"><b></b></b><b class="u_note1"><b></b></b></b>
                            </div>
                        </td>
                    </tr>
                </tbody>
                </table>
                <#else>
                    <br/><br/><br/>
                    &nbsp;&nbsp;&nbsp;&nbsp;暂无数据
                </#if>
            </div>
        </div>
        <div class="send_body2">
            <div class="blue_box5">
                <b class="blue"><b class="blue1"><b></b></b><b class="blue2"><b></b></b><b class="blue3">
                </b><b class="blue4"></b><b class="blue5"></b></b>
                <div class="blue_content">
                    <div style="padding: 0pt;" class="light_blue_box">
                        <b class="light_blue"><b class="light_blue1"><b></b></b><b class="light_blue2"><b></b>
                        </b><b class="light_blue3"></b><b class="light_blue4"></b><b class="light_blue5"></b>
                        </b>
                        <div class="light_blue_content">
                            <table width="100%">
                                <tbody><tr>
                                    <td class="align_left">
                                        搜索
                                    </td>
                                </tr>
                            </tbody></table>
                        </div>
                        <b class="light_blue"><b class="light_blue5"><b></b></b><b class="light_blue4"><b></b>
                        </b><b class="light_blue3"></b><b class="light_blue2"></b><b class="light_blue1"></b>
                            <b style="background: #cdddfb; height: 5px;"></b></b>
                    </div>
                </div>
                <div class="blue_content">
                    <div style="padding: 0pt;" class="white_box">
                        <b class="white"><b class="white1"><b></b></b><b class="white2"><b></b></b><b class="white3">
                        </b><b class="white4"></b><b class="white5"></b></b>
                        <div class="white_content">
                            <table width="100%">
                                <tbody><tr>
                                    <td width="100%">
                                        <img align="absmiddle" src="/static/images/search.gif">
                                        <input type="text" style="width: 50%" size="20" id="ctl00_ContentPlaceHolder1_txtStr" maxlength="20" name="ctl00$ContentPlaceHolder1$txtStr">
                                        <input type="submit" id="ctl00_ContentPlaceHolder1_btnSearch" value="搜索" name="ctl00$ContentPlaceHolder1$btnSearch">
                                    </td>
                                </tr>
                            </tbody></table>
                        </div>
                        <b class="white"><b class="white5"><b></b></b><b class="white4"><b></b></b><b class="white3">
                        </b><b class="white2"></b><b class="white1"></b></b>
                    </div>
                </div>
                <b class="blue"><b class="blue5"></b><b class="blue4"></b><b class="blue3"></b><b class="blue2"><b></b></b><b class="blue1"><b></b></b></b>
            </div>

        </div>
    </div>
    <div class="clear">
        <input type="hidden" id="ctl00_ContentPlaceHolder1_hidGroupName" name="ctl00$ContentPlaceHolder1$hidGroupName">
    </div>
</div>

<script type="text/javascript">

    function deleteTemplate(tid){
       if(window.confirm('你确定要删除该记录?')){
           $.ajax({
               type: 'POST',
               data:{tid:tid},
               dataType:'json',
               url: '/email/deleteTemplate.html',
               success: function(res) {
                   if (res.success) {
                       //alert("删除成功");
                       window.location.reload();
                   }else{
                       alert("提交失败，请检查！");
                   }
               },
               error: function() {
                   alert("提交失败，请检查！");
                   //App.tips({type: "error", message: "提交失败，请检查！", autoclose: 3});
               }
           })
       }
    }

</script>

</@layout.standard>