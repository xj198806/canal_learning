<#import "/include/admin_layout.ftl" as layout />
<@layout.standard "账号管理" 6>
<div id="container">

<script type="text/javascript">
    function ttt(){
        var username = $.trim($("#username").val());
        var password = $("#password").val();
        var email = $("#email").val();

        if (username == "" || password == "" || email == ""){
            alert("请输入用户信息");
            return ;
        }
        var submit_url = '/user/register.html';
        <#if addType?exists&&addType==1>
        submit_url = '/email/user/register.html';
        </#if>
        <#if user?exists>
        var uid = ${user.uid};
        <#else>
        var uid = 0;
        </#if>
        $("#add_group").attr("disabled","true");
        $.ajax({
            type: 'POST',
            async:false,
            data:{uid:uid,username:username,password:password,email:email},
            dataType:'json',
            url:submit_url,
            success: function(res) {
                if (res.code==0) {
                    window.location.href="/user/list.html";
                }else if (res.code==1){
                    alert("修改成功");
                    history.back();
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

    <div style="width: 70%;" class="send_body1">
        <div class="edit_u">
            新建/编辑账户</div>
        <div class="light_tan_box2">
            <b class="light_tan"><b class="light_tan1"><b></b></b><b class="light_tan2"><b></b></b>
                <b class="light_tan3"></b><b class="light_tan4"></b><b class="light_tan5"></b>
            </b>
            <div class="light_tan_content">

                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tbody><tr>
                        <td class="sub_name">
                            用户名：
                            <input type="text" style="width: 40%;" value="<#if user?exists>${user.username}</#if>" class="input_text" id="username" name="username">
                            <font style="color: #f00;">*</font>
                        </td>
                    </tr>
                    <tr valign="top">
                        <td class="sub_name">
                            密&nbsp;&nbsp;&nbsp;码：
                             <input type="text" style="width: 40%;" value="<#if user?exists>${user.password}</#if>" class="input_text" id="password" name="password">
                            <font style="color: #f00;">*</font>
                        </td>
                    </tr>
                    <tr valign="top">
                        <td class="sub_name">
                            邮&nbsp;&nbsp;&nbsp;箱：
                             <input type="text" style="width: 40%;" value="<#if user?exists>${user.email}</#if>" class="input_text" id="email" name="email">
                            <font style="color: #f00;">*</font>
                        </td>
                    </tr>
                    </tbody></table>
            </div>
            <b class="light_tan"><b class="light_tan5"></b><b class="light_tan4"></b><b class="light_tan3">
            </b><b class="light_tan2"><b></b></b><b class="light_tan11"><b></b></b></b>
        </div>
        <div style="padding-left: 25px;">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tbody><tr>
                    <td colspan="2" style="text-align: left; vertical-align: middle;">
                        <input type="image" style="border-width:0px;" src="/static/images/<#if user?exists>save_changes.gif<#else>add02.gif</#if>" id="add_group" onclick="javascript:ttt();">
                        <input type="image" onclick="history.back();" src="/static/images/over.gif" style="border: none;">
                    </td>
                </tr>
                </tbody></table>
        </div>
    </div>

    <div class="clear">
    </div>
</div>
</@layout.standard>
