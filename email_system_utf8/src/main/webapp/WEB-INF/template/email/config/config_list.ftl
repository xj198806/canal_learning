<#import "/include/admin_layout.ftl" as layout />
<#import "/include/component.ftl" as component />
<@layout.standard "信道设置" 7>
<div id="container">
<div id="ctl00_ContentPlaceHolder1_uplGroups">

<div class="send_body4" style=" width:90%">
<div style="padding-left:25px;">

<table id="tbGroupInfos" border="0" width="100%" cellpadding="0" cellspacing="0">

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
                                <a href="/email/config.html"> 添加信道</a>
                            </td>

                        </tr>
                        </tbody></table>
                </div>
                <b class="u_note"><b class="u_note5"></b><b class="u_note4"></b><b class="u_note3"></b>
                    <b class="u_note2"><b></b></b><b class="u_note1"><b></b></b></b>
            </div>
        </td>
    </tr>
    <#if configPage.items?size gt 0>
    <tr class="listTr" name="9">
        <td width="10%">
            信道ID
        </td>
        <td width="10%">
            用户ID

        </td>
        <td width="10%">
            用户名

        </td>
        <td width="10%">
            密码

        </td>
        <td class="subgroup_p8" width="10%">
            主机

        </td>
        <td style=" padding-top:5px;" width="8%">
            端口
        </td>
        <td width="10% ">
            连接类型
        </td>

        <td style="text-align:left; padding-top:5px;" width="12%">
            ssl
        </td>

         <td style="text-align:left; padding-top:5px;" width="12%">
            auth
         </td>
        <td class="subgroup_p8" name="System" width="30%">
            &nbsp;&nbsp;&nbsp;操作
        </td>

    </tr>
    <#list configPage.items as config>
    <tr class="listTr" name="9">
        <td width="10%">
            <input type="checkbox" name='config_check' value="${config.id}" />
            ${config.id}
        </td>
        <td width="10%">
            ${config.uid}

        </td>
        <td width="10%">
            ${config.username}

        </td>
        <td width="10%">
            ${config.password}

        </td>
        <td class="subgroup_p8" width="10%">
            ${config.host}

        </td>
        <td style=" padding-top:5px;" width="8%">
            ${config.port}
        </td>
        <td width="10% ">
            ${config.conn}
        </td>

        <td style="text-align:left; padding-top:5px;" width="12%">
            ${config.ssl}
        </td>
        <td style="text-align:left; padding-top:5px;" width="12%">
            ${config.auth}
        </td>
        <td class="subgroup_p8" name="System" width="30%">
            <a href="/email/config.html?id=${config.id}">编辑</a>
        </td>
    </tr>
    </#list>
    <tr class="listTr" name="9">
        <td colspan="9">
            <@component.page configPage "/email/configList.html?page={page}" ""/>
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
    <#if pageInfo.items?size gt 0>
    <tr class="listTr" name="9">
        <td width="10%">
            组ID
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
    <#list pageInfo.items as configGroup>
    <tr class="listTr" name="9">
        <td width="10%">
            ${configGroup.id}
        </td>
        <td width="10%">
            ${configGroup.name}
        </td>
        <td class="u_p" width="30%">
            ${configGroup.configIds}
        </td>
        <td class="subgroup_p8" name="System" width="30%">
            <a href="/email/configGroup.html?id=${configGroup.id}">编辑</a> |
            <a href="javascript:addConfig(${configGroup.id});">添加信道到该组</a> |
            <a href="javascript:removeConfig(${configGroup.id});">移除信道</a>
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

</div>

<div class="clear"></div>

</div>

<script type="text/javascript">
    function addConfig(groupId){
        var config_ids = "";
        $("input[name='config_check']").each(function(){
            if ($(this).attr("checked")){
               config_ids += $(this).val()+",";
            }
        })
        if (config_ids == ""){
            alert("请选择要添加的信道");
            return;
        } else {
            config_ids.substring(0,config_ids.length-1);
        }
        $.ajax({
            type: 'POST',
            data:{configIds:config_ids,groupId:groupId},
            dataType:'json',
            url: '/email/addConfigGroup.html',
            success: function(res) {
                if (res.success) {
                    window.location.href="/email/configList.html?page=${page}";
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
    function removeConfig(groupId){
        var config_ids = "";
        $("input[name='config_check']").each(function(){
            if ($(this).attr("checked")){
               config_ids += $(this).val()+",";
            }
        })
        if (config_ids == ""){
            alert("请选择要移除的信道");
            return;
        } else {
            config_ids.substring(0,config_ids.length-1);
        }
        $.ajax({
            type: 'POST',
            data:{configIds:config_ids,groupId:groupId},
            dataType:'json',
            url: '/email/removeConfigGroup.html',
            success: function(res) {
                if (res.success) {
                    window.location.href="/email/configList.html?page=${page}";
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

</@layout.standard>