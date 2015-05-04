<#import "/include/admin_layout.ftl" as layout />
<@layout.standard "信道设置" 7>
<div id="container">

<script type="text/javascript">
    function ttt(){
        var config_id = $.trim($("#config_id").val());
        var uid = $.trim($("#uid").val());
        var username = $.trim($("#username").val());
        var password = $("#password").val();
        var host = $("#host").val();
        var port = $("#port").val();
        var conn = $("#conn").val();
        var ssl = $("#ssl").val();
        var auth = $("#auth").val();

        if (username == "" || password == "" || host == "" || port == ""){
            alert("请输入配置信息");
            return ;
        }
        //alert(config_id+"==="+username+"==="+password+"==="+host+"==="+port+"==="+conn+"==="+ssl+"==="+auth);
        $("#add_group").attr("disabled","true");
        $.ajax({
            type: 'POST',
            contentType: 'application/json',
            data:JSON.stringify({id:config_id,uid:uid,username:username,password:password,host:host,port:port,conn:conn,ssl:ssl,auth:auth}),
            url: '/email/configAu.html',
            success: function(res) {
                var resObj = JSON.parse(res);
                if (resObj.success) {
                    window.location.href="/email/configList.html";
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

    <#if config?exists>
    $("#conn").val("${config.conn}");
    $("#ssl").val("${config.ssl}");
    $("#auth").val("${config.auth}");
    </#if>

</script>

<div id="container">

    <div style="width: 70%;" class="send_body1">
        <div class="edit_u">
            新建/编辑信道配置</div>
        <div class="light_tan_box2">
            <b class="light_tan"><b class="light_tan1"><b></b></b><b class="light_tan2"><b></b></b>
                <b class="light_tan3"></b><b class="light_tan4"></b><b class="light_tan5"></b>
            </b>
            <div class="light_tan_content">
                <input type="hidden"  id="config_id" name="config_id" value="<#if config?exists>${config.id}<#else>0</#if>" />
                <#if config?exists>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tbody>
                    <tr>
                        <td class="sub_name">
                            用户ID：
                            <input type="text" style="width: 40%;" value="${config.uid}" class="input_text" id="uid" name="uid">
                            <font style="color: #f00;">*</font>
                        </td>
                    </tr>
                    <tr>
                        <td class="sub_name">
                            用户名：
                            <input type="text" style="width: 40%;" value="${config.username}" class="input_text" id="username" name="username">
                            <font style="color: #f00;">*</font>
                        </td>
                    </tr>
                    <tr valign="top">
                        <td class="sub_name">
                            密&nbsp;&nbsp;&nbsp;码：
                             <input type="text" style="width: 40%;" value="${config.password}" class="input_text" id="password" name="password">
                            <font style="color: #f00;">*</font>
                        </td>
                    </tr>
                    <tr valign="top">
                        <td class="sub_name">
                            域&nbsp;&nbsp;&nbsp;名：
                             <input type="text" style="width: 40%;" value="${config.host}" class="input_text" id="host" name="host">
                            <font style="color: #f00;">*</font>
                        </td>
                    </tr>
                    <tr valign="top">
                    <td class="sub_name">
                        端&nbsp;&nbsp;&nbsp;口：
                         <input type="text" style="width: 40%;" value="${config.port}" class="input_text" id="port" name="port">
                        <font style="color: #f00;">*</font>
                    </td>
                    </tr>
                    <tr valign="top">
                    <td class="sub_name">
                        连接类型：
                         <select id="conn" name="conn">
                              <option <#if config.conn==0>selected="selected"</#if> value="0">PlanText</option>
                              <option <#if config.conn==1>selected="selected"</#if> value="1">SSL_TLS</option>
                              <option <#if config.conn==2>selected="selected"</#if> value="2">STARTTLS</option>
                              <option <#if config.conn==3>selected="selected"</#if> value="3">AutoUpgradeSTARTTLS</option>
                         </select>
                        <font style="color: #f00;">*</font>
                    </td>
                    </tr>
                    <tr valign="top">
                    <td class="sub_name">
                        SSL：
                         <select id="ssl" name="ssl">
                              <option <#if config.ssl==0>selected="selected"</#if> value="0">SSLv2orv3</option>
                              <option <#if config.ssl==1>selected="selected"</#if> value="1">TLSv1</option>
                              <option <#if config.ssl==2>selected="selected"</#if> value="2">TLSv1_1</option>
                              <option <#if config.ssl==3>selected="selected"</#if> value="3">TLSv1_2</option>
                              <option <#if config.ssl==4>selected="selected"</#if> value="4">DTLSv1</option>
                         </select>
                        <font style="color: #f00;">*</font>
                    </td>
                    </tr>
                    <tr valign="top">
                    <td class="sub_name">
                        auth：
                         <select id="auth" name="auth">
                              <option <#if config.auth==0>selected="selected"</#if> value="0">AUTH_NONE</option>
                              <option <#if config.auth==1>selected="selected"</#if> value="1">AUTH_CRAM_MD5</option>
                              <option <#if config.auth==2>selected="selected"</#if> value="2">AUTH_LOGIN</option>
                              <option <#if config.auth==3>selected="selected"</#if> value="3">AUTH_PLAIN</option>
                              <option <#if config.auth==4>selected="selected"</#if> value="4">AUTH_NTLM</option>
                              <option <#if config.auth==5>selected="selected"</#if> value="5">AUTH_AUTO</option>
                         </select>
                        <font style="color: #f00;">*</font>
                    </td>
                    </tr>
                    </tbody></table>
                <#else>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tbody>
                    <tr>
                        <td class="sub_name">
                            用户名：
                            <input type="text" style="width: 40%;" value="" class="input_text" id="uid" name="uid">
                            <font style="color: #f00;">*</font>
                        </td>
                    </tr>
                    <tr>
                        <td class="sub_name">
                            用户名：
                            <input type="text" style="width: 40%;" class="input_text" id="username" name="username">
                            <font style="color: #f00;">*</font>
                        </td>
                    </tr>
                    <tr valign="top">
                        <td class="sub_name">
                            密&nbsp;&nbsp;&nbsp;码：
                             <input type="text" style="width: 40%;" class="input_text" id="password" name="password">
                            <font style="color: #f00;">*</font>
                        </td>
                    </tr>
                    <tr valign="top">
                        <td class="sub_name">
                            域&nbsp;&nbsp;&nbsp;名：
                             <input type="text" style="width: 40%;" class="input_text" id="host" name="host">
                            <font style="color: #f00;">*</font>
                        </td>
                    </tr>
                    <tr valign="top">
                    <td class="sub_name">
                        端&nbsp;&nbsp;&nbsp;口：
                         <input type="text" style="width: 40%;" class="input_text" id="port" name="port">
                        <font style="color: #f00;">*</font>
                    </td>
                    </tr>
                    <tr valign="top">
                    <td class="sub_name">
                        连接类型：
                         <select id="conn" name="conn">
                              <option value="0">PlanText</option>
                              <option value="1">SSL_TLS</option>
                              <option value="2">STARTTLS</option>
                              <option value="3">AutoUpgradeSTARTTLS</option>
                         </select>
                        <font style="color: #f00;">*</font>
                    </td>
                    </tr>
                    <tr valign="top">
                    <td class="sub_name">
                        SSL：
                         <select id="ssl" name="ssl">
                              <option value="0">SSLv2orv3</option>
                              <option value="1">TLSv1</option>
                              <option value="2">TLSv1_1</option>
                              <option value="3">TLSv1_2</option>
                              <option value="4">DTLSv1</option>
                         </select>
                        <font style="color: #f00;">*</font>
                    </td>
                    </tr>
                    <tr valign="top">
                    <td class="sub_name">
                        auth：
                         <select id="auth" name="auth">
                              <option value="0">AUTH_NONE</option>
                              <option value="1">AUTH_CRAM_MD5</option>
                              <option value="2">AUTH_LOGIN</option>
                              <option value="3">AUTH_PLAIN</option>
                              <option value="4">AUTH_NTLM</option>
                              <option value="5">AUTH_AUTO</option>
                         </select>
                        <font style="color: #f00;">*</font>
                    </td>
                    </tr>
                    </tbody></table>
                </#if>
            </div>
            <b class="light_tan"><b class="light_tan5"></b><b class="light_tan4"></b><b class="light_tan3">
            </b><b class="light_tan2"><b></b></b><b class="light_tan11"><b></b></b></b>
        </div>
        <div style="padding-left: 25px;">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tbody><tr>
                    <td colspan="2" style="text-align: left; vertical-align: middle;">
                        <input type="image" style="border-width:0px;" src="/static/images/<#if config?exists>save_changes.gif<#else>add02.gif</#if>" id="add_group" onclick="javascript:ttt();">
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
