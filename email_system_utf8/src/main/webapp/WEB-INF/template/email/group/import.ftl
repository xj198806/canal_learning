<#import "/include/admin_layout.ftl" as layout />
<@layout.standard "通讯录管理" 2>

<script type="text/javascript">
    function back(){

        window.location.href="/email/addConfig.html?fileName="+encodeURIComponent("${fileName}")+"&groupId=${group.id}";
    }

    function btn_continue(){
        var ckOpt=document.getElementById("cbxOpt").checked;
        var ckNotBuy=document.getElementById("cbxNotBuy").checked;
        var cbxNotSerched=document.getElementById("cbxNotSearched").checked;
        if(!(ckOpt&&ckNotBuy&&cbxNotSerched))
        {
            alert("你必须同意许可协议！");
            return false;
        }
        window.location.href="/email/importProcess.html?rowSelect=${rowSelect}&fileName="+encodeURIComponent("${fileName}")+"&groupId=${group.id}";
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
        <li><a id="nav_sub" href="/email/groupList.html">联系组</a></li>
    </ul>
</div>

    <div class="edit_u">批量导入</div>

    <div class="send_body">
        <div style="padding-top:0px;" class="dashblue_box4">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tbody><tr>
                    <td>
                        <div class="dashblue_box2"> <b class="dashblue"> <b class="dashblue1"><b></b></b> <b class="dashblue2"><b></b></b> <b class="dashblue3"></b> <b class="dashblue4"></b> <b class="dashblue5"></b> </b>
                            <div class="dashblue_content">
                                <div style="padding:0pt;" class="dashlight_blue_box"> <b class="dashlight_blue"> <b class="dashlight_blue1"><b></b></b> <b class="dashlight_blue2"><b></b></b> <b class="dashlight_blue3"></b> <b class="dashlight_blue4"></b> <b class="dashlight_blue5"></b> </b>
                                    <div class="dashlight_blue_content">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tbody><tr>
                                                <td class="dash_td9">
                                                    您选择导入的文件是：<span id="ctl00_ContentPlaceHolder1_lblSourceFile">${fileName}</span>
                                                </td>
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
                                                <td class="dash_td9 border">文件将导入到组：</td>
                                            </tr>


                                                <tr>
                                                <td style="padding:5px;"><img align="absmiddle" style="margin-right:5px;" src="/static/images/zu.gif">
                                                    &nbsp;<font style="color:#4e4e4e; font-size:14px;">${group.name}</font></td>
                                                </tr>

                                        </tbody></table>
                                    </div>
                                    <b class="dashwhite"> <b class="dashwhite5"><b></b></b> <b class="dashwhite4"><b></b></b> <b class="dashwhite3"></b> <b class="dashwhite2"></b> <b class="dashwhite1"></b> </b> </div>
                            </div>
                            <b class="dashblue"> <b class="dashblue5"></b> <b class="dashblue4"></b> <b class="dashblue3"></b> <b class="dashblue2"><b></b></b> <b class="dashblue1"><b></b></b> </b> </div>
                    </td>
                </tr>
            </tbody></table>
        </div>
    </div>

    <div class="send_body">
        <div style="padding-top:0px;" class="dashblue_box4">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tbody><tr>
                    <td>
                        <div class="dashblue_box2"> <b class="dashblue"> <b class="dashblue1"><b></b></b> <b class="dashblue2"><b></b></b> <b class="dashblue3"></b> <b class="dashblue4"></b> <b class="dashblue5"></b> </b>
                            <div class="dashblue_content">
                                <div style="padding:0pt;" class="dashlight_blue_box"> <b class="dashlight_blue"> <b class="dashlight_blue1"><b></b></b> <b class="dashlight_blue2"><b></b></b> <b class="dashlight_blue3"></b> <b class="dashlight_blue4"></b> <b class="dashlight_blue5"></b> </b>
                                    <div class="dashlight_blue_content">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tbody><tr>
                                                <td class="dash_td9">许可协议</td>
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
                                                <td class="dash_td9 border">你必须保证文件中的数据：</td>
                                            </tr>
                                            <tr>
                                                <td style="padding:5px;">
                                                <input type="checkbox" value="checkbox" id="cbxOpt" name="checkbox">
                                                <font style="color:#4e4e4e;">100% 许可 （用户可以自由退订）</font></td>
                                            </tr>
                                            <tr>
                                                <td style="padding:5px;">
                                                <input type="checkbox" value="checkbox" id="cbxNotBuy" name="checkbox2">
                                                <font style="color:#4e4e4e;">不是购买，交换来的</font></td>
                                            </tr>
                                            <tr>
                                                <td style="padding:5px;"><input type="checkbox" value="checkbox" id="cbxNotSearched" name="checkbox3">
                                                <font style="color:#4e4e4e;">不是从网站搜集的</font></td>
                                            </tr>
                                        </tbody></table>
                                    </div>
                                    <b class="dashwhite"> <b class="dashwhite5"><b></b></b> <b class="dashwhite4"><b></b></b> <b class="dashwhite3"></b> <b class="dashwhite2"></b> <b class="dashwhite1"></b> </b> </div>
                            </div>
                            <b class="dashblue"> <b class="dashblue5"></b> <b class="dashblue4"></b> <b class="dashblue3"></b> <b class="dashblue2"><b></b></b> <b class="dashblue1"><b></b></b> </b> </div>
                    </td>
                </tr>
            </tbody></table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tbody><tr>
                    <td style="padding: 0" class="back">
                        <a id="ctl00_ContentPlaceHolder1_aPrevious" href="javascript:back();">
                            <img align="absmiddle" src="/static/images/left.gif">返回上一步</a>
                    </td>
                    <td>
                        <ul style="padding: 0px;" class="button">
                            <li><a onclick="btn_continue()" id="btn_next">下一步</a></li></ul>
                            <input type="button" style=" display:none; width:1; height:1" id="ctl00_ContentPlaceHolder1_btnNext" name="ctl00$ContentPlaceHolder1$btnNext" onclick="__doPostBack('ctl00$ContentPlaceHolder1$btnNext','')">
                    </td>
                </tr>
            </tbody></table>
        </div>
    </div>

    <div class="clear">
    </div>
</div>
</@layout.standard>