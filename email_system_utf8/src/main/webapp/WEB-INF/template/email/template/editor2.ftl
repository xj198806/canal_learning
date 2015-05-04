<#import "/include/admin_layout.ftl" as layout />
<@layout.standard "模板管理" 3>
<style type="text/css">
    .cke_editor_editor01 {

        margin-left: auto;
        margin-right: auto;
    }
</style>

<script type="text/javascript" src="/static/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
    function add_template(){
        var title = $("#t_title").val();
        var content= CKEDITOR.instances.editor01.getData()

        if ($.trim(title) == ""){
            alert("请输入模板名称");
            return;
        }
        if ($.trim(content) == ""){
            alert("请输入模板内容");
            return;
        }

        for ( instance in CKEDITOR.instances )
        CKEDITOR.instances[instance].updateElement();

        $("#tpl_form").submit();
    }
    $(document).ready(function(){
        <#if name?exists&& name==1>
        $("#name_check").attr("checked","checked");
        </#if>
    })
</script>

<div id="container">
    <div id="ctl00_ContentPlaceHolder1_uplEmail">

        <div class="send_body">
            <div style="margin: 25px 25px 0 25px;">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tbody><tr>
                        <td class="newnav1">
                            &nbsp;
                        </td>
                        <td class="newnav">
                            <span class="newnav_t">
                                <img align="absmiddle" src="/static/images/sub_002.gif">邮件模板-新建EMAIL</span> <span class="newnav_w1">

                        </td>
                        <td class="newnav2">
                            &nbsp;
                        </td>
                    </tr>
                    </tbody></table>
            </div>
        </div>
        <div class="clear"></div>
    <div>
    <br/>

    <form id="tpl_form" action="/email/addTemplate.html" method="post">
    <input type="hidden" value="${tid}" name="tid" />
    <table width="98%" border="0" cellspacing="5px" cellpadding="5px">
        <tbody>
        <tr>
            <td style="padding: 0">&nbsp;&nbsp;</td>
            <td style="padding: 0" class="back">
                <span style="color: #35639C; font-size: 14px;font-weight: bold;">模板名称：</span>
                <input type="text" value="<#if template?exists>${template.title}</#if>" style="width: 150px;" name="t_title" class="input_text" id="t_title" >
            </td>
        </tr>
        <tr>
            <td style="padding: 0">&nbsp;&nbsp;</td>
            <td style="padding: 0" class="back">
                <span style="color: #35639C; font-size: 14px;font-weight: bold;">是否加入姓名</span>
                <input type="checkbox" value="1" id="name_check" name="addName"/>
            </td>
        </tr>
    </tbody>
    </table>

    <br/>

    <textarea id="editor01" rows="30" cols="50" name="editor01"><#if template?exists>${template.content}</#if></textarea>
    <script type="text/javascript">CKEDITOR.replace('editor01',{allowedContent: true});</script>
    </form>
    <br/>
    <table width="98%" border="0" cellspacing="0" cellpadding="0">
        <tbody><tr>
            <td style="padding: 0">&nbsp;&nbsp;</td>
            <td style="padding: 0" class="back">
                <a id="ctl00_ContentPlaceHolder1_aBack" href="/email/templateList.html">
                    <img align="absmiddle" src="/static/images/left.gif">查看模板列表</a>
            </td>
            <td>
                <ul style="padding: 0px;" class="button">
                    <li>
                        <a href="javascript:add_template();" class="btn_next" id="ctl00_ContentPlaceHolder1_btnContinue">保存</a></li>
                </ul>
            </td>
        </tr>
    </tbody>
    </table>
    <div class="clear"></div>
</div>




</@layout.standard>