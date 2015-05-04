<#import "/include/admin_layout.ftl" as layout />
<#import "/include/component.ftl" as component />
<@layout.standard "通讯录管理" 2>
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
        <li><a class="sel" id="nav_sub" href="/email/groupList.html">联系组</a></li>
    </ul>
</div>
<div class="send_u2">
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td style="padding-top:10px;"><p class="send_up"><a href="/email/addGroupPage.html"><img src="/static/images/star.gif" align="absmiddle" />为您的通讯录添加新的联系组</a><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;联系组是所有联系人的组合。</p></td>
            <td style="padding-top:10px;"><ul class="button left" style="padding:0">
                <li><a href="/email/addGroupPage.html" id="btn_group" >新建联系组</a></li>
                <!--li><a href="RejectGoupInfo.aspx?RejectGoupInfo.aspx?Gid=-1" id="btn_exclude" >默认排除组</a></li>
                <li><a href="GroupMerge.aspx" id="btn_combgroup" >合并组</a></li--></ul>
        </tr>
    </table>
</div>
<div class="light_tan_box2"> <b class="light_tan"> <b class="light_tan1"><b></b></b> <b class="light_tan2"><b></b></b> <b class="light_tan3"></b> <b class="light_tan4"></b> <b class="light_tan5"></b> </b>
    <div class="light_tan_content">
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td class="sub_find" width="280px;"> <img src="/static/images/search.gif" align="absmiddle" /> <input name="ctl00$ContentPlaceHolder1$txtGroupNameS" type="text" id="ctl00_ContentPlaceHolder1_txtGroupNameS" class="input_text" style="width:180px;" />
                    <input type="submit" name="ctl00$ContentPlaceHolder1$btnSearch" value="搜索" id="ctl00_ContentPlaceHolder1_btnSearch" /></td>
                <td class="sub_find"  style="display:none;"><a href="#" onclick="show()"><img src="/static/images/plus.gif" align="absmiddle"  style="margin-left:5px;" /> 更多搜索</a></td>
            </tr>
        </table>
    </div>
    <b class="light_tan"> <b class="light_tan5"></b> <b class="light_tan4"></b> <b class="light_tan3"></b> <b class="light_tan2"><b></b></b> <b class="light_tan11"><b></b></b> </b> </div>
<div id="ctl00_ContentPlaceHolder1_uplGroups">

<div class="send_body4" style=" width:70%">
<div style="padding-left:25px;">
<div  class="convd" id="zhezhao">
    <div id="Son"  style=" vertical-align:middle; margin:0 auto; margin-top:400px; display:none; z-index:1000px;">
        <img src="/static/images/loading.gif" width="260" height="55" vspace="2" style="border:solid 1px #c00;" />
    </div>
</div>
<#if pageInfo.count gt 0>
<table border="0" cellpadding="0" cellspacing="0" width="100%" id="tbGroupInfos" >

<tr>
    <td  colspan="9">
        <div class="u_note_box2">
            <b class="u_note"><b class="u_note1"><b></b></b><b class="u_note2"><b></b></b><b
                    class="u_note3"></b><b class="u_note4"></b><b class="u_note5"></b></b>
            <div class="u_note_content">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td width="50%" class="u_p">
                            显示联系组&nbsp&nbsp共(<span id="ctl00_ContentPlaceHolder1_lblRecordCount" class="cibiaoti">${pageInfo.count}</span>)
                        </td>
                        <td width="50%" class="send_p1">
                            <a id="ctl00_ContentPlaceHolder1_UpdateAllGroupNum" href="javascript:__doPostBack('ctl00$ContentPlaceHolder1$UpdateAllGroupNum','')">更新组中人数</a>
                        </td>
                    </tr>
                </table>
            </div>
            <b class="u_note"><b class="u_note5"></b><b class="u_note4"></b><b class="u_note3"></b>
                <b class="u_note2"><b></b></b><b class="u_note1"><b></b></b></b>
        </div>
    </td>
</tr>
<#list pageInfo.items as group>
<tr class="listTr" name='9'>
    <td  colspan="2" width="28%">
        <input type="checkbox" id='892542' />
        <a href='#' style=" color:#35639C" title="${group.name}">
            ${group.name}</a>

    </td>
    <td width="10%" class="subgroup_p8" >
        <span style="color:#666;">${group.count}人</span>
        <img align="absmiddle" id='892542' class="imgUpdate" src="/static/images/refresh.png" alt="更新组中人数" title="更新组中人数" style="cursor:pointer; " />

    </td>
    <td width="8%" style=" padding-top:5px;">
        <div class="right" style="width:100%;" >
            <a href='/email/addGroupPage.html?groupId=${group.id}' style=" color:#35639c">编辑组</a></div>
    </td>
    <td style="width:11%;height:20px; padding-top:8px; padding-bottom:2px  ">
        <a href="/email/addList.html?groupId=${group.id}" style=" color:rgb(53,99,156);">添加联系人</a>
    </td>

    <td width="12%" style="text-align:left; padding-top:5px;" >
        <div name="System">
            <a href='/email/emailList.html?groupId=${group.id}' style=" color:#35639c">查看该组成员</a></div>
    </td>
    <td width="10%" class="subgroup_p8"  name="System">
        <div   name="System">
            <a id="ctl00_ContentPlaceHolder1_rptGroup_ctl00_btnDelete" href="javascript:deleteGroup(${group.id});">仅删除组</a>
        </div>
    </td>
    <td width="13%" class="subgroup_p8"  name="System">
        <div   name="System">
            <a id="ctl00_ContentPlaceHolder1_rptGroup_ctl00_btnDeleteAll" href="javascript:deleteGroupList(${group.id});">删除组及成员</a>
        </div>
    </td>
</tr>
</#list>


<!--tr id="ctl00_ContentPlaceHolder1_rptGroup_ctl08_selectAll" style="padding-top: 30px; height: 50px">
    <td style="padding: 10px 0px 0px 10px;" class="sublist_p4" colspan="8">
        <a href="javascript:void(0)" style="font-size: 14px; color: #35639c;" onclick="selectGroups('all')">全选</a> |
        <a href="javascript:void(0)" style="font-size: 14px; color: #35639c;" onclick="selectGroups('none')">全不选</a> |
        <a href="#" style="color: #35639c; text-decoration:underline;">
            <a onclick="return getDetGroupId();" id="ctl00_ContentPlaceHolder1_rptGroup_ctl08_batchDeleteBtn" href="javascript:__doPostBack('ctl00$ContentPlaceHolder1$rptGroup$ctl08$batchDeleteBtn','')">
                <span style=" font-size:14px;color: #35639c;"> 删除所选组及成员</span></a><a>
    </td>
</tr-->


<tr>
    <td  colspan="9">
        <div class="u_note_box2">
            <b class="u_note"><b class="u_note1"><b></b></b><b class="u_note2"><b></b></b><b
                    class="u_note3"></b><b class="u_note4"></b><b class="u_note5"></b></b>
            <div class="u_note_content">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr class="send_p1">
                        <td  class="u_p">
                            显示联系组&nbsp&nbsp共(<span id="ctl00_ContentPlaceHolder1_lblRecordCount" class="cibiaoti">${pageInfo.count}</span>)
                            <div class="right" style="padding-right:5px">
                                <@component.page pageInfo "/email/groupList.html?page={page}" ""/>

                            </div>

                        </td>
                    </tr>
                </table>
            </div>
            <b class="u_note"><b class="u_note5"></b><b class="u_note4"></b><b class="u_note3"></b>
                <b class="u_note2"><b></b></b><b class="u_note1"><b></b></b></b>
        </div>
    </td>
</tr>
</table>
<#else>
    暂无数据
</#if>
</div>
</div>

</div>

<div class="send_body6">
    <div class="subgroup3">
        <div class="subgroup_note_box"> <b class="subgroup_note"> <b class="subgroup_note1"><b></b></b> <b class="subgroup_note2"><b></b></b> <b class="subgroup_note3"></b> <b class="subgroup_note4"></b> <b class="subgroup_note5"></b> </b>
            <div class="subgroup_note_content">
                <p class="subgroup_notep"><img src="/static/images/light.gif" align="absmiddle"/></p>
                <p class="subgroup_notep"><font style="color:#f00; letter-spacing:1.2px;">仅删除组：</font> 只删除联系人和组的关系，不会删除联系人。</p>
                <p class="subgroup_notep"><font style="color:#f00; letter-spacing:1.2px;">删除组及成员：</font> 删除联系人和组的关系，并删除联系人。</p>
                <p class="subgroup_notep" style="display:none;"><font style="color:#f00; letter-spacing:1.2px;">组显示提前：</font> 可把常用组提前，便于后期操作、维护及查看。</p>
            </div>
            <b class="subgroup_note"> <b class="subgroup_note5"></b> <b class="subgroup_note4"></b> <b class="subgroup_note3"></b> <b class="subgroup_note2"><b></b></b> <b class="subgroup_note1"><b></b></b> </b> </div>
    </div>


    <!--div class="dashblue_box3"> <b class="dashblue"> <b class="dashblue1"><b></b></b> <b class="dashblue2"><b></b></b> <b class="dashblue3"></b> <b class="dashblue4"></b> <b class="dashblue5"></b> </b>

        <div class="dashjiange"></div>

        <div class="dashblue_content">
            <div class="dashlight_blue_box" style="padding:0pt;"> <b class="dashlight_blue"> <b class="dashlight_blue1"><b></b></b> <b class="dashlight_blue2"><b></b></b> <b class="dashlight_blue3"></b> <b class="dashlight_blue4"></b> <b class="dashlight_blue5"></b> </b>
                <div class="dashlight_blue_content">
                    <p class="dash_td3"> <input value="radCopy" name="ctl00$ContentPlaceHolder1$radmode" type="radio" id="ctl00_ContentPlaceHolder1_radCopy" checked="checked" />复制组 &nbsp&nbsp<input value="radMerge" name="ctl00$ContentPlaceHolder1$radmode" type="radio" id="ctl00_ContentPlaceHolder1_radMerge" />合并组</p>
                </div>
                <b class="dashlight_blue"> <b class="dashlight_blue5"><b></b></b> <b class="dashlight_blue4"><b></b></b> <b class="dashlight_blue3"></b> <b class="dashlight_blue2"></b> <b class="dashlight_blue1"></b><b style="background:#cdddfb; height:5px;"></b> </b> </div>
        </div>


        <div class="dashblue_content">
            <div class="dashwhite_box" style="padding:0pt;"> <b class="dashwhite"> <b class="dashwhite1"><b></b></b> <b class="dashwhite2"><b></b></b> <b class="dashwhite3"></b> <b class="dashwhite4"></b> <b class="dashwhite5"></b> </b>
                <div class="dashwhite_content">
                    <div id="ctl00_ContentPlaceHolder1_uplExportToGroup">

                        <table  border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td class="sub_tianjia"><input value="rdoAddToExist" name="ctl00$ContentPlaceHolder1$rdoGroup" type="radio" id="ctl00_ContentPlaceHolder1_rdoAddToExist" /><span id="spanExist">到现有组</span></td>
                            </tr>
                            <tr>
                                <td class="sub_tianjia border" style="padding-left:25px; padding-bottom:5px;height:30px;"><select name="ctl00$ContentPlaceHolder1$ddlGroups" id="ctl00_ContentPlaceHolder1_ddlGroups" style="padding-left: 20px; padding: 1px;
                                                    width: 80%; font-size: 12px;">
                                    <option value="951732">mk</option>
                                    <option value="948656">测试8.28-女性时尚</option>
                                    <option value="896779">11</option>
                                    <option value="892949">ray2</option>
                                    <option value="892945">ray</option>
                                    <option value="892542">订阅组</option>
                                    <option value="892540">无效地址组</option>
                                    <option value="892541">退订组</option>

                                </select></td>
                            </tr>
                            <tr>
                                <td class="sub_tianjia"><input value="rdoNew" name="ctl00$ContentPlaceHolder1$rdoGroup" type="radio" id="ctl00_ContentPlaceHolder1_rdoNew" /><span id="spanNew">到新建组</span></td>
                            </tr>

                            <tr>
                                <td class="sub_tianjia" style="padding-left: 25px;height:30px;">
                                    组名:<input name="ctl00$ContentPlaceHolder1$txtGroupName" type="text" id="ctl00_ContentPlaceHolder1_txtGroupName" style="padding: 1px; width: 120px;" />
                                </td>
                            </tr>
                            <tr>
                                <td class="sub_tianjia border" style="padding-left:25px; padding-bottom:5px;">描述:<textarea name="ctl00$ContentPlaceHolder1$txtDescription" rows="3" cols="25" id="ctl00_ContentPlaceHolder1_txtDescription" style="border:1px solid #7F9DB9; width: 95%;"></textarea></td>
                            </tr>
                            <tr>
                                <td class="sub_tianjia" style="padding-left:25px; padding-bottom:5px;"><a href="#"><input type="submit" name="ctl00$ContentPlaceHolder1$btnAddToGroup" value="确定" onclick="return getGroups();" id="ctl00_ContentPlaceHolder1_btnAddToGroup" /></a></td>
                                <input name="ctl00$ContentPlaceHolder1$selectedGroups" type="hidden" id="ctl00_ContentPlaceHolder1_selectedGroups" />
                            </tr>
                        </table>

                    </div>
                </div>
                <b class="dashwhite"> <b class="dashwhite5"><b></b></b> <b class="dashwhite4"><b></b></b> <b class="dashwhite3"></b> <b class="dashwhite2"></b> <b class="dashwhite1"></b> </b> </div>
        </div>
        <b class="dashblue"> <b class="dashblue5"></b> <b class="dashblue4"></b> <b class="dashblue3"></b> <b class="dashblue2"><b></b></b> <b class="dashblue1"><b></b></b> </b> </div>
        -->
</div>

<div class="clear">
</div></div>

<script type="text/javascript">

    function deleteGroup(gid){
       if(window.confirm('你确定要删除该记录?')){
           $.ajax({
               type: 'POST',
               data:{gid:gid},
               dataType:'json',
               url: '/email/deleteGroup.html',
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

    function deleteGroupList(gid){
       if(window.confirm('你确定要删除该记录?')){
           $.ajax({
               type: 'POST',
               data:{gid:gid},
               dataType:'json',
               url: '/email/deleteGroupList.html',
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