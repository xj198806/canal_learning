<#import "/include/admin_layout.ftl" as layout />
<@layout.standard "通讯录管理" 2>

<script type="text/javascript">
    function SelectMode(mode)
    {
        var uploadDiv1=document.getElementById("uploadDiv1");
        var uploadDiv2=document.getElementById("uploadDiv2");
        var uploadDiv3=document.getElementById("uploadDiv3");
        var addOneDiv=document.getElementById("addOneDiv");

        if(mode.toUpperCase()=="IMPORT")
        {
            uploadDiv1.style.display="block";
            uploadDiv2.style.display="block";
            uploadDiv3.style.display="block";
            addOneDiv.style.display="none";
        }
        else
        {
            uploadDiv1.style.display="none";
            uploadDiv2.style.display="none";
            uploadDiv3.style.display="none";
            addOneDiv.style.display="block";
        }

    }

    function upload(){
        var fileName = $("#file_upload").val();
        if (fileName == ""){
            alert("请选择文件");
            return;
        }
        if (check(fileName)){
            $("#divMsg").show();
            $(".button").hide();
            $('#upload_form').submit();
        } else{
            alert("文件格式不正确，系统支持Microsoft excel 2003，2007 (xls/xlsx)和csv (Comma Seperated Values)文件");
        }

    }

    function check(name){
        var f_extends = ".xls,.xlsx,.csv";
        var extend = name.substring(name.lastIndexOf('.')).toLowerCase();
        if (f_extends.indexOf(extend)>-1)
            return true;
        else
            return false;
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

    <div class="send_body1">
        <div class="edit_u">添加联系人</div>
        <div class="sub_tan_box"> <b class="sub_tan"> <b class="sub_tan1"><b></b></b> <b class="sub_tan2"><b></b></b> <b class="sub_tan3"></b> <b class="sub_tan4"></b> <b class="sub_tan5"></b> </b>
            <div class="sub_tan_content">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">

                    <tbody><tr>
                        <td class="sub_tan12"><input checked="checked" type="radio" onclick="SelectMode('Import')" id="ctl00_ContentPlaceHolder1_rdoImport" name="ctl00$ContentPlaceHolder1$radiobutton" value="rdoImport"> 从文件中导入</td>
                    </tr>
                    <tr>
                        <td class="sub_tan14">
                        <form id="upload_form" action="/email/uploadFile.html" method="POST" enctype="multipart/form-data">
                            <div id="uploadDiv1>
                                <font style="margin-left: 0px; color: Black; width: auto">文件：</font>
                                <input type="hidden" name="groupId" value="${groupId}" />
                                <input type="file" name="myFile" style="width:308px; background-color:#fff;" class="input_text" size="40" id="file_upload">
                                </div>
                        </td>
                        </form>
                    </tr>
                    <tr>
                        <td class="sub_tan15">&nbsp;<div id="uploadDiv2">系统支持Microsoft excel 2003，2007 (xls/xlsx)和csv (Comma Seperated Values)文件。
                                                                         文件最大支持20M， 每次导入数量不超过200,000。 </div></td>
                    </tr>
                    <tr>
                        <td class="sub_tan14">
                            <div id="uploadDiv3" style="display: none">
                                分隔符：
                                <select style="width: 50px; border-color: #7f9db9;" class="sub_xuanze" id="ctl00_ContentPlaceHolder1_ddlSpliter" name="ctl00$ContentPlaceHolder1$ddlSpliter">
                                <option value="\t">Tab</option>
                                <option value=",">逗号</option>
                                <option value=";">分号</option>

                            </select>
                            </div>
                        </td>
                    </tr>


                    <!--
                    <tr>
                        <td class="sub_tan12"><input type="radio" onclick="SelectMode('Copy')" id="ctl00_ContentPlaceHolder1_rdlCopy" name="ctl00$ContentPlaceHolder1$radiobutton" value="rdlCopy"> 手动批量导入 &nbsp;<span class="sub_tan17">您可手动复制或录入多个Email导入</span></td>
                    </tr>
                    <tr>
                        <td class="sub_tan14">
                        </td>
                    </tr>
                    <tr>
                        <td class="sub_tan15">&nbsp;</td>
                    </tr>



                    <tr>
                        <td class="sub_tan13"><input type="radio" onclick="SelectMode('add')" id="ctl00_ContentPlaceHolder1_rdlAdd" name="ctl00$ContentPlaceHolder1$radiobutton" value="rdlAdd"> 手动单个添加 <span class="sub_tan17">您可以用手动一次添加一个联系人</span></td>
                    </tr>
                    <tr>
                        <td style="padding: 2px 0px;">
                            <div style="display: none" id="addOneDiv">
                            </div>
                        </td>
                    </tr>

                    <tr><td class="sub_tan14">&nbsp;</td></tr>
                    <tr><td class="sub_tan15">&nbsp;</td></tr>
                    <tr>
                        <td class="sub_tan16"><input type="radio" onclick="SelectMode('copy')" id="ctl00_ContentPlaceHolder1_rdlCopyExist" name="ctl00$ContentPlaceHolder1$radiobutton" value="rdlCopyExist"> 从已有组复制<span class="sub_tan17"> &nbsp;您可以将已有组的联系人全部复制到新组</span></td>
                    </tr>
                    -->
                    <tr><td class="sub_tan14">&nbsp;</td></tr>
                    <tr><td class="sub_tan15">&nbsp;</td></tr>
                </tbody></table>
            </div>
            <b class="sub_tan"> <b class="sub_tan5"></b> <b class="sub_tan4"></b> <b class="sub_tan3"></b> <b class="sub_tan2"><b></b></b> <b class="sub_tan11"><b></b></b> </b> </div>
        <div><ul class="button"><li><a onclick="javascript:upload();" id="btn_next" href="#">下一步</a></li></ul></div>
        <div id="divMsg" style="display:none; padding-left:42px"><img alt="Indicator" src="/static/images/indicator.gif">正在上传中,上传时间取决于文件的大小</div>
        <input type="button" style=" width:0px; height:0px; visibility:hidden;" id="ctl00_ContentPlaceHolder1_hiddenBt" name="ctl00$ContentPlaceHolder1$hiddenBt" onclick="__doPostBack('ctl00$ContentPlaceHolder1$hiddenBt','')">
    </div>

    <div class="clear">
    </div>
</div>
</@layout.standard>