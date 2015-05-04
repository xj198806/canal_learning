<#import "/include/admin_layout.ftl" as layout />
<@layout.standard "通讯录管理" 2>

<script type="text/javascript">
    function ttt(){
        var name = $.trim($("#group_name").val());
        var desc = $.trim($("#group_desc").val());

        if (name == ""){
            alert("请输入组名");
            return ;
        }
        $("#add_group").attr("disabled","true");
        $.ajax({
            type: 'POST',
            async:false,
            data:{groupId:<#if group?exists>${group.id}<#else>0</#if>,name:name,desc:desc},
            dataType:'json',
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            url: '/email/addGroup.html',
            success: function(res) {
                if (res.success) {
                    window.location.href="/email/groupList.html";
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

    <div class="send_body1" style="width: 70%;">
        <div class="edit_u">
            新建/编辑联系组</div>
        <div class="light_tan_box2">
            <b class="light_tan"><b class="light_tan1"><b></b></b><b class="light_tan2"><b></b></b>
                <b class="light_tan3"></b><b class="light_tan4"></b><b class="light_tan5"></b>
            </b>
            <div class="light_tan_content">

                <table border="0" width="100%" cellpadding="0" cellspacing="0">
                    <tbody><tr>
                        <td class="sub_name">
                            组名：
                            <input name="ctl00$ContentPlaceHolder1$txtGroupName" id="group_name" class="input_text" <#if group?exists>value="${group.name}"</#if> style="width: 40%;" type="text">
                            <font style="color: #f00;">*</font>
                        </td>
                    </tr>
                    <tr valign="top">
                        <td class="sub_name" style="padding-bottom: 15px;">
                            描述：
                            <textarea name="ctl00$ContentPlaceHolder1$txtDescription" id="group_desc" cols="50" rows="3" style="width: 40%"><#if group?exists>${group.desc}</#if></textarea>
                        </td>
                    </tr>
                    </tbody></table>
            </div>
            <b class="light_tan"><b class="light_tan5"></b><b class="light_tan4"></b><b class="light_tan3">
            </b><b class="light_tan2"><b></b></b><b class="light_tan11"><b></b></b></b>
        </div>
        <div style="padding-left: 25px;">
            <table border="0" width="100%" cellpadding="0" cellspacing="0">
                <tbody><tr>
                    <td style="text-align: left; vertical-align: middle;" colspan="2">
                        <input onclick="javascript:ttt();" id="add_group" src="/static/images/<#if group?exists>save_changes.gif<#else>add02.gif</#if>" style="border-width:0px;" type="image">
                        <input style="border: none;" src="/static/images/over.gif" onclick="javascript:window.location.href='/email/groupList.html';return false;" type="image">
                    </td>
                </tr>
                </tbody></table>
        </div>
    </div>

    <div class="clear">
    </div>
</div>
</@layout.standard>