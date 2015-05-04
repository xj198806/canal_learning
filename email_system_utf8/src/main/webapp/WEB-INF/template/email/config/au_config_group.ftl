<#import "/include/admin_layout.ftl" as layout />
<@layout.standard "信道设置" 7>
<div id="container">

<script type="text/javascript">
    function ttt(){
        var name = $.trim($("#name").val());

        if (name == "" ){
            alert("请输入组名称");
            return ;
        }
        $("#add_group").attr("disabled","true");
        <#if configGroup?exists>
        var id = ${configGroup.id};
        <#else>
        var id = 0;
        </#if>
        $.ajax({
            type: 'POST',
            contentType: 'application/json',
            data:JSON.stringify({id:id,name:name}),
            url: '/email/configGroupAu.html',
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

</script>

<div id="container">

    <div style="width: 70%;" class="send_body1">
        <div class="edit_u">
            新建/编辑信道组</div>
        <div class="light_tan_box2">
            <b class="light_tan"><b class="light_tan1"><b></b></b><b class="light_tan2"><b></b></b>
                <b class="light_tan3"></b><b class="light_tan4"></b><b class="light_tan5"></b>
            </b>
            <div class="light_tan_content">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tbody>
                    <tr>
                        <td class="sub_name">
                            信道组名称：
                            <input type="text" style="width: 40%;" value="<#if configGroup?exists>${configGroup.name}</#if>" class="input_text" id="name" name="name">
                            <font style="color: #f00;">*</font>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <b class="light_tan"><b class="light_tan5"></b><b class="light_tan4"></b><b class="light_tan3">
            </b><b class="light_tan2"><b></b></b><b class="light_tan11"><b></b></b></b>
        </div>
        <div style="padding-left: 25px;">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tbody><tr>
                    <td colspan="2" style="text-align: left; vertical-align: middle;">
                        <input type="image" style="border-width:0px;" src="/static/images/<#if configGroup?exists>save_changes.gif<#else>add02.gif</#if>" id="add_group" onclick="javascript:ttt();">
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
