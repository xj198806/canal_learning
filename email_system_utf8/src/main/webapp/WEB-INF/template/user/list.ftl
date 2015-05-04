<#import "/include/admin_layout.ftl" as layout />
<#import "/include/component.ftl" as component />
<@layout.standard "账号管理" 6>

<script type="text/javascript">
$(document).ready(function(){
    $(".add_score_a").click(function(){
        var spanObj = $(this).parent().find(".score_add_span");
        if (spanObj.is(":hidden"))
            $(this).parent().find(".score_add_span").show();
        else
            $(this).parent().find(".score_add_span").hide();
    });

    $(".add_score_submit").click(function(){
        var uid = $(this).parent().find(".user_id").val();
        var score = $(this).parent().find(".add_score").val();

        if(score == "" || isNaN(score)) {
            alert("请输入数字");
        }
        var submit_url = '/user/addScore.html';
        <#if currentUser?exists&&addType?exists&&addType==1>
        if (score > ${currentUser.score}){
            alert("充值积分不能多于拥有积分！");
            return;
        }
        submit_url = '/email/user/addScore.html';
        </#if>
        $.ajax({
            type: 'POST',
            data:{uid:uid,score:score},
            dataType:'json',
            url: submit_url,
            success: function(res) {
                if (res.code==0) {
                    window.location.href="/user/list.html";
                }else if (res.code==1){
                    window.location.href="/email/user/list.html";
                }else{
                    alert("提交失败，请检查！");
                }
            },
            error: function() {
                alert("提交失败，请检查！");
                //App.tips({type: "error", message: "提交失败，请检查！", autoclose: 3});
            }
        })
    });

})
    function addConfigGroup(uid){
        var group_ids = "";
        $("input[name='config_group_check']").each(function(){
            if ($(this).attr("checked")){
               group_ids += $(this).val()+",";
            }
        })
        if (group_ids == ""){
            alert("请选择要添加的信道");
            return;
        } else {
            group_ids.substring(0,group_ids.length-1);
        }
        $.ajax({
            type: 'POST',
            data:{groupIds:group_ids,uid:uid},
            dataType:'json',
            url: '/email/addUserGroup.html',
            success: function(res) {
                if (res.success) {
                    window.location.href="/user/list.html?page=${page!}";
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

    function removeConfigGroup(uid){
        var group_ids = "";
        $("input[name='config_group_check']").each(function(){
            if ($(this).attr("checked")){
               group_ids += $(this).val()+",";
            }
        })
        if (group_ids == ""){
            alert("请选择要移除的信道组");
            return;
        } else {
            group_ids.substring(0,group_ids.length-1);
        }
        $.ajax({
            type: 'POST',
            data:{groupIds:group_ids,uid:uid},
            dataType:'json',
            url: '/email/removeUserGroup.html',
            success: function(res) {
                if (res.success) {
                    window.location.href="/user/list.html?page=${page!}";
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
</script>

<div id="container">

<div id="ctl00_ContentPlaceHolder1_uplGroups">

<div class="send_body4" style=" width:90%">
<div style="padding-left:25px;">

<table id="tbGroupInfos" border="0" width="100%" cellpadding="10px" cellspacing="5px">

<tbody>
    <tr>
        <td colspan="10">
            <div class="u_note_box2">
                <b class="u_note"><b class="u_note1"><b></b></b><b class="u_note2"><b></b></b><b class="u_note3"></b><b class="u_note4"></b><b class="u_note5"></b></b>
                <div class="u_note_content">
                    <table border="0" width="100%" cellpadding="0" cellspacing="0">
                        <tbody><tr>
                            <td class="u_p" width="50%">
                                账号列表
                            </td>
                            <td class="u_p" width="50%">
                            <#if addType?exists&&addType==1>
                                <a href="/email/user/register.html"> 添加子账号</a>
                            <#else>
                                <a href="/user/register.html"> 添加账号</a>
                            </#if>
                            </td>

                        </tr>
                        </tbody></table>
                </div>
                <b class="u_note"><b class="u_note5"></b><b class="u_note4"></b><b class="u_note3"></b>
                    <b class="u_note2"><b></b></b><b class="u_note1"><b></b></b></b>
            </div>
        </td>
    </tr>
    <#if pageInfo.count gt 0>
    <tr class="listTr" name="9">
        <td colspan="2" width="10%">
            用户ID

        </td>
        <td colspan="2" width="10%">
            用户积分

        </td>
        <td class="subgroup_p8" width="15%">
            用户名称

        </td>
        <td style=" padding-top:5px;" width="15%">
            密码
        </td>
        <td style="15% ">
            邮箱
        </td>
        <#if currentUser?exists&&currentUser.status==1>
        <td style="15% ">
            已分配信道组
        </td>

        <td style="text-align:left; padding-top:5px;" width="12%">
            是否禁用
        </td>
        </#if>
        <td class="subgroup_p8" name="System" width="30%">
            &nbsp;&nbsp;&nbsp;操作
        </td>

    </tr>
    <#list pageInfo.items as user>
    <tr <#if user_index%2==1>style="background-color:#cccccc"</#if> class="listTr" name="9">
        <td colspan="2" width="10%">
            ${user.uid}

        </td>
        <td colspan="2" width="10%">
            ${user.score!}

        </td>
        <td class="subgroup_p8" width="10%">
            ${user.username}

        </td>
        <td style=" padding-top:5px;" width="8%">
            ${user.password}
        </td>
        <td style="15% ">
            ${user.email}
        </td>
        <#if currentUser?exists&&currentUser.status==1>
        <td style="15% ">
            ${user.groupIds}
        </td>

        <td style="text-align:left; padding-top:5px;" width="12%">
            ${user.status}
        </td>
        </#if>
        <td class="subgroup_p8" name="System" width="30%">
            <#if currentUser?exists&&addType?exists&&addType!=1><a>禁用</a>
            | </#if>
            <#if addType?exists&&addType==1>
            <a href="/email/user/register.html?uid=${user.uid}" >编辑</a> |
            <#else>
            <a href="/user/register.html?uid=${user.uid}" >编辑</a> |
            </#if>
            <#if pageInfo2?exists>
                <a href="javascript:addConfigGroup(${user.uid});" class="add_config_group_a">添加信道组</a> |
                <a href="javascript:removeConfigGroup(${user.uid});" class="add_config_group_a">移除信道组</a> |
            </#if>
            <a href="#" class="add_score_a">充值</a>
            <span class="score_add_span" style="display:none;">
            <input type="text" class="add_score input_text" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
            <input type="hidden" class="user_id" value="${user.uid}"/>
            <input type="button" class="add_score_submit" value="确定" />
            </span>
        </td>
    </tr>
    </#list>
    <tr class="listTr" name="9">
        <td  colspan="9">
            <@component.page pageInfo "/user/list.html?page={page}" ""/>
        </td>
    </tr>
    <#else>
        <td colspan="9">
            <div class="u_note_box2">
                暂无数据
            </div>
        </td>
    </tr>
    </#if>


</tbody></table>
</div>
</div>

<#if pageInfo2?exists>
<div class="send_body4" style=" width:80%">
<div style="padding-left:25px;">

<table id="tbGroupInfos" border="0" width="100%" cellpadding="10px" cellspacing="10px">

<tbody>
    <tr>
        <td colspan="10">
            <div class="u_note_box2">
                <b class="u_note"><b class="u_note1"><b></b></b><b class="u_note2"><b></b></b><b class="u_note3"></b><b class="u_note4"></b><b class="u_note5"></b></b>
                <div class="u_note_content">
                    <table border="0" width="100%" cellpadding="0" cellspacing="0">
                        <tbody><tr>
                            <td class="u_p" width="50%">
                                配置列表
                            </td>
                            <td class="u_p" width="50%">
                                <a href="/email/configGroup.html"> 添加信道组</a>
                            </td>

                        </tr>
                        </tbody></table>
                </div>
                <b class="u_note"><b class="u_note5"></b><b class="u_note4"></b><b class="u_note3"></b>
                    <b class="u_note2"><b></b></b><b class="u_note1"><b></b></b></b>
            </div>
        </td>
    </tr>
    <#if pageInfo2.items?size gt 0>
    <tr class="listTr" name="9">
        <td width="10%">
            信道组ID
        </td>
        <td width="10%">
            组名
        </td>
        <td class="u_p" width="50%">
            已分配信道
        </td>
        <td class="subgroup_p8" name="System" width="30%">
            &nbsp;&nbsp;&nbsp;操作
        </td>

    </tr>
    <#list pageInfo2.items as configGroup>
    <tr class="listTr" name="9">
        <td width="10%">
            <input type="checkbox" name='config_group_check' value="${configGroup.id}" />
            ${configGroup.id}
        </td>
        <td width="10%">
            ${configGroup.name}
        </td>
        <td class="u_p" width="30%">
            ${configGroup.configIds}
        </td>
        <td class="subgroup_p8" name="System" width="30%">
            <a href="/email/configGroup.html?id=${configGroup.id}">编辑</a>
        </td>
    </tr>
    </#list>
    <#else>
        <td colspan="9">
            <div class="u_note_box2">
                暂无数据
            </div>
        </td>
    </tr>
    </#if>


</tbody></table>
</div>
</div>
 </#if>
</div>

<div class="clear"></div>
</div>

</@layout.standard>