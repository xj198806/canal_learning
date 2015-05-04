<#import "/include/admin_layout.ftl" as layout />
<@layout.standard "通讯录管理" 2>

<script type="text/javascript">
    function btn_continue(){
        var rowSelect = "";
        $(".row_select").each(function(){
            if ($(this).val() != -1){
                if (rowSelect.indexOf($(this).val()) > -1) {
                    alert("选择的属性不能重复");
                    return;
                } else {
                    rowSelect = rowSelect + "," + $(this).val();
                }
            }
        })

        if (rowSelect == ""){
            alert("请选择列对应的属性");
            return;
        }
        if (rowSelect.indexOf("-email") == -1){
            alert("必须有一列对应到邮箱");
            return;
        }
        rowSelect = rowSelect.substring(1);
        window.location.href="/email/import.html?rowSelect="+rowSelect+"&fileName=${fileName}&groupId=${groupId}";
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

    <div class="edit_u">批量导入</div>

    <div class="send_body">
        <div style=" padding-bottom:0px;" class="dashblue_box3"> <b class="dashblue"> <b class="dashblue1"><b></b></b> <b class="dashblue2"><b></b></b> <b class="dashblue3"></b> <b class="dashblue4"></b> <b class="dashblue5"></b> </b>
            <div class="dashblue_content">
                <div style="padding:0pt;" class="dashlight_blue_box"> <b class="dashlight_blue"> <b class="dashlight_blue1"><b></b></b> <b class="dashlight_blue2"><b></b></b> <b class="dashlight_blue3"></b> <b class="dashlight_blue4"></b> <b class="dashlight_blue5"></b> </b>
                    <div class="dashlight_blue_content">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tbody><tr>
                                <td class="dash_td3">请选择对应列</td>
                                <td class="dash_td8"></td>
                            </tr>
                        </tbody></table>
                    </div>
                    <b class="dashlight_blue"> <b class="dashlight_blue5"><b></b></b> <b class="dashlight_blue4"><b></b></b> <b class="dashlight_blue3"></b> <b class="dashlight_blue2"></b> <b class="dashlight_blue1"></b><b style="background:#cdddfb; height:5px;"></b> </b> </div>
            </div>
            <div class="dashblue_content">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tbody><tr valign="top">
                        <td width="100%"><div style="padding:0pt;" class="dashwhite_box"> <b class="dashwhite"> <b class="dashwhite1"><b></b></b> <b class="dashwhite2"><b></b></b> <b class="dashwhite3"></b> <b class="dashwhite4"></b> <b class="dashwhite5"></b> </b>
                            <div class="dashwhite_content">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0" id="tblFilelds">
                                    <tbody><tr>
                                        <td width="50%" class="dash_none1">
                                        已上传文件的列：<font style="font-weight:normal; color:#666;">选择文件中的列对应到联系人的哪个属性。</font></td>
                                        <td width="50%" class="dash_none1">
                                        联系人的属性：<font style="font-weight:normal; color:#f00;"><span id="msg" style="color:Red;display:none; padding-left:27%; "></span> </font></td>
                                    </tr>
                                    <#if result?exists>
                                    <#list result as obj>
                                    <#if obj_index == 0>
                                    <#list obj as email>

                                    <tr <#if email?string == "">style="display:none"</#if>>
                                        <td width="50%" class="dash_none2 border">
                                            ${email_index+1}.
                                            ${email?string}
                                        </td>
                                        <td width="50%" style="padding: 5px;" class="border">
                                            <img align="absmiddle" style="margin-right: 5px;" src="/static/images/dot08.gif">
                                            <select title="items" class="row_select" name="ctl00$ContentPlaceHolder1$rptMapping$ctl00$ddlDBColumn">
                                                <option value="-1">跳过</option>
                                                <option value="${email_index}-email">邮箱地址</option>
                                                <option value="${email_index}-name">姓名</option>
                                                <!--option value="Company">公司名称</option>
                                                <option value="City">城市</option>
                                                <option value="Phone">电话</option>
                                                <option value="Reserved1">自定义一</option>
                                                <option value="Reserved2">自定义二</option>
                                                <option value="Reserved3">自定义三</option-->

                                            </select>
                                        </td>
                                    </tr>

                                    </#list>
                                    </#if>
                                    </#list>
                                    </#if>
                                </tbody></table>
                            </div>
                            <b class="dashwhite"> <b class="dashwhite5"><b></b></b> <b class="dashwhite4"><b></b></b> <b class="dashwhite3"></b> <b class="dashwhite2"></b> <b class="dashwhite1"></b> </b> </div>
                        </td>
                    </tr>
                </tbody></table>
            </div>
            <b class="dashblue"> <b class="dashblue5"></b> <b class="dashblue4"></b> <b class="dashblue3"></b> <b class="dashblue2"><b></b></b> <b class="dashblue1"><b></b></b> </b> </div>
    </div>

    <div class="send_body">
        <div style="padding-top:0px;" class="dashblue_box3">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tbody><tr>
                    <td width="50%">
                        <div class="dashblue_box2"> <b class="dashblue"> <b class="dashblue1"><b></b></b> <b class="dashblue2"><b></b></b> <b class="dashblue3"></b> <b class="dashblue4"></b> <b class="dashblue5"></b> </b>
                            <div class="dashblue_content">
                                <div style="padding:0pt;" class="dashlight_blue_box"> <b class="dashlight_blue"> <b class="dashlight_blue1"><b></b></b> <b class="dashlight_blue2"><b></b></b> <b class="dashlight_blue3"></b> <b class="dashlight_blue4"></b> <b class="dashlight_blue5"></b> </b>
                                    <div class="dashlight_blue_content">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tbody><tr>
                                                <td class="dash_td9">是否合并重复项？</td>
                                            </tr>
                                        </tbody></table>
                                    </div>
                                    <b class="dashlight_blue"> <b class="dashlight_blue5"><b></b></b> <b class="dashlight_blue4"><b></b></b> <b class="dashlight_blue3"></b> <b class="dashlight_blue2"></b> <b class="dashlight_blue1"></b><b style="background:#cdddfb; height:5px;"></b> </b> </div>
                            </div>
                            <div class="dashblue_content">
                                <div style="padding:0pt;" class="dashwhite_box"> <b class="dashwhite"> <b class="dashwhite1"><b></b></b> <b class="dashwhite2"><b></b></b> <b class="dashwhite3"></b> <b class="dashwhite4"></b> <b class="dashwhite5"></b> </b>
                                    <div class="dashwhite_content">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tbody><tr>
                                                <td class="yesno">
                                                <input type="radio" checked="checked" id="ctl00_ContentPlaceHolder1_rdoMerge" name="ctl00$ContentPlaceHolder1$import[skip_duplicates]" value="false">是 <font style="color:#999;">（与已存在的项目合并）</font><br>
                                                <input type="radio" id="ctl00_ContentPlaceHolder1_rdoNotMerge" name="ctl00$ContentPlaceHolder1$import[skip_duplicates]" value="true">否 <font style="color:#999;">（跳过已存在的项）</font></td>
                                            </tr>
                                        </tbody></table>
                                    </div>
                                    <b class="dashwhite"> <b class="dashwhite5"><b></b></b> <b class="dashwhite4"><b></b></b> <b class="dashwhite3"></b> <b class="dashwhite2"></b> <b class="dashwhite1"></b> </b> </div>
                            </div>
                            <b class="dashblue"> <b class="dashblue5"></b> <b class="dashblue4"></b> <b class="dashblue3"></b> <b class="dashblue2"><b></b></b> <b class="dashblue1"><b></b></b> </b> </div>
                    </td>
                    <td width="50%" style=" padding-left:20px;">
                        <div class="dashblue_box2"> <b class="dashblue"> <b class="dashblue1"><b></b></b> <b class="dashblue2"><b></b></b> <b class="dashblue3"></b> <b class="dashblue4"></b> <b class="dashblue5"></b> </b>
                            <div class="dashblue_content">
                                <div style="padding:0pt;" class="dashlight_blue_box"> <b class="dashlight_blue"> <b class="dashlight_blue1"><b></b></b> <b class="dashlight_blue2"><b></b></b> <b class="dashlight_blue3"></b> <b class="dashlight_blue4"></b> <b class="dashlight_blue5"></b> </b>
                                    <div class="dashlight_blue_content">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tbody><tr>
                                                <td class="dash_td9">是否保留第一行？</td>
                                            </tr>
                                        </tbody></table>
                                    </div>
                                    <b class="dashlight_blue"> <b class="dashlight_blue5"><b></b></b> <b class="dashlight_blue4"><b></b></b> <b class="dashlight_blue3"></b> <b class="dashlight_blue2"></b> <b class="dashlight_blue1"></b><b style="background:#cdddfb; height:5px;"></b> </b> </div>
                            </div>
                            <div class="dashblue_content">
                                <div style="padding:0pt;" class="dashwhite_box"> <b class="dashwhite"> <b class="dashwhite1"><b></b></b> <b class="dashwhite2"><b></b></b> <b class="dashwhite3"></b> <b class="dashwhite4"></b> <b class="dashwhite5"></b> </b>
                                    <div class="dashwhite_content">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tbody><tr>
                                                <td class="yesno">
                                                    <input type="radio" checked="checked" id="ctl00_ContentPlaceHolder1_rdoSaveFirstRow" name="ctl00$ContentPlaceHolder1$import[ignore_first_row]" value="false">是 <font style="color: #999;">（导入第一行，它也是数据行）</font><br>
                                                    <input type="radio" id="ctl00_ContentPlaceHolder1_rdoNotSaveFirstRow" name="ctl00$ContentPlaceHolder1$import[ignore_first_row]" value="true">否
                                                    <font style="color: #999;">（忽略第一行，它只是标题）</font>
                                                </td>
                                            </tr>

                                        </tbody></table>
                                    </div>
                                    <b class="dashwhite"> <b class="dashwhite5"><b></b></b> <b class="dashwhite4"><b></b></b> <b class="dashwhite3"></b> <b class="dashwhite2"></b> <b class="dashwhite1"></b> </b> </div>
                            </div>
                            <b class="dashblue"> <b class="dashblue5"></b> <b class="dashblue4"></b> <b class="dashblue3"></b> <b class="dashblue2"><b></b></b> <b class="dashblue1"><b></b></b> </b> </div></td>
                </tr>
            </tbody></table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tbody><tr>
                    <td style="padding: 0; width:50%" class="back">
                        <a id="ctl00_ContentPlaceHolder1_aBack" href="/email/addList.html?groupId=${groupId}">
                            <img align="absmiddle" src="/static/images/left.gif">返回上一步</a>
                    </td>

                    <td>
                        <ul style="padding: 0px;" class="button">
                            <li><a onclick="btn_continue()" id="btn_next" href="#">下一步</a></li></ul>
                            <input type="button" style=" display:none" id="ctl00_ContentPlaceHolder1_btnContinue" name="ctl00$ContentPlaceHolder1$btnContinue" onclick="__doPostBack('ctl00$ContentPlaceHolder1$btnContinue','')">
                           <!-- 这个input标签没什么意义，只是借以处理上个a标签的事件 -->

                    </td>


                </tr>
            </tbody></table>
        </div>
    </div>

    <div class="clear">
    </div>
</div>
</@layout.standard>