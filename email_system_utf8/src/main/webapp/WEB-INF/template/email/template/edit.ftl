<#import "/include/admin_layout.ftl" as layout />
<@layout.standard "模板管理" 3>
<script type="text/javascript">
    //<![CDATA[
    function WebForm_OnSubmit() {
    CKEditor_TextBoxEncode('ctl00_ContentPlaceHolder1_divCkeditorBody', 0);
    return true;
    }
    //]]>
</script>

<script src="/static/js/jquery-ui-1.7.2.custom.min.js" type="text/javascript" language="javascript"></script>
<script type="text/javascript" src="/static/ckeditor/star-config.js"></script>
<script src="/static/ckeditor/ckeditor.js" type="text/javascript" language="javascript"></script>
<script src="/static/ckeditor/ckfinder.js" type="text/javascript" language="javascript"></script>
<script type="text/javascript" src="/static/js/common.js"></script>
<script type="text/javascript" src="/static/js/track.js"></script>


<script type="text/javascript">
$(function(){
var editor= CKEDITOR.replace('ctl00_ContentPlaceHolder1_divCkeditorBody',{height:500});

var content=editor.getData().replace(/[\n\r]/g,"");
if(content.match(StarConfig.UnsubscribePtn)!=null)
{
$("#cbxUnsubscribe").attr("checked","true");
}
if(content.match(StarConfig.UnsubscribePtnEn)!=null)
{
$("#cbxUnsubscribe").attr("checked","true");
}
if(content.match(StarConfig.UrlSharePtn)!=null)
{
$("#cbxShare").attr("checked","true");
}
if(content.match(StarConfig.ClickPtn)!=null)
{
$("#cbxClick").attr("checked","true");
}

(function SetTrackStatus()
{
var div=document.createElement("div");
div.innerHTML=content;
var linkList=div.getElementsByTagName("a");
var areaList=div.getElementsByTagName("area");
if(linkList.length+areaList.length==0)
return;

var href;
$("#cbxTrack").attr("checked",true);
for(var i=0;i<linkList.length;i++)
{
href=decodeURI(linkList[i].href);
if(href.indexOf(StarConfig.UrlMappedSignal)>-1 && linkList[i].host!=StarConfig.UrlMapTo )
continue;

if( linkList[i].host=="" || href.indexOf(StarConfig.UrlMappedSignal)==-1)
{
$("#cbxTrack").attr("checked",false);
return;
}
}

for(var i=0;i<areaList.length;i++)
{
href=decodeURI(areaList[i].href);
if(href.indexOf(StarConfig.UrlMappedSignal)>-1 && areaList[i].host!=StarConfig.UrlMapTo )
continue;

if(areaList[i].host=="" || href.indexOf(StarConfig.UrlMappedSignal)==-1)
{
$("#cbxTrack").attr("checked",false);
return;
}
}
})();

var fromEmail=document.getElementById("ctl00_ContentPlaceHolder1_hdnFromEmail").value;
StarConfig.UrlClick=StarConfig.UrlClick.replace(/{{{FromEmail}}}/ig,fromEmail);
StarConfig.UrlClickEn=StarConfig.UrlClickEn.replace(/{{{FromEmail}}}/ig,fromEmail);
StarConfig.UrlShareAndClick=StarConfig.UrlShareAndClick.replace(/{{{FromEmail}}}/ig,fromEmail);
StarConfig.UrlShareAndClickEn=StarConfig.UrlShareAndClickEn.replace(/{{{FromEmail}}}/ig,fromEmail);

var LastEditStatus=true;
$("#trTypeChoose a").live("click", function(){
var $_this=$(this);
LastEditStatus=$_this.attr("id")=="aHtml";

//alert(LastEditStatus);
var textOrHtml=LastEditStatus?"divHtmlBody":"divTextBody";
if($("#"+textOrHtml).css("display")!="none")
return;

if(LastEditStatus)
isHtml(editor);
else
isText("false",editor);
})

$("#insertTag").click(
function()
{
var tag=$("#ctl00_ContentPlaceHolder1_ddlTags").val();
if(LastEditStatus)
{
var oEditer=editor;
var body=oEditer.getData();
if(oEditer.mode!="wysiwyg") //源代码模式
alert("此模式下不可以进行该操作,请切换模式！");
else//编辑器模式
oEditer.insertHtml(tag);
}
else
$("#ctl00_ContentPlaceHolder1_txtBody").insertAtCaret(tag);
} );

$.fn.extend({
insertAtCaret: function(myValue){
var $t=$(this)[0];
if (document.selection) {
this.focus();
sel = document.selection.createRange();
sel.text = myValue;
this.focus();
}
else if ($t.selectionStart || $t.selectionStart == '0') {
var startPos = $t.selectionStart;
var endPos = $t.selectionEnd;
var scrollTop = $t.scrollTop;
$t.value = $t.value.substring(0, startPos) + myValue + $t.value.substring(endPos, $t.value.length);
this.focus();
$t.selectionStart = startPos + myValue.length;
$t.selectionEnd = startPos + myValue.length;
$t.scrollTop = scrollTop;
}
else {
this.value += myValue;
this.focus();
}
}
})

$("#cbxShare,#cbxClick").click(
function()
{
var oEditer=editor;
var body=oEditer.getData().replace(/[\n\r]/g,"");
var msgShare=StarConfig.UrlShare;
var msgClick=StarConfig.UrlClick;
var msgSACAll=StarConfig.UrlShareAndClick;
var click=$("#cbxClick").attr("checked");
var shore=$("#cbxShare").attr("checked");
var index=body.indexOf("</table>");
if($("#rendering").html()=="Chinese")
{
msgShare=StarConfig.UrlShareEn;
msgClick=StarConfig.UrlClickEn;
msgSACAll=StarConfig.UrlShareAndClickEn;
}
if(click&&shore)
{
body=body.replace(StarConfig.ClickPtn,'').replace(StarConfig.UrlSharePtn,'');
var indexV=body.toLowerCase().indexOf("<body");
if(indexV>0)
{
var afterIndexV=body.substring(indexV+1).indexOf(">")+indexV+2;
body=body.substring(0,afterIndexV)+msgSACAll+body.substring(afterIndexV);
}
else
body=msgSACAll+body;

oEditer.setData(body);
}
else if(click||shore)
{
body=body.replace(StarConfig.ClickPtn,'').replace(StarConfig.UrlSharePtn,'');
if(click)
{
var indexV=body.toLowerCase().indexOf("<body");
if(indexV>0)
{
var afterIndexV=body.substring(indexV+1).indexOf(">")+indexV+2;
body=body.substring(0,afterIndexV)+msgClick+body.substring(afterIndexV);
}
else
body=msgClick+body;

}
else
{
var indexV=body.toLowerCase().indexOf("<body");
if(indexV>0)
{
var afterIndexV=body.substring(indexV+1).indexOf(">")+indexV+2;
body=body.substring(0,afterIndexV)+msgShare+body.substring(afterIndexV);
}
else
body=msgShare+body;
}
oEditer.setData(body);
}
else
oEditer.setData(body.replace(StarConfig.ClickPtn,'').replace(StarConfig.UrlSharePtn,''));
} );

$("#cbxUnsubscribe").click(
function()
{
var oEditer=editor;
var body=oEditer.getData();
if(this.checked)
{
var msg="";
if($("#ctl00_ContentPlaceHolder1_hidUnsubscribe").val()!="0")
{
//                if($("#ctl00_ContentPlaceHolder1_hidUnsubscribe").val()=="849")
//                {
var method="StarConfig.UnsubscribeTD"+$("#ctl00_ContentPlaceHolder1_hidUnsubscribe").val();
msg=eval(method);


// msg=StarConfig.UnsubscribeTD1;
if($("#rendering").html()=="Chinese")
{
var methodEn="StarConfig.UnsubscribeEnTD"+$("#ctl00_ContentPlaceHolder1_hidUnsubscribe").val();
// msg=StarConfig.UnsubscribeEnTD1;
msg=eval(methodEn);
}
oEditer.setData(body+msg);
//  }
}
else
{
msg=StarConfig.Unsubscribe;
if($("#rendering").html()=="Chinese")
msg=StarConfig.UnsubscribeEn;
oEditer.setData(body+msg);
}

}
else
{
if($("#rendering").html()=="Chinese")
{
oEditer.setData(body.replace(/[\n\r]/g,"").replace(StarConfig.UnsubscribePtnEn,''));
}
else
{
oEditer.setData(body.replace(/[\n\r]/g,"").replace(StarConfig.UnsubscribePtn,''));
}
}
} );

$("#rendering").click( function(){
var CE=$(this).html();
setLanguage(CE);
var body;
var oEditer=editor;
var oText=$("#ctl00_ContentPlaceHolder1_txtBody");
if(LastEditStatus)
body=oEditer.getData().replace(/[\r\n]/g,"");
else
body=oText.value();

var newBody=Translate(body,CE);
if(LastEditStatus)
oEditer.setData(newBody);
else
oText.value=newBody;
});

$("#ctl00_ContentPlaceHolder1_btnContinue").click(
function()
{
if(!$("#ctl00_ContentPlaceHolder1_cbxNotSpam").attr("checked"))
{
$("#ctl00_ContentPlaceHolder1_cbxNotSpam").focus();
alert("你必须保证你的邮件不是垃圾邮件!");
var options = {direction:"left",distance:120};
$("#tblSpam").effect("bounce",options,300,null);
return false ;
}
//        $("#ctl00_ContentPlaceHolder1_HidCkeditorBody").val(editor.getData());

var oEditer=editor;
var body=oEditer.getData();
phonecheck(body);

return true;
});


$("#aShowSavePanel").click(
function()
{
var offset=$(this).offset();
$("#divSavePanel").css("top",offset.top+10);
$("#divSavePanel").css("left",offset.left-300);
$("#divSavePanel").toggle();
if($("#divSavePanel").css("display")=="block")
$("#ctl00_ContentPlaceHolder1_txtEmailName").focus();
});

$("#aClosePanel").click(
function() {
$("#divSavePanel").hide();
});



$("#ctl00_ContentPlaceHolder1_btnSave1").click(
function ()
{
if(!$("#ctl00_ContentPlaceHolder1_cbxNotSpam").attr("checked"))
{
$("#cbxNotSpam").focus();
alert("你必须保证你的邮件不是垃圾邮件!");
window.scrollTo(0,400);
var options = {direction:"left",distance:120};
$("#tblSpam").effect("bounce",options,300,null);
return false;
}



if($("#ctl00_ContentPlaceHolder1_txtEmailName").val()=="")
{
$("#spanMsg").attr("innerHTML","请输入这封邮件的名字");
return false;
}

var oEditer=editor;
var oTxt=$("#ctl00_ContentPlaceHolder1_txtBody");
var body,emailMode;

//alert(LastEditStatus);
if(LastEditStatus)
{
body=encodeURIComponent(oEditer.getData());
//body=encodeURIComponent($.base64.encode(oEditer.getData()));
emailMode="html";
}
else
{
body=encodeURIComponent(oTxt.val());
//alert(body);
emailMode="text";
}

phonecheck(body);

var groupIdArr=[];
$("#ctl00_ContentPlaceHolder1_groupTable input").each(
function()
{
if(this.checked)
{
var groupId=this.id.substr(this.id.indexOf('ck')+2);
groupIdArr.push(groupId);
}
}
);

var groupIds=","+groupIdArr.join(",");
$("#ctl00_ContentPlaceHolder1_hidGroupId").val(groupIds);
var emailId=$("#ctl00_ContentPlaceHolder1_hdnEmailId").attr("value");
var values="Name="+$("#ctl00_ContentPlaceHolder1_txtEmailName").val()+"&Label="+$("#ctl00_ContentPlaceHolder1_txtLabel").val()+"&IsEmailHtml="+LastEditStatus+"&Body="+body+"&EmailId="+emailId+"&groupIds="+groupIds;
$("#ctl00_ContentPlaceHolder1_hidLastEditStatus").val(LastEditStatus);
// $.post("NewHtml.aspx",values,SaveEmailCallback);
$("#save_dialog").hide();
$("#img_indicator").attr("src",$("#img_indicator").attr("src")+"?"+Math.random());
$("#save_indicator").show();

function SaveEmailCallback(text)
{
var commaIndex=text.indexOf(',');
var emailId=text.substring(0,commaIndex);
var body=text.substring(commaIndex+1);
var now=new Date();
var msg=now.toLocaleString().split(' ')[1]+" 保存成功111";

$("#spanResult").attr("innerHTML",msg);
$("#divSavePanel").hide();
$("#ctl00_ContentPlaceHolder1_hdnEmailId").val(emailId);
$("#save_dialog").show();
$("#save_indicator").hide();

if(LastEditStatus)
oEditer.setData(body);
else
oTxt.val(body);
}
});

$("#aPreview").click(
function()
{
CKEDITOR.tools.callFunction(8, this);
});

$("#linkGetFromUrl").click(c);
$("#linkCancelGet").click(c);
var c=function()
{
$("#divGetPanel").toggle();
$("#linkGetFromUrl").toggle();
}

$("#aHideUploadPanel").click(d);
$("#aShowUploadPanel").click(d);
var d=function()
{
$("#divUploadPanel").toggle();
$("#aShowUploadPanel").toggle();
}

$("#ctl00_ContentPlaceHolder1_btnUpload").click(
function()
{
$("#upload_controls").hide();
$("#upload_loading").show();
});

$("#ctl00_ContentPlaceHolder1_btnGet").click(
function()
{
$("#get_controls").hide();
$("#get_loading").show();
});

$("#ctl00_ContentPlaceHolder1_addFile").click(
function()
{
var filetotal=$("#ctl00_ContentPlaceHolder1_fileNumTotal").html();
var TabFileNum=$("#TabFileNum tr").length;
var fileNoewTotal=$("#ctl00_ContentPlaceHolder1_lblNowfile").html();
if(filetotal<=(parseInt(TabFileNum)+parseInt(fileNoewTotal)))
{
alert("最多上传附件"+filetotal+"个！");
return false;
}
$('<input type="file" name="file" onchange="change()"/>').appendTo("#files");
$("#ctl00_ContentPlaceHolder1_addFile").css("display","none");
})

$(".delete").live("click",
function()
{
var $valueS=$(this).html();
var num=$("#ctl00_ContentPlaceHolder1_lblNowfile").html();
if($valueS=="删除")
{
$(this).prev().prev().attr("disabled","disabled");
$("#ctl00_ContentPlaceHolder1_lblNowfile").html(parseInt(num)-1);
$(this).prev().attr("src","/static/images/attach3.gif");
$(this).html("恢复");
}
else
{
var filetotal=$("#ctl00_ContentPlaceHolder1_fileNumTotal").html();
var fileNoewTotal=$("#ctl00_ContentPlaceHolder1_lblNowfile").html();
var TabFileNum=$("#TabFileNum tr").length;
if(filetotal<=(TabFileNum+ parseInt(fileNoewTotal)))
{
alert("最多上传附件"+filetotal+"个！");
return false;
}
$("#ctl00_ContentPlaceHolder1_lblNowfile").html(parseInt(num)+1);
$(this).prev().prev().attr("disabled","");
$(this).prev().attr("src","/static/images/attach2.gif");
$(this).html("删除");
}
})

$("#fileUpDisplay").click(
function(){
if($("#footer .hidDisable").val().indexOf(",8,")>=0)
{
alert('您目前没有权限使用此功能,请联系管理员开通！');
return false;
}
if( $("#ctl00_ContentPlaceHolder1_fileContent").css("display")=="none")
{
$("#ctl00_ContentPlaceHolder1_fileContent").show();
$("#tishi").html("(附件个数不得超过"+ $("#ctl00_ContentPlaceHolder1_fileNumTotal").html()+"个,大小不得超过"+$("#ctl00_ContentPlaceHolder1_UpFileTotalSize").html()+"KB),<span style='color:Red'>带附件邮件将会双倍扣点！</span>");
}
else
{
$("#ctl00_ContentPlaceHolder1_fileContent").hide();
$("#tishi").html("");
}
})

$("#aCheckAllGroup").click(
function()
{
$("#ctl00_ContentPlaceHolder1_groupTable input").each(
function()
{
this.checked=true;
}
);
}
);

$("#aCheckNoGroup").click(
function()
{
$("#ctl00_ContentPlaceHolder1_groupTable input").each(
function()
{
this.checked=false;
}
);
}
);

$("#cbxTrack").click(
function()
{
TrackAll();

function TrackAll()
{
StopLoadImage();
//        showMsgDiv('coverDiv','msgDiv');
window.setTimeout(AnimateTrack,200);
}

function StopLoadImage()
{
//cancel image downloads
if(window.stop != undefined)
{
window.stop();
}
else if(document.execCommand != undefined)
{
document.execCommand("Stop", false);
}
}

function AnimateTrack()
{
try
{
var oEditor=editor;
var content=oEditor.getData().replace(/[\r\n]/g,"");
if(content==null||content=="")
{
document.getElementById("cbxTrack").checked=false;
closeMsgDiv('coverDiv','msgDiv');
alert("请先填入邮件内容!");
return;
}
var trackedContent=Track(content);
oEditor.setData(trackedContent);
//            closeMsgDiv('coverDiv','msgDiv');
}
catch(e)
{
//            closeMsgDiv('coverDiv','msgDiv');
}
}
});


})

function change(){
var $route=$("#files :file:last").val();
var fileName  =$("#files :file:last")[0];
fileName=fileName.value.substring(fileName.value.lastIndexOf("\\")+1);
var $divfiles= $("#files :file");
if($divfiles.length>1)
{
for(var i=1;i<$divfiles.length;i++)
{
if($divfiles[i-1].getAttribute("title")==$route)
{
$("#files :file:last").val("");
alert("不能重复上传同一文件,请重新选择！");
return false;
}
}
}
if($("#ctl00_ContentPlaceHolder1_overfile").html().length>2)
{
if($("#ctl00_ContentPlaceHolder1_overfile").html().indexOf(fileName) > 0)
{
alert("不能重复上传同一文件,请重新选择！");
$("#files :file:last").val("");
return false;
}
}

$("#files").append("<img src='/static/images/attach2.gif' />"+fileName+" <a href='javaScript:void(0)' class='delete'>删除</a><br />");
$("#files :file:last").addClass("none");
$("#files :file:last").attr("title",$route);
$("#ctl00_ContentPlaceHolder1_addFile").css("display","block");
var num=$("#ctl00_ContentPlaceHolder1_lblNowfile").html();
$("#ctl00_ContentPlaceHolder1_lblNowfile").html(parseInt(num)+1);
}

function addFilesDisplay(){
//   $("#ctl00_ContentPlaceHolder1_addFile").css("display","block");
$("#ctl00_ContentPlaceHolder1_beginUpload").css("display","block");
$('<input type="file" name="file" onchange="change()"/>').appendTo("#files");
}

var isHtml= function(editor){
$("#ctl00_ContentPlaceHolder1_hdnIsEmailHtml").val("true");
var oText=$("#divTextBody"); var oHtml=$("#divHtmlBody");
var editerInilized=typeof(CKEDITOR)!="undefined";
var oEditer;
if(editerInilized)
oEditer=editor;
var oTxt=$("#ctl00_ContentPlaceHolder1_txtBody");
oHtml.show();
oText.hide();
if(editerInilized)
oEditer.setData(oTxt.val());
$("#aHtml").removeClass().addClass("sel");
$("#aHtml").parent().removeClass().addClass("kuang2");
$("#aText").removeClass()
$("#aText").parent().removeClass().addClass("kuang3");
$("#trAddView").show();
$("#trAddClick").show();
$("#trUnsubscribe").show();
$("#trTrack").show();
$("#tr1").show();
}

function isText(isOne,editor)
{
$("#ctl00_ContentPlaceHolder1_hdnIsEmailHtml").val("false");
var oText=$("#divTextBody");
var oHtml=$("#divHtmlBody");
var oTxt=$("#ctl00_ContentPlaceHolder1_txtBody");
oHtml.hide();
oText.show();
if(isOne!="true")
oTxt.val(editor.getData());
$("#aHtml").removeClass();
$("#aHtml").parent().removeClass().addClass("kuang3");
$("#aText").removeClass().addClass("sel");
$("#aText").parent().removeClass().addClass("kuang2");
$("#trAddView").hide();
$("#trAddClick").hide();
$("#trUnsubscribe").hide();
$("#trTrack").hide();
$("#tr1").hide();
}

function Translate(s,type)
{
var click=$("#cbxClick").attr("checked");
var shore=$("#cbxShare").attr("checked");
var msgShare=StarConfig.UrlShare;
var msgClick=StarConfig.UrlClick;
var msgSACAll=StarConfig.UrlShareAndClick;
var msgU="";

if($("#ctl00_ContentPlaceHolder1_hidUnsubscribe").val()!="0")
{
//         if($("#ctl00_ContentPlaceHolder1_hidUnsubscribe").val()=="849")
//            {
var method="StarConfig.UnsubscribeTD"+$("#ctl00_ContentPlaceHolder1_hidUnsubscribe").val();
// msgU=StarConfig.UnsubscribeTD1;
msgU=eval(method);
// }
}
else
{
msgU=StarConfig.Unsubscribe;
}
if(type=="English")
{
msgShare=StarConfig.UrlShareEn;
msgClick=StarConfig.UrlClickEn;
msgSACAll=StarConfig.UrlShareAndClickEn;
if($("#ctl00_ContentPlaceHolder1_hidUnsubscribe").val()!="0")
{
//                  if($("#ctl00_ContentPlaceHolder1_hidUnsubscribe").val()=="849")
//                  {
var methodEn="StarConfig.UnsubscribeEnTD"+$("#ctl00_ContentPlaceHolder1_hidUnsubscribe").val();
//  msgU=StarConfig.UnsubscribeEnTD1;
msgU=eval(methodEn);
// }
}
else
{
msgU=StarConfig.UnsubscribeEn;
}
s=s.replace(StarConfig.UnsubscribePtn,msgU);
}
else
{
s=s.replace(StarConfig.UnsubscribePtnEn,msgU);
}
//alert(s);
if(click&&shore)
s=s.replace(StarConfig.ClickPtn,msgSACAll);
else if(click||shore)
{
s=s.replace(StarConfig.ClickPtn,'').replace(StarConfig.UrlSharePtn,'');
if(click)
s=msgClick+s;
else
s=msgShare+s;
}
return s;
}

var setLanguage=function(type)
{
if(type=='English')
{
$("#Share").html('Add "sharing capabilities. "');
$("#SpanClick").html('Add "If you can not view the messages, please click here; "。');
$("#Unsubscribe").html('Add to unsubscribe, forward link.');
$("#Track").html('Follow all links.');
$("#rendering").html('Chinese');
}
else
{
$("#Share").html('添加"分享功能"。');
$("#SpanClick").html('添加" 如果不能查看邮件，请点击这里"。');
$("#Unsubscribe").html('添加退订，转发标志。');
$("#Track").html('跟踪全部链接。');
$("#rendering").html('English');
}
}

function phonecheck(content){
var phone = content;
var tel = /\D{0,}([0-9]{3,4}\-[0-9]{7,8})\D{0,}|\D{0,}([0-9]{7,8})\D{0,}|\D{0,}(\([0-9]{3,4}\)[0-9]{3,8})\D{0,}|\D{0,}(0{0,1}13[0-9]{9})\D{0,}|\D{0,}(13\d{9})\D{0,}|\D{0,}(15[0135-9]\d{8})\D{0,}|\D{0,}(18[267]\d{8})\D{0,}/;

//  var tel = /(^[0-9]{3,4}\-[0-9]{7,8}$)|(^[0-9]{7,8}$)|(^\([0-9]{3,4}\)[0-9]{3,8}$)|(^0{0,1}13[0-9]{9}$)|(13\d{9}$)|(15[0135-9]\d{8}$)|(18[267]\d{8}$)/;
if (tel.exec(phone)) {
//alert("该模板可能包含电话或手机号码,如果您发送邮件QQ域名居多建议您将此模块切图,以避免被识别为垃圾邮件!");
}
}

</script>

<div id="container">
<div class="send_body">
    <div style="margin: 25px 25px 10px 25px;">
        <table cellspacing="0" cellpadding="0" width="100%" border="0">
            <tbody><tr>
                <td class="newnav1">
                    &nbsp;
                </td>
                <td class="newnav">
                            <span class="newnav_t">
                                <img align="absmiddle" src="/static/images/sub_002.gif">邮件模板</span> <span class="newnav_w">
                                    <img align="absmiddle" src="/static/images/step1.gif">新建EMAIL</span> <span class="newnav_w">
                                        <img align="absmiddle" src="/static/images/step2.gif">选择邮件类型</span> <span class="newnav_w1">
                                            <img align="absmiddle" src="/static/images/step_3.gif">编辑邮件模板<img align="absmiddle" src="/static/images/right.gif"></span> <span class="newnav_w">
                                                    <img align="absmiddle" src="/static/images/step4.gif">保存邮件</span>
                </td>
                <td class="newnav2">
                    &nbsp;
                </td>
            </tr>
            </tbody></table>
    </div>
</div>
<input type="hidden" id="ctl00_ContentPlaceHolder1_hidGroupId" name="ctl00$ContentPlaceHolder1$hidGroupId">
<input type="hidden" id="ctl00_ContentPlaceHolder1_hidLastEditStatus" name="ctl00$ContentPlaceHolder1$hidLastEditStatus">
<input type="hidden" value="0" id="ctl00_ContentPlaceHolder1_hidUnsubscribe" name="ctl00$ContentPlaceHolder1$hidUnsubscribe">
<div class="send_body">
<div style="margin: 0px 25px;">
<div class="send_tan_box">
<b class="send_tan"><b class="send_tan1"><b></b></b><b class="send_tan2"><b></b></b>
    <b class="send_tan3"></b><b class="send_tan4"></b><b class="send_tan5"></b></b>
<div style="padding-top: 10px;" class="send_tan_content">
<table cellspacing="0" cellpadding="0" width="100%" border="0">
    <tbody><tr id="trTypeChoose">
        <td align="center" class="kuang2">
            <a href="javascript:void(0);" class="sel" id="aHtml">Html</a>
        </td>
        <td width="5" style="border-bottom: solid 1px #bbb;">
            &nbsp;
        </td>
        <td align="center" class="kuang3">
            <a href="javascript:void(0);" id="aText">Text</a>
        </td>
        <td style="border-bottom: solid 1px #bbb;">
            &nbsp;<span style="display: none;" id="ctl00_ContentPlaceHolder1_fileNum">0</span>
            <span style="display: none;" id="ctl00_ContentPlaceHolder1_lblNowfile">0</span>
            <span style="display: none" id="ctl00_ContentPlaceHolder1_fileNumTotal">3</span>
            <span style="display: none" id="ctl00_ContentPlaceHolder1_UpFileTotalSize">5120</span>
        </td>
    </tr>
    </tbody></table>
<table cellspacing="0" cellpadding="0" width="100%" border="0" style="border-top: 0px;" class="kuang1">
    <tbody><tr>
        <td style="width: 65%" class="trans1">
            <font class="guang_p"><a unselectable="on" id="insertTag" href="javascript:void(0)">
                <img align="absmiddle" src="/static/images/add1.gif">插入自定义标签</a></font>
            <select class="sub_xuanze" unselectable="on" style="width: 135px; border-color: #7f9db9;" id="ctl00_ContentPlaceHolder1_ddlTags" name="ctl00$ContentPlaceHolder1$ddlTags">
                <option value="{{{Email}}}">邮箱</option>
                <option value="{{{FullName}}}">姓名</option>
                <option value="{{{Company}}}">公司名称</option>
                <option value="{{{City}}}">城市</option>
                <option value="{{{Phone}}}">电话</option>
                <option value="{{{Reserved1}}}">自定义一</option>
                <option value="{{{Reserved2}}}">自定义二</option>
                <option value="{{{Reserved3}}}">自定义三</option>
            </select>
        </td>
        <td rowspan="4">
        </td>
    </tr>
    <tr id="tr1">
        <td class="trans">
            语种切换：<a href="javaScript:void(0)" id="rendering">English</a>
        </td>
    </tr>
    <tr id="trAddView">
        <td class="trans">
            <input type="checkbox" style="margin-right: 3px;" id="cbxShare">&nbsp;<span style="font-size: 14px;" id="Share">添加" 分享功能"</span>
        </td>
    </tr>
    <tr id="trAddClick">
        <td class="trans">
            <input type="checkbox" style="margin-right: 3px;" id="cbxClick">&nbsp;<span style="font-size: 14px;" id="SpanClick">添加" 如果不能查看邮件，请点击这里"</span>
        </td>
    </tr>
    <tr id="trUnsubscribe">
        <td class="trans">
            <input type="checkbox" style="margin-right: 3px;" id="cbxUnsubscribe">&nbsp;<span style="font-size: 14px;" id="Unsubscribe">添加退订，转发标志</span>
        </td>
    </tr>
    <tr style="display:none;" id="trTrack">
        <td class="trans">
            <input type="checkbox" style="margin-right: 3px;" id="cbxTrack">&nbsp;<span style="font-size: 14px;" id="Track">跟踪全部链接</span><input type="hidden" value="true" id="ctl00_ContentPlaceHolder1_hdnIsEmailHtml" name="ctl00$ContentPlaceHolder1$hdnIsEmailHtml">
            <input type="hidden" value="jessysz@trustmta.com" id="ctl00_ContentPlaceHolder1_hdnFromEmail" name="ctl00$ContentPlaceHolder1$hdnFromEmail">
        </td>
    </tr>
    </tbody></table>
<table cellspacing="0" cellpadding="0" width="100%" border="0" class="kuang">
    <tbody><tr>
        <td style="border-top: solid 1px #bbb; background: #ffffff; height: 500px;" colspan="2">
            &nbsp;
            <div style="display: none;" id="div5">
                <textarea style="width:100%;" id="ctl00_ContentPlaceHolder1_TextBox2" cols="20" rows="30" name="ctl00$ContentPlaceHolder1$TextBox2"></textarea>
            </div>
            <div id="div6">
                <input type="hidden" id="ctl00_ContentPlaceHolder1_hdnEmailId" name="ctl00$ContentPlaceHolder1$hdnEmailId">
                <table cellspacing="0" cellpadding="0" width="100%" border="0" class="kuang">
                    <tbody><tr>
                        <td align="left" class="save_p11">
                            <img align="absmiddle" src="/static/images/connect.gif">重新从网站上获取
                            <input type="text" style="width:300px;" class="input_text" id="ctl00_ContentPlaceHolder1_txtUrl" name="ctl00$ContentPlaceHolder1$txtUrl">
                            <input type="submit" id="ctl00_ContentPlaceHolder1_btnGet" value="获取" name="ctl00$ContentPlaceHolder1$btnGet"><br>
                            <img align="absmiddle" src="/static/images/save.gif">重新从文件中上传
                            <input type="file" style="width:308px;background-color: #fff;" class="input_text" size="40" id="ctl00_ContentPlaceHolder1_UploadToImportFile" name="ctl00$ContentPlaceHolder1$UploadToImportFile">
                            <input type="submit" id="ctl00_ContentPlaceHolder1_btnUpload" value="上传" name="ctl00$ContentPlaceHolder1$btnUpload">
                                                    <span id="ctl00_ContentPlaceHolder1_divSendEmbed">
                                                        </span><br>
                        </td>
                        <td style="width: 28%; padding: 5px 5px;" class="save_p1">
                            <div style="position: absolute; z-index: 99999; width: 480px; border: solid 1px #bbbbbb;
                                                        background-color: #ffffff; display: none;" id="divSavePanel">
                                <table class="form-table" style="width: 100%;">
                                    <tbody>
                                    <tr valign="top">
                                        <td style="width: 100px; text-align: right; padding: 15px 10px 5px 0px; font-size: 14px;">
                                            <label for="message_name">
                                                <span style="font-size: 14px;">名字:</span></label>
                                        </td>
                                        <td align="left" style="padding: 15px 10px 5px 0px;">
                                            <input type="text" size="30" maxlength="50" id="ctl00_ContentPlaceHolder1_txtEmailName" name="ctl00$ContentPlaceHolder1$txtEmailName"><span style="color: Red;">*</span>
                                        </td>
                                    </tr>
                                    <tr valign="top">
                                        <td style="width: 100px; text-align: right; padding: 0px 10px 5px 0px; font-size: 14px;">
                                            <label for="draft_tag_names">
                                                <span style="font-size: 14px;">标签:</span></label>
                                        </td>
                                        <td align="left" style="padding: 0px 10px 5px 0px;">
                                            <input type="text" autocomplete="off" size="30" id="ctl00_ContentPlaceHolder1_txtLabel" name="ctl00$ContentPlaceHolder1$txtLabel">
                                            <div style="display: none;" class="auto_complete" id="label_lookup_auto_complete">
                                                <p>
                                                    <img alt="Tag_blue" src="/images/silk/tag_blue.gif?1261610540">
                                                    多个标签以<strong>commas</strong>隔开
                                                </p>
                                            </div></td>
                                    </tr>
                                    <tr valign="top">
                                        <td style="width: 100px; text-align: right; padding: 0px 10px 5px 0px; font-size: 14px;">
                                            <label for="draft_tag_names">
                                                <span style="font-size: 14px;">保存到模版组:</span></label>
                                        </td>
                                        <td align="left" style="padding: 0px 10px 5px 0px;">
                                            <div style="height:100px;overflow:auto;" id="ctl00_ContentPlaceHolder1_Panel1">

                                                <table cellspacing="0" cellpadding="0" border="0" style="width:95%;border-collapse:collapse;border: solid 1px #efefef;" class="export03" id="ctl00_ContentPlaceHolder1_groupTable">
                                                    <tbody><tr>
                                                        <td><input type="checkbox" name="ctl00$ContentPlaceHolder1$ck9621" id="ctl00_ContentPlaceHolder1_ck9621"><label for="ctl00_ContentPlaceHolder1_ck9621">自定义模版组</label></td>
                                                    </tr>
                                                    </tbody></table>
                                                <table>
                                                    <tbody><tr>
                                                        <td>
                                                            <a href="javascript:void(0);" style="font-size: 12px;" id="aCheckAllGroup">全选</a>
                                                            | <a href="javascript:void(0);" style="margin: 0px; font-size: 12px;" id="aCheckNoGroup">
                                                            全不选</a>
                                                        </td>
                                                    </tr>
                                                    </tbody></table>

                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" style="padding: 0px 0px 10px 0px; padding-left: 110px;" colspan="2">
                                            <!-- Save Button -->
                                            <div>
                                                <div style="" id="save_dialog">
                                                    <span id="spanMsg" style="color: Red;"></span>
                                                    <input type="submit" id="ctl00_ContentPlaceHolder1_btnSave1" value="保存" name="ctl00$ContentPlaceHolder1$btnSave1">
                                                    <input type="button" style="margin-right: 5px;
                                                                                    display: none;" id="btnSave" name="commit" value="保存">
                                                    <input type="button" id="aClosePanel" name="commit" value="关闭">
                                                </div>
                                                <div id="save_indicator" style="display: none;">
                                                    <img alt="Indicator" id="img_indicator" src="/static/images/indicator.gif">
                                                    保存中...
                                                </div>
                                            </div>
                                            <div class="clear">
                                            </div></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <span style="color: Red;" id="ctl00_ContentPlaceHolder1_span1"></span><span id="spanResult" style="color: Red;"></span><a id="aShowSavePanel" href="#">
                            <img align="absmiddle" src="/static/images/save.gif">
                            保存</a> <a id="aPreview" href="#">
                            <img align="absmiddle" src="/static/images/zoom.gif">预览</a>
                        </td>
                    </tr>
                    <tr>
                        <td style="border-top: solid 1px #bbb; background: #ffffff; height: 500px;" colspan="2">
                            <div id="divHtmlBody">
                                <input type="hidden" id="ctl00_ContentPlaceHolder1_HidCkeditorBody" name="ctl00$ContentPlaceHolder1$HidCkeditorBody">


                                <textarea style="height: 480px; visibility: hidden; display: none;" id="ctl00_ContentPlaceHolder1_divCkeditorBody" cols="20" rows="2" name="ctl00$ContentPlaceHolder1$divCkeditorBody"></textarea><div lang="zh-cn" aria-labelledby="cke_ctl00_ContentPlaceHolder1_divCkeditorBody_arialbl" role="application" dir="ltr" class="cke_1 cke cke_reset cke_chrome cke_editor_ctl00_ContentPlaceHolder1_divCkeditorBody cke_ltr cke_browser_gecko" id="cke_ctl00_ContentPlaceHolder1_divCkeditorBody"><span class="cke_voice_label" id="cke_ctl00_ContentPlaceHolder1_divCkeditorBody_arialbl">所见即所得编辑器, ctl00_ContentPlaceHolder1_divCkeditorBody</span><div role="presentation" class="cke_inner cke_reset"><span style="height: auto; -moz-user-select: none;" role="presentation" class="cke_top cke_reset_all" id="cke_1_top"><span class="cke_voice_label" id="cke_9">工具栏</span><span onmousedown="return false;" aria-labelledby="cke_9" role="group" class="cke_toolbox" id="cke_1_toolbox"><span role="toolbar" aria-labelledby="cke_14_label" class="cke_toolbar" id="cke_14"><span class="cke_voice_label" id="cke_14_label">文档</span><span class="cke_toolbar_start"></span><span role="presentation" class="cke_toolgroup"><a onclick="CKEDITOR.tools.callFunction(4,this);return false;" onmousedown="return CKEDITOR.tools.callFunction(3,event);" onfocus="return CKEDITOR.tools.callFunction(2,event);" onkeydown="return CKEDITOR.tools.callFunction(1,event);" onblur="this.style.cssText = this.style.cssText;" aria-haspopup="false" aria-labelledby="cke_15_label" role="button" hidefocus="true" tabindex="-1" title="源码" class="cke_button cke_button__source  cke_button_off" id="cke_15"><span style="background-image:url(http://app.focussend.com/focussend/NewCkeditor/plugins/icons.png?t=E1PE);background-position:0 -1824px;background-size:auto;" class="cke_button_icon cke_button__source_icon">&nbsp;</span><span aria-hidden="false" class="cke_button_label cke_button__source_label" id="cke_15_label">源码</span></a><span role="separator" class="cke_toolbar_separator"></span><a onclick="CKEDITOR.tools.callFunction(8,this);return false;" onmousedown="return CKEDITOR.tools.callFunction(7,event);" onfocus="return CKEDITOR.tools.callFunction(6,event);" onkeydown="return CKEDITOR.tools.callFunction(5,event);" onblur="this.style.cssText = this.style.cssText;" aria-haspopup="false" aria-labelledby="cke_16_label" role="button" hidefocus="true" tabindex="-1" title="预览" class="cke_button cke_button__preview  cke_button_off" id="cke_16"><span style="background-image:url(http://app.focussend.com/focussend/NewCkeditor/plugins/icons.png?t=E1PE);background-position:0 -1632px;background-size:auto;" class="cke_button_icon cke_button__preview_icon">&nbsp;</span><span aria-hidden="false" class="cke_button_label cke_button__preview_label" id="cke_16_label">预览</span></a><a onclick="CKEDITOR.tools.callFunction(12,this);return false;" onmousedown="return CKEDITOR.tools.callFunction(11,event);" onfocus="return CKEDITOR.tools.callFunction(10,event);" onkeydown="return CKEDITOR.tools.callFunction(9,event);" onblur="this.style.cssText = this.style.cssText;" aria-haspopup="false" aria-labelledby="cke_17_label" role="button" hidefocus="true" tabindex="-1" title="打印" class="cke_button cke_button__print  cke_button_off" id="cke_17"><span style="background-image:url(http://app.focussend.com/focussend/NewCkeditor/plugins/icons.png?t=E1PE);background-position:0 -1656px;background-size:auto;" class="cke_button_icon cke_button__print_icon">&nbsp;</span><span aria-hidden="false" class="cke_button_label cke_button__print_label" id="cke_17_label">打印</span></a><span role="separator" class="cke_toolbar_separator"></span><a onclick="CKEDITOR.tools.callFunction(16,this);return false;" onmousedown="return CKEDITOR.tools.callFunction(15,event);" onfocus="return CKEDITOR.tools.callFunction(14,event);" onkeydown="return CKEDITOR.tools.callFunction(13,event);" onblur="this.style.cssText = this.style.cssText;" aria-haspopup="false" aria-labelledby="cke_18_label" role="button" hidefocus="true" tabindex="-1" title="模板" class="cke_button cke_button__templates  cke_button_off" id="cke_18"><span style="background-image:url(http://app.focussend.com/focussend/NewCkeditor/plugins/icons.png?t=E1PE);background-position:0 -456px;background-size:auto;" class="cke_button_icon cke_button__templates_icon">&nbsp;</span><span aria-hidden="false" class="cke_button_label cke_button__templates_label" id="cke_18_label">模板</span></a></span><span class="cke_toolbar_end"></span></span><span role="toolbar" aria-labelledby="cke_19_label" class="cke_toolbar" id="cke_19"><span class="cke_voice_label" id="cke_19_label">剪贴板/撤销</span><span class="cke_toolbar_start"></span><span role="presentation" class="cke_toolgroup"><a onclick="CKEDITOR.tools.callFunction(20,this);return false;" onmousedown="return CKEDITOR.tools.callFunction(19,event);" onfocus="return CKEDITOR.tools.callFunction(18,event);" onkeydown="return CKEDITOR.tools.callFunction(17,event);" onblur="this.style.cssText = this.style.cssText;" aria-disabled="true" aria-haspopup="false" aria-labelledby="cke_20_label" role="button" hidefocus="true" tabindex="-1" title="剪切" class="cke_button cke_button__cut cke_button_disabled " id="cke_20"><span style="background-image:url(http://app.focussend.com/focussend/NewCkeditor/plugins/icons.png?t=E1PE);background-position:0 -312px;background-size:auto;" class="cke_button_icon cke_button__cut_icon">&nbsp;</span><span aria-hidden="false" class="cke_button_label cke_button__cut_label" id="cke_20_label">剪切</span></a><a onclick="CKEDITOR.tools.callFunction(24,this);return false;" onmousedown="return CKEDITOR.tools.callFunction(23,event);" onfocus="return CKEDITOR.tools.callFunction(22,event);" onkeydown="return CKEDITOR.tools.callFunction(21,event);" onblur="this.style.cssText = this.style.cssText;" aria-disabled="true" aria-haspopup="false" aria-labelledby="cke_21_label" role="button" hidefocus="true" tabindex="-1" title="复制" class="cke_button cke_button__copy cke_button_disabled " id="cke_21"><span style="background-image:url(http://app.focussend.com/focussend/NewCkeditor/plugins/icons.png?t=E1PE);background-position:0 -264px;background-size:auto;" class="cke_button_icon cke_button__copy_icon">&nbsp;</span><span aria-hidden="false" class="cke_button_label cke_button__copy_label" id="cke_21_label">复制</span></a><a onclick="CKEDITOR.tools.callFunction(28,this);return false;" onmousedown="return CKEDITOR.tools.callFunction(27,event);" onfocus="return CKEDITOR.tools.callFunction(26,event);" onkeydown="return CKEDITOR.tools.callFunction(25,event);" onblur="this.style.cssText = this.style.cssText;" aria-haspopup="false" aria-labelledby="cke_22_label" role="button" hidefocus="true" tabindex="-1" title="粘贴" class="cke_button cke_button__paste  cke_button_off" id="cke_22"><span style="background-image:url(http://app.focussend.com/focussend/NewCkeditor/plugins/icons.png?t=E1PE);background-position:0 -360px;background-size:auto;" class="cke_button_icon cke_button__paste_icon">&nbsp;</span><span aria-hidden="false" class="cke_button_label cke_button__paste_label" id="cke_22_label">粘贴</span></a><a onclick="CKEDITOR.tools.callFunction(32,this);return false;" onmousedown="return CKEDITOR.tools.callFunction(31,event);" onfocus="return CKEDITOR.tools.callFunction(30,event);" onkeydown="return CKEDITOR.tools.callFunction(29,event);" onblur="this.style.cssText = this.style.cssText;" aria-haspopup="false" aria-labelledby="cke_23_label" role="button" hidefocus="true" tabindex="-1" title="粘贴为无格式文本" class="cke_button cke_button__pastetext  cke_button_off" id="cke_23"><span style="background-image:url(http://app.focussend.com/focussend/NewCkeditor/plugins/icons.png?t=E1PE);background-position:0 -1536px;background-size:auto;" class="cke_button_icon cke_button__pastetext_icon">&nbsp;</span><span aria-hidden="false" class="cke_button_label cke_button__pastetext_label" id="cke_23_label">粘贴为无格式文本</span></a><a onclick="CKEDITOR.tools.callFunction(36,this);return false;" onmousedown="return CKEDITOR.tools.callFunction(35,event);" onfocus="return CKEDITOR.tools.callFunction(34,event);" onkeydown="return CKEDITOR.tools.callFunction(33,event);" onblur="this.style.cssText = this.style.cssText;" aria-haspopup="false" aria-labelledby="cke_24_label" role="button" hidefocus="true" tabindex="-1" title="从 MS Word 粘贴" class="cke_button cke_button__pastefromword  cke_button_off" id="cke_24"><span style="background-image:url(http://app.focussend.com/focussend/NewCkeditor/plugins/icons.png?t=E1PE);background-position:0 -1584px;background-size:auto;" class="cke_button_icon cke_button__pastefromword_icon">&nbsp;</span><span aria-hidden="false" class="cke_button_label cke_button__pastefromword_label" id="cke_24_label">从 MS Word 粘贴</span></a><span role="separator" class="cke_toolbar_separator"></span><a onclick="CKEDITOR.tools.callFunction(40,this);return false;" onmousedown="return CKEDITOR.tools.callFunction(39,event);" onfocus="return CKEDITOR.tools.callFunction(38,event);" onkeydown="return CKEDITOR.tools.callFunction(37,event);" onblur="this.style.cssText = this.style.cssText;" aria-disabled="true" aria-haspopup="false" aria-labelledby="cke_25_label" role="button" hidefocus="true" tabindex="-1" title="撤消" class="cke_button cke_button__undo cke_button_disabled " id="cke_25"><span style="background-image:url(http://app.focussend.com/focussend/NewCkeditor/plugins/icons.png?t=E1PE);background-position:0 -1992px;background-size:auto;" class="cke_button_icon cke_button__undo_icon">&nbsp;</span><span aria-hidden="false" class="cke_button_label cke_button__undo_label" id="cke_25_label">撤消</span></a><a onclick="CKEDITOR.tools.callFunction(44,this);return false;" onmousedown="return CKEDITOR.tools.callFunction(43,event);" onfocus="return CKEDITOR.tools.callFunction(42,event);" onkeydown="return CKEDITOR.tools.callFunction(41,event);" onblur="this.style.cssText = this.style.cssText;" aria-disabled="true" aria-haspopup="false" aria-labelledby="cke_26_label" role="button" hidefocus="true" tabindex="-1" title="重做" class="cke_button cke_button__redo cke_button_disabled " id="cke_26"><span style="background-image:url(http://app.focussend.com/focussend/NewCkeditor/plugins/icons.png?t=E1PE);background-position:0 -1944px;background-size:auto;" class="cke_button_icon cke_button__redo_icon">&nbsp;</span><span aria-hidden="false" class="cke_button_label cke_button__redo_label" id="cke_26_label">重做</span></a></span><span class="cke_toolbar_end"></span></span><span role="toolbar" aria-labelledby="cke_27_label" class="cke_toolbar" id="cke_27"><span class="cke_voice_label" id="cke_27_label">编辑</span><span class="cke_toolbar_start"></span><span role="presentation" class="cke_toolgroup"><a onclick="CKEDITOR.tools.callFunction(48,this);return false;" onmousedown="return CKEDITOR.tools.callFunction(47,event);" onfocus="return CKEDITOR.tools.callFunction(46,event);" onkeydown="return CKEDITOR.tools.callFunction(45,event);" onblur="this.style.cssText = this.style.cssText;" aria-haspopup="false" aria-labelledby="cke_28_label" role="button" hidefocus="true" tabindex="-1" title="查找" class="cke_button cke_button__find  cke_button_off" id="cke_28"><span style="background-image:url(http://app.focussend.com/focussend/NewCkeditor/plugins/icons.png?t=E1PE);background-position:0 -528px;background-size:auto;" class="cke_button_icon cke_button__find_icon">&nbsp;</span><span aria-hidden="false" class="cke_button_label cke_button__find_label" id="cke_28_label">查找</span></a><a onclick="CKEDITOR.tools.callFunction(52,this);return false;" onmousedown="return CKEDITOR.tools.callFunction(51,event);" onfocus="return CKEDITOR.tools.callFunction(50,event);" onkeydown="return CKEDITOR.tools.callFunction(49,event);" onblur="this.style.cssText = this.style.cssText;" aria-haspopup="false" aria-labelledby="cke_29_label" role="button" hidefocus="true" tabindex="-1" title="替换" class="cke_button cke_button__replace  cke_button_off" id="cke_29"><span style="background-image:url(http://app.focussend.com/focussend/NewCkeditor/plugins/icons.png?t=E1PE);background-position:0 -552px;background-size:auto;" class="cke_button_icon cke_button__replace_icon">&nbsp;</span><span aria-hidden="false" class="cke_button_label cke_button__replace_label" id="cke_29_label">替换</span></a><span role="separator" class="cke_toolbar_separator"></span><a onclick="CKEDITOR.tools.callFunction(56,this);return false;" onmousedown="return CKEDITOR.tools.callFunction(55,event);" onfocus="return CKEDITOR.tools.callFunction(54,event);" onkeydown="return CKEDITOR.tools.callFunction(53,event);" onblur="this.style.cssText = this.style.cssText;" aria-haspopup="false" aria-labelledby="cke_30_label" role="button" hidefocus="true" tabindex="-1" title="全选" class="cke_button cke_button__selectall  cke_button_off" id="cke_30"><span style="background-image:url(http://app.focussend.com/focussend/NewCkeditor/plugins/icons.png?t=E1PE);background-position:0 -1728px;background-size:auto;" class="cke_button_icon cke_button__selectall_icon">&nbsp;</span><span aria-hidden="false" class="cke_button_label cke_button__selectall_label" id="cke_30_label">全选</span></a><span role="separator" class="cke_toolbar_separator"></span><a onclick="CKEDITOR.tools.callFunction(60,this);return false;" onmousedown="return CKEDITOR.tools.callFunction(59,event);" onfocus="return CKEDITOR.tools.callFunction(58,event);" onkeydown="return CKEDITOR.tools.callFunction(57,event);" onblur="this.style.cssText = this.style.cssText;" aria-haspopup="true" aria-labelledby="cke_31_label" role="button" hidefocus="true" tabindex="-1" title="即时拼写检查" class="cke_button cke_button__scayt cke_button_off " id="cke_31"><span style="background-image:url(http://app.focussend.com/focussend/NewCkeditor/plugins/icons.png?t=E1PE);background-position:0 -1872px;background-size:auto;" class="cke_button_icon cke_button__scayt_icon">&nbsp;</span><span aria-hidden="false" class="cke_button_label cke_button__scayt_label" id="cke_31_label">即时拼写检查</span><span class="cke_button_arrow"></span></a></span><span class="cke_toolbar_end"></span></span><span role="toolbar" aria-labelledby="cke_32_label" class="cke_toolbar" id="cke_32"><span class="cke_voice_label" id="cke_32_label">表单</span><span class="cke_toolbar_start"></span><span role="presentation" class="cke_toolgroup"><a onclick="CKEDITOR.tools.callFunction(64,this);return false;" onmousedown="return CKEDITOR.tools.callFunction(63,event);" onfocus="return CKEDITOR.tools.callFunction(62,event);" onkeydown="return CKEDITOR.tools.callFunction(61,event);" onblur="this.style.cssText = this.style.cssText;" aria-haspopup="false" aria-labelledby="cke_33_label" role="button" hidefocus="true" tabindex="-1" title="表单" class="cke_button cke_button__form  cke_button_off" id="cke_33"><span style="background-image:url(http://app.focussend.com/focussend/NewCkeditor/plugins/icons.png?t=E1PE);background-position:0 -648px;background-size:auto;" class="cke_button_icon cke_button__form_icon">&nbsp;</span><span aria-hidden="false" class="cke_button_label cke_button__form_label" id="cke_33_label">表单</span></a><a onclick="CKEDITOR.tools.callFunction(68,this);return false;" onmousedown="return CKEDITOR.tools.callFunction(67,event);" onfocus="return CKEDITOR.tools.callFunction(66,event);" onkeydown="return CKEDITOR.tools.callFunction(65,event);" onblur="this.style.cssText = this.style.cssText;" aria-haspopup="false" aria-labelledby="cke_34_label" role="button" hidefocus="true" tabindex="-1" title="复选框" class="cke_button cke_button__checkbox  cke_button_off" id="cke_34"><span style="background-image:url(http://app.focussend.com/focussend/NewCkeditor/plugins/icons.png?t=E1PE);background-position:0 -624px;background-size:auto;" class="cke_button_icon cke_button__checkbox_icon">&nbsp;</span><span aria-hidden="false" class="cke_button_label cke_button__checkbox_label" id="cke_34_label">复选框</span></a><a onclick="CKEDITOR.tools.callFunction(72,this);return false;" onmousedown="return CKEDITOR.tools.callFunction(71,event);" onfocus="return CKEDITOR.tools.callFunction(70,event);" onkeydown="return CKEDITOR.tools.callFunction(69,event);" onblur="this.style.cssText = this.style.cssText;" aria-haspopup="false" aria-labelledby="cke_35_label" role="button" hidefocus="true" tabindex="-1" title="单选按钮" class="cke_button cke_button__radio  cke_button_off" id="cke_35"><span style="background-image:url(http://app.focussend.com/focussend/NewCkeditor/plugins/icons.png?t=E1PE);background-position:0 -720px;background-size:auto;" class="cke_button_icon cke_button__radio_icon">&nbsp;</span><span aria-hidden="false" class="cke_button_label cke_button__radio_label" id="cke_35_label">单选按钮</span></a><a onclick="CKEDITOR.tools.callFunction(76,this);return false;" onmousedown="return CKEDITOR.tools.callFunction(75,event);" onfocus="return CKEDITOR.tools.callFunction(74,event);" onkeydown="return CKEDITOR.tools.callFunction(73,event);" onblur="this.style.cssText = this.style.cssText;" aria-haspopup="false" aria-labelledby="cke_36_label" role="button" hidefocus="true" tabindex="-1" title="单行文本" class="cke_button cke_button__textfield  cke_button_off" id="cke_36"><span style="background-image:url(http://app.focussend.com/focussend/NewCkeditor/plugins/icons.png?t=E1PE);background-position:0 -864px;background-size:auto;" class="cke_button_icon cke_button__textfield_icon">&nbsp;</span><span aria-hidden="false" class="cke_button_label cke_button__textfield_label" id="cke_36_label">单行文本</span></a><a onclick="CKEDITOR.tools.callFunction(80,this);return false;" onmousedown="return CKEDITOR.tools.callFunction(79,event);" onfocus="return CKEDITOR.tools.callFunction(78,event);" onkeydown="return CKEDITOR.tools.callFunction(77,event);" onblur="this.style.cssText = this.style.cssText;" aria-haspopup="false" aria-labelledby="cke_37_label" role="button" hidefocus="true" tabindex="-1" title="多行文本" class="cke_button cke_button__textarea  cke_button_off" id="cke_37"><span style="background-image:url(http://app.focussend.com/focussend/NewCkeditor/plugins/icons.png?t=E1PE);background-position:0 -816px;background-size:auto;" class="cke_button_icon cke_button__textarea_icon">&nbsp;</span><span aria-hidden="false" class="cke_button_label cke_button__textarea_label" id="cke_37_label">多行文本</span></a><a onclick="CKEDITOR.tools.callFunction(84,this);return false;" onmousedown="return CKEDITOR.tools.callFunction(83,event);" onfocus="return CKEDITOR.tools.callFunction(82,event);" onkeydown="return CKEDITOR.tools.callFunction(81,event);" onblur="this.style.cssText = this.style.cssText;" aria-haspopup="false" aria-labelledby="cke_38_label" role="button" hidefocus="true" tabindex="-1" title="列表/菜单" class="cke_button cke_button__select  cke_button_off" id="cke_38"><span style="background-image:url(http://app.focussend.com/focussend/NewCkeditor/plugins/icons.png?t=E1PE);background-position:0 -768px;background-size:auto;" class="cke_button_icon cke_button__select_icon">&nbsp;</span><span aria-hidden="false" class="cke_button_label cke_button__select_label" id="cke_38_label">列表/菜单</span></a><a onclick="CKEDITOR.tools.callFunction(88,this);return false;" onmousedown="return CKEDITOR.tools.callFunction(87,event);" onfocus="return CKEDITOR.tools.callFunction(86,event);" onkeydown="return CKEDITOR.tools.callFunction(85,event);" onblur="this.style.cssText = this.style.cssText;" aria-haspopup="false" aria-labelledby="cke_39_label" role="button" hidefocus="true" tabindex="-1" title="按钮" class="cke_button cke_button__button  cke_button_off" id="cke_39"><span style="background-image:url(http://app.focussend.com/focussend/NewCkeditor/plugins/icons.png?t=E1PE);background-position:0 -600px;background-size:auto;" class="cke_button_icon cke_button__button_icon">&nbsp;</span><span aria-hidden="false" class="cke_button_label cke_button__button_label" id="cke_39_label">按钮</span></a><a onclick="CKEDITOR.tools.callFunction(92,this);return false;" onmousedown="return CKEDITOR.tools.callFunction(91,event);" onfocus="return CKEDITOR.tools.callFunction(90,event);" onkeydown="return CKEDITOR.tools.callFunction(89,event);" onblur="this.style.cssText = this.style.cssText;" aria-haspopup="false" aria-labelledby="cke_40_label" role="button" hidefocus="true" tabindex="-1" title="图像按钮" class="cke_button cke_button__imagebutton  cke_button_off" id="cke_40"><span style="background-image:url(http://app.focussend.com/focussend/NewCkeditor/plugins/icons.png?t=E1PE);background-position:0 -696px;background-size:auto;" class="cke_button_icon cke_button__imagebutton_icon">&nbsp;</span><span aria-hidden="false" class="cke_button_label cke_button__imagebutton_label" id="cke_40_label">图像按钮</span></a><a onclick="CKEDITOR.tools.callFunction(96,this);return false;" onmousedown="return CKEDITOR.tools.callFunction(95,event);" onfocus="return CKEDITOR.tools.callFunction(94,event);" onkeydown="return CKEDITOR.tools.callFunction(93,event);" onblur="this.style.cssText = this.style.cssText;" aria-haspopup="false" aria-labelledby="cke_41_label" role="button" hidefocus="true" tabindex="-1" title="隐藏域" class="cke_button cke_button__hiddenfield  cke_button_off" id="cke_41"><span style="background-image:url(http://app.focussend.com/focussend/NewCkeditor/plugins/icons.png?t=E1PE);background-position:0 -672px;background-size:auto;" class="cke_button_icon cke_button__hiddenfield_icon">&nbsp;</span><span aria-hidden="false" class="cke_button_label cke_button__hiddenfield_label" id="cke_41_label">隐藏域</span></a></span><span class="cke_toolbar_end"></span></span><span class="cke_toolbar_break"></span><span role="toolbar" aria-labelledby="cke_42_label" class="cke_toolbar" id="cke_42"><span class="cke_voice_label" id="cke_42_label">基本格式</span><span class="cke_toolbar_start"></span><span role="presentation" class="cke_toolgroup"><a onclick="CKEDITOR.tools.callFunction(100,this);return false;" onmousedown="return CKEDITOR.tools.callFunction(99,event);" onfocus="return CKEDITOR.tools.callFunction(98,event);" onkeydown="return CKEDITOR.tools.callFunction(97,event);" onblur="this.style.cssText = this.style.cssText;" aria-haspopup="false" aria-labelledby="cke_43_label" role="button" hidefocus="true" tabindex="-1" title="加粗" class="cke_button cke_button__bold  cke_button_off" id="cke_43"><span style="background-image:url(http://app.focussend.com/focussend/NewCkeditor/plugins/icons.png?t=E1PE);background-position:0 -24px;background-size:auto;" class="cke_button_icon cke_button__bold_icon">&nbsp;</span><span aria-hidden="false" class="cke_button_label cke_button__bold_label" id="cke_43_label">加粗</span></a><a onclick="CKEDITOR.tools.callFunction(104,this);return false;" onmousedown="return CKEDITOR.tools.callFunction(103,event);" onfocus="return CKEDITOR.tools.callFunction(102,event);" onkeydown="return CKEDITOR.tools.callFunction(101,event);" onblur="this.style.cssText = this.style.cssText;" aria-haspopup="false" aria-labelledby="cke_44_label" role="button" hidefocus="true" tabindex="-1" title="倾斜" class="cke_button cke_button__italic  cke_button_off" id="cke_44"><span style="background-image:url(http://app.focussend.com/focussend/NewCkeditor/plugins/icons.png?t=E1PE);background-position:0 -48px;background-size:auto;" class="cke_button_icon cke_button__italic_icon">&nbsp;</span><span aria-hidden="false" class="cke_button_label cke_button__italic_label" id="cke_44_label">倾斜</span></a><a onclick="CKEDITOR.tools.callFunction(108,this);return false;" onmousedown="return CKEDITOR.tools.callFunction(107,event);" onfocus="return CKEDITOR.tools.callFunction(106,event);" onkeydown="return CKEDITOR.tools.callFunction(105,event);" onblur="this.style.cssText = this.style.cssText;" aria-haspopup="false" aria-labelledby="cke_45_label" role="button" hidefocus="true" tabindex="-1" title="下划线" class="cke_button cke_button__underline  cke_button_off" id="cke_45"><span style="background-image:url(http://app.focussend.com/focussend/NewCkeditor/plugins/icons.png?t=E1PE);background-position:0 -144px;background-size:auto;" class="cke_button_icon cke_button__underline_icon">&nbsp;</span><span aria-hidden="false" class="cke_button_label cke_button__underline_label" id="cke_45_label">下划线</span></a><a onclick="CKEDITOR.tools.callFunction(112,this);return false;" onmousedown="return CKEDITOR.tools.callFunction(111,event);" onfocus="return CKEDITOR.tools.callFunction(110,event);" onkeydown="return CKEDITOR.tools.callFunction(109,event);" onblur="this.style.cssText = this.style.cssText;" aria-haspopup="false" aria-labelledby="cke_46_label" role="button" hidefocus="true" tabindex="-1" title="删除线" class="cke_button cke_button__strike  cke_button_off" id="cke_46"><span style="background-image:url(http://app.focussend.com/focussend/NewCkeditor/plugins/icons.png?t=E1PE);background-position:0 -72px;background-size:auto;" class="cke_button_icon cke_button__strike_icon">&nbsp;</span><span aria-hidden="false" class="cke_button_label cke_button__strike_label" id="cke_46_label">删除线</span></a><a onclick="CKEDITOR.tools.callFunction(116,this);return false;" onmousedown="return CKEDITOR.tools.callFunction(115,event);" onfocus="return CKEDITOR.tools.callFunction(114,event);" onkeydown="return CKEDITOR.tools.callFunction(113,event);" onblur="this.style.cssText = this.style.cssText;" aria-haspopup="false" aria-labelledby="cke_47_label" role="button" hidefocus="true" tabindex="-1" title="下标" class="cke_button cke_button__subscript  cke_button_off" id="cke_47"><span style="background-image:url(http://app.focussend.com/focussend/NewCkeditor/plugins/icons.png?t=E1PE);background-position:0 -96px;background-size:auto;" class="cke_button_icon cke_button__subscript_icon">&nbsp;</span><span aria-hidden="false" class="cke_button_label cke_button__subscript_label" id="cke_47_label">下标</span></a><a onclick="CKEDITOR.tools.callFunction(120,this);return false;" onmousedown="return CKEDITOR.tools.callFunction(119,event);" onfocus="return CKEDITOR.tools.callFunction(118,event);" onkeydown="return CKEDITOR.tools.callFunction(117,event);" onblur="this.style.cssText = this.style.cssText;" aria-haspopup="false" aria-labelledby="cke_48_label" role="button" hidefocus="true" tabindex="-1" title="上标" class="cke_button cke_button__superscript  cke_button_off" id="cke_48"><span style="background-image:url(http://app.focussend.com/focussend/NewCkeditor/plugins/icons.png?t=E1PE);background-position:0 -120px;background-size:auto;" class="cke_button_icon cke_button__superscript_icon">&nbsp;</span><span aria-hidden="false" class="cke_button_label cke_button__superscript_label" id="cke_48_label">上标</span></a><span role="separator" class="cke_toolbar_separator"></span><a onclick="CKEDITOR.tools.callFunction(124,this);return false;" onmousedown="return CKEDITOR.tools.callFunction(123,event);" onfocus="return CKEDITOR.tools.callFunction(122,event);" onkeydown="return CKEDITOR.tools.callFunction(121,event);" onblur="this.style.cssText = this.style.cssText;" aria-haspopup="false" aria-labelledby="cke_49_label" role="button" hidefocus="true" tabindex="-1" title="清除格式" class="cke_button cke_button__removeformat  cke_button_off" id="cke_49"><span style="background-image:url(http://app.focussend.com/focussend/NewCkeditor/plugins/icons.png?t=E1PE);background-position:0 -1680px;background-size:auto;" class="cke_button_icon cke_button__removeformat_icon">&nbsp;</span><span aria-hidden="false" class="cke_button_label cke_button__removeformat_label" id="cke_49_label">清除格式</span></a></span><span class="cke_toolbar_end"></span></span><span role="toolbar" aria-labelledby="cke_50_label" class="cke_toolbar" id="cke_50"><span class="cke_voice_label" id="cke_50_label">段落</span><span class="cke_toolbar_start"></span><span role="presentation" class="cke_toolgroup"><a onclick="CKEDITOR.tools.callFunction(128,this);return false;" onmousedown="return CKEDITOR.tools.callFunction(127,event);" onfocus="return CKEDITOR.tools.callFunction(126,event);" onkeydown="return CKEDITOR.tools.callFunction(125,event);" onblur="this.style.cssText = this.style.cssText;" aria-haspopup="false" aria-labelledby="cke_51_label" role="button" hidefocus="true" tabindex="-1" title="编号列表" class="cke_button cke_button__numberedlist  cke_button_off" id="cke_51"><span style="background-image:url(http://app.focussend.com/focussend/NewCkeditor/plugins/icons.png?t=E1PE);background-position:0 -1368px;background-size:auto;" class="cke_button_icon cke_button__numberedlist_icon">&nbsp;</span><span aria-hidden="false" class="cke_button_label cke_button__numberedlist_label" id="cke_51_label">编号列表</span></a><a onclick="CKEDITOR.tools.callFunction(132,this);return false;" onmousedown="return CKEDITOR.tools.callFunction(131,event);" onfocus="return CKEDITOR.tools.callFunction(130,event);" onkeydown="return CKEDITOR.tools.callFunction(129,event);" onblur="this.style.cssText = this.style.cssText;" aria-haspopup="false" aria-labelledby="cke_52_label" role="button" hidefocus="true" tabindex="-1" title="项目列表" class="cke_button cke_button__bulletedlist  cke_button_off" id="cke_52"><span style="background-image:url(http://app.focussend.com/focussend/NewCkeditor/plugins/icons.png?t=E1PE);background-position:0 -1320px;background-size:auto;" class="cke_button_icon cke_button__bulletedlist_icon">&nbsp;</span><span aria-hidden="false" class="cke_button_label cke_button__bulletedlist_label" id="cke_52_label">项目列表</span></a><span role="separator" class="cke_toolbar_separator"></span><a onclick="CKEDITOR.tools.callFunction(136,this);return false;" onmousedown="return CKEDITOR.tools.callFunction(135,event);" onfocus="return CKEDITOR.tools.callFunction(134,event);" onkeydown="return CKEDITOR.tools.callFunction(133,event);" onblur="this.style.cssText = this.style.cssText;" aria-disabled="true" aria-haspopup="false" aria-labelledby="cke_53_label" role="button" hidefocus="true" tabindex="-1" title="减少缩进量" class="cke_button cke_button__outdent cke_button_disabled " id="cke_53"><span style="background-image:url(http://app.focussend.com/focussend/NewCkeditor/plugins/icons.png?t=E1PE);background-position:0 -1032px;background-size:auto;" class="cke_button_icon cke_button__outdent_icon">&nbsp;</span><span aria-hidden="false" class="cke_button_label cke_button__outdent_label" id="cke_53_label">减少缩进量</span></a><a onclick="CKEDITOR.tools.callFunction(140,this);return false;" onmousedown="return CKEDITOR.tools.callFunction(139,event);" onfocus="return CKEDITOR.tools.callFunction(138,event);" onkeydown="return CKEDITOR.tools.callFunction(137,event);" onblur="this.style.cssText = this.style.cssText;" aria-haspopup="false" aria-labelledby="cke_54_label" role="button" hidefocus="true" tabindex="-1" title="增加缩进量" class="cke_button cke_button__indent  cke_button_off" id="cke_54"><span style="background-image:url(http://app.focussend.com/focussend/NewCkeditor/plugins/icons.png?t=E1PE);background-position:0 -984px;background-size:auto;" class="cke_button_icon cke_button__indent_icon">&nbsp;</span><span aria-hidden="false" class="cke_button_label cke_button__indent_label" id="cke_54_label">增加缩进量</span></a><span role="separator" class="cke_toolbar_separator"></span><a onclick="CKEDITOR.tools.callFunction(144,this);return false;" onmousedown="return CKEDITOR.tools.callFunction(143,event);" onfocus="return CKEDITOR.tools.callFunction(142,event);" onkeydown="return CKEDITOR.tools.callFunction(141,event);" onblur="this.style.cssText = this.style.cssText;" aria-haspopup="false" aria-labelledby="cke_55_label" role="button" hidefocus="true" tabindex="-1" title="块引用" class="cke_button cke_button__blockquote  cke_button_off" id="cke_55"><span style="background-image:url(http://app.focussend.com/focussend/NewCkeditor/plugins/icons.png?t=E1PE);background-position:0 -216px;background-size:auto;" class="cke_button_icon cke_button__blockquote_icon">&nbsp;</span><span aria-hidden="false" class="cke_button_label cke_button__blockquote_label" id="cke_55_label">块引用</span></a><a onclick="CKEDITOR.tools.callFunction(148,this);return false;" onmousedown="return CKEDITOR.tools.callFunction(147,event);" onfocus="return CKEDITOR.tools.callFunction(146,event);" onkeydown="return CKEDITOR.tools.callFunction(145,event);" onblur="this.style.cssText = this.style.cssText;" aria-haspopup="false" aria-labelledby="cke_56_label" role="button" hidefocus="true" tabindex="-1" title="创建 DIV 容器" class="cke_button cke_button__creatediv  cke_button_off" id="cke_56"><span style="background-image:url(http://app.focussend.com/focussend/NewCkeditor/plugins/icons.png?t=E1PE);background-position:0 -480px;background-size:auto;" class="cke_button_icon cke_button__creatediv_icon">&nbsp;</span><span aria-hidden="false" class="cke_button_label cke_button__creatediv_label" id="cke_56_label">创建 DIV 容器</span></a><span role="separator" class="cke_toolbar_separator"></span><a onclick="CKEDITOR.tools.callFunction(152,this);return false;" onmousedown="return CKEDITOR.tools.callFunction(151,event);" onfocus="return CKEDITOR.tools.callFunction(150,event);" onkeydown="return CKEDITOR.tools.callFunction(149,event);" onblur="this.style.cssText = this.style.cssText;" aria-haspopup="false" aria-labelledby="cke_57_label" role="button" hidefocus="true" tabindex="-1" title="左对齐" class="cke_button cke_button__justifyleft  cke_button_off" id="cke_57"><span style="background-image:url(http://app.focussend.com/focussend/NewCkeditor/plugins/icons.png?t=E1PE);background-position:0 -1128px;background-size:auto;" class="cke_button_icon cke_button__justifyleft_icon">&nbsp;</span><span aria-hidden="false" class="cke_button_label cke_button__justifyleft_label" id="cke_57_label">左对齐</span></a><a onclick="CKEDITOR.tools.callFunction(156,this);return false;" onmousedown="return CKEDITOR.tools.callFunction(155,event);" onfocus="return CKEDITOR.tools.callFunction(154,event);" onkeydown="return CKEDITOR.tools.callFunction(153,event);" onblur="this.style.cssText = this.style.cssText;" aria-haspopup="false" aria-labelledby="cke_58_label" role="button" hidefocus="true" tabindex="-1" title="居中" class="cke_button cke_button__justifycenter  cke_button_off" id="cke_58"><span style="background-image:url(http://app.focussend.com/focussend/NewCkeditor/plugins/icons.png?t=E1PE);background-position:0 -1104px;background-size:auto;" class="cke_button_icon cke_button__justifycenter_icon">&nbsp;</span><span aria-hidden="false" class="cke_button_label cke_button__justifycenter_label" id="cke_58_label">居中</span></a><a onclick="CKEDITOR.tools.callFunction(160,this);return false;" onmousedown="return CKEDITOR.tools.callFunction(159,event);" onfocus="return CKEDITOR.tools.callFunction(158,event);" onkeydown="return CKEDITOR.tools.callFunction(157,event);" onblur="this.style.cssText = this.style.cssText;" aria-haspopup="false" aria-labelledby="cke_59_label" role="button" hidefocus="true" tabindex="-1" title="右对齐" class="cke_button cke_button__justifyright  cke_button_off" id="cke_59"><span style="background-image:url(http://app.focussend.com/focussend/NewCkeditor/plugins/icons.png?t=E1PE);background-position:0 -1152px;background-size:auto;" class="cke_button_icon cke_button__justifyright_icon">&nbsp;</span><span aria-hidden="false" class="cke_button_label cke_button__justifyright_label" id="cke_59_label">右对齐</span></a><a onclick="CKEDITOR.tools.callFunction(164,this);return false;" onmousedown="return CKEDITOR.tools.callFunction(163,event);" onfocus="return CKEDITOR.tools.callFunction(162,event);" onkeydown="return CKEDITOR.tools.callFunction(161,event);" onblur="this.style.cssText = this.style.cssText;" aria-haspopup="false" aria-labelledby="cke_60_label" role="button" hidefocus="true" tabindex="-1" title="两端对齐" class="cke_button cke_button__justifyblock  cke_button_off" id="cke_60"><span style="background-image:url(http://app.focussend.com/focussend/NewCkeditor/plugins/icons.png?t=E1PE);background-position:0 -1080px;background-size:auto;" class="cke_button_icon cke_button__justifyblock_icon">&nbsp;</span><span aria-hidden="false" class="cke_button_label cke_button__justifyblock_label" id="cke_60_label">两端对齐</span></a><span role="separator" class="cke_toolbar_separator"></span><a onclick="CKEDITOR.tools.callFunction(168,this);return false;" onmousedown="return CKEDITOR.tools.callFunction(167,event);" onfocus="return CKEDITOR.tools.callFunction(166,event);" onkeydown="return CKEDITOR.tools.callFunction(165,event);" onblur="this.style.cssText = this.style.cssText;" aria-haspopup="false" aria-labelledby="cke_61_label" role="button" hidefocus="true" tabindex="-1" title="文字方向为从左至右" class="cke_button cke_button__bidiltr  cke_button_off" id="cke_61"><span style="background-image:url(http://app.focussend.com/focussend/NewCkeditor/plugins/icons.png?t=E1PE);background-position:0 -168px;background-size:auto;" class="cke_button_icon cke_button__bidiltr_icon">&nbsp;</span><span aria-hidden="false" class="cke_button_label cke_button__bidiltr_label" id="cke_61_label">文字方向为从左至右</span></a><a onclick="CKEDITOR.tools.callFunction(172,this);return false;" onmousedown="return CKEDITOR.tools.callFunction(171,event);" onfocus="return CKEDITOR.tools.callFunction(170,event);" onkeydown="return CKEDITOR.tools.callFunction(169,event);" onblur="this.style.cssText = this.style.cssText;" aria-haspopup="false" aria-labelledby="cke_62_label" role="button" hidefocus="true" tabindex="-1" title="文字方向为从右至左" class="cke_button cke_button__bidirtl  cke_button_off" id="cke_62"><span style="background-image:url(http://app.focussend.com/focussend/NewCkeditor/plugins/icons.png?t=E1PE);background-position:0 -192px;background-size:auto;" class="cke_button_icon cke_button__bidirtl_icon">&nbsp;</span><span aria-hidden="false" class="cke_button_label cke_button__bidirtl_label" id="cke_62_label">文字方向为从右至左</span></a></span><span class="cke_toolbar_end"></span></span><span role="toolbar" aria-labelledby="cke_63_label" class="cke_toolbar" id="cke_63"><span class="cke_voice_label" id="cke_63_label">链接</span><span class="cke_toolbar_start"></span><span role="presentation" class="cke_toolgroup"><a onclick="CKEDITOR.tools.callFunction(176,this);return false;" onmousedown="return CKEDITOR.tools.callFunction(175,event);" onfocus="return CKEDITOR.tools.callFunction(174,event);" onkeydown="return CKEDITOR.tools.callFunction(173,event);" onblur="this.style.cssText = this.style.cssText;" aria-haspopup="false" aria-labelledby="cke_64_label" role="button" hidefocus="true" tabindex="-1" title="插入/编辑超链接" class="cke_button cke_button__link  cke_button_off" id="cke_64"><span style="background-image:url(http://app.focussend.com/focussend/NewCkeditor/plugins/icons.png?t=E1PE);background-position:0 -1248px;background-size:auto;" class="cke_button_icon cke_button__link_icon">&nbsp;</span><span aria-hidden="false" class="cke_button_label cke_button__link_label" id="cke_64_label">插入/编辑超链接</span></a><a onclick="CKEDITOR.tools.callFunction(180,this);return false;" onmousedown="return CKEDITOR.tools.callFunction(179,event);" onfocus="return CKEDITOR.tools.callFunction(178,event);" onkeydown="return CKEDITOR.tools.callFunction(177,event);" onblur="this.style.cssText = this.style.cssText;" aria-disabled="true" aria-haspopup="false" aria-labelledby="cke_65_label" role="button" hidefocus="true" tabindex="-1" title="取消超链接" class="cke_button cke_button__unlink cke_button_disabled " id="cke_65"><span style="background-image:url(http://app.focussend.com/focussend/NewCkeditor/plugins/icons.png?t=E1PE);background-position:0 -1272px;background-size:auto;" class="cke_button_icon cke_button__unlink_icon">&nbsp;</span><span aria-hidden="false" class="cke_button_label cke_button__unlink_label" id="cke_65_label">取消超链接</span></a><a onclick="CKEDITOR.tools.callFunction(184,this);return false;" onmousedown="return CKEDITOR.tools.callFunction(183,event);" onfocus="return CKEDITOR.tools.callFunction(182,event);" onkeydown="return CKEDITOR.tools.callFunction(181,event);" onblur="this.style.cssText = this.style.cssText;" aria-haspopup="false" aria-labelledby="cke_66_label" role="button" hidefocus="true" tabindex="-1" title="插入/编辑锚点链接" class="cke_button cke_button__anchor  cke_button_off" id="cke_66"><span style="background-image:url(http://app.focussend.com/focussend/NewCkeditor/plugins/icons.png?t=E1PE);background-position:0 -1224px;background-size:auto;" class="cke_button_icon cke_button__anchor_icon">&nbsp;</span><span aria-hidden="false" class="cke_button_label cke_button__anchor_label" id="cke_66_label">插入/编辑锚点链接</span></a></span><span class="cke_toolbar_end"></span></span><span role="toolbar" aria-labelledby="cke_67_label" class="cke_toolbar" id="cke_67"><span class="cke_voice_label" id="cke_67_label">插入</span><span class="cke_toolbar_start"></span><span role="presentation" class="cke_toolgroup"><a onclick="CKEDITOR.tools.callFunction(188,this);return false;" onmousedown="return CKEDITOR.tools.callFunction(187,event);" onfocus="return CKEDITOR.tools.callFunction(186,event);" onkeydown="return CKEDITOR.tools.callFunction(185,event);" onblur="this.style.cssText = this.style.cssText;" aria-haspopup="false" aria-labelledby="cke_68_label" role="button" hidefocus="true" tabindex="-1" title="图像" class="cke_button cke_button__image  cke_button_off" id="cke_68"><span style="background-image:url(http://app.focussend.com/focussend/NewCkeditor/plugins/icons.png?t=E1PE);background-position:0 -936px;background-size:auto;" class="cke_button_icon cke_button__image_icon">&nbsp;</span><span aria-hidden="false" class="cke_button_label cke_button__image_label" id="cke_68_label">图像</span></a><a onclick="CKEDITOR.tools.callFunction(192,this);return false;" onmousedown="return CKEDITOR.tools.callFunction(191,event);" onfocus="return CKEDITOR.tools.callFunction(190,event);" onkeydown="return CKEDITOR.tools.callFunction(189,event);" onblur="this.style.cssText = this.style.cssText;" aria-haspopup="false" aria-labelledby="cke_69_label" role="button" hidefocus="true" tabindex="-1" title="表格" class="cke_button cke_button__table  cke_button_off" id="cke_69"><span style="background-image:url(http://app.focussend.com/focussend/NewCkeditor/plugins/icons.png?t=E1PE);background-position:0 -1896px;background-size:auto;" class="cke_button_icon cke_button__table_icon">&nbsp;</span><span aria-hidden="false" class="cke_button_label cke_button__table_label" id="cke_69_label">表格</span></a><a onclick="CKEDITOR.tools.callFunction(196,this);return false;" onmousedown="return CKEDITOR.tools.callFunction(195,event);" onfocus="return CKEDITOR.tools.callFunction(194,event);" onkeydown="return CKEDITOR.tools.callFunction(193,event);" onblur="this.style.cssText = this.style.cssText;" aria-haspopup="false" aria-labelledby="cke_70_label" role="button" hidefocus="true" tabindex="-1" title="插入水平线" class="cke_button cke_button__horizontalrule  cke_button_off" id="cke_70"><span style="background-image:url(http://app.focussend.com/focussend/NewCkeditor/plugins/icons.png?t=E1PE);background-position:0 -888px;background-size:auto;" class="cke_button_icon cke_button__horizontalrule_icon">&nbsp;</span><span aria-hidden="false" class="cke_button_label cke_button__horizontalrule_label" id="cke_70_label">插入水平线</span></a><a onclick="CKEDITOR.tools.callFunction(200,this);return false;" onmousedown="return CKEDITOR.tools.callFunction(199,event);" onfocus="return CKEDITOR.tools.callFunction(198,event);" onkeydown="return CKEDITOR.tools.callFunction(197,event);" onblur="this.style.cssText = this.style.cssText;" aria-haspopup="false" aria-labelledby="cke_71_label" role="button" hidefocus="true" tabindex="-1" title="表情符" class="cke_button cke_button__smiley  cke_button_off" id="cke_71"><span style="background-image:url(http://app.focussend.com/focussend/NewCkeditor/plugins/icons.png?t=E1PE);background-position:0 -1056px;background-size:auto;" class="cke_button_icon cke_button__smiley_icon">&nbsp;</span><span aria-hidden="false" class="cke_button_label cke_button__smiley_label" id="cke_71_label">表情符</span></a><a onclick="CKEDITOR.tools.callFunction(204,this);return false;" onmousedown="return CKEDITOR.tools.callFunction(203,event);" onfocus="return CKEDITOR.tools.callFunction(202,event);" onkeydown="return CKEDITOR.tools.callFunction(201,event);" onblur="this.style.cssText = this.style.cssText;" aria-haspopup="false" aria-labelledby="cke_72_label" role="button" hidefocus="true" tabindex="-1" title="插入特殊符号" class="cke_button cke_button__specialchar  cke_button_off" id="cke_72"><span style="background-image:url(http://app.focussend.com/focussend/NewCkeditor/plugins/icons.png?t=E1PE);background-position:0 -1848px;background-size:auto;" class="cke_button_icon cke_button__specialchar_icon">&nbsp;</span><span aria-hidden="false" class="cke_button_label cke_button__specialchar_label" id="cke_72_label">插入特殊符号</span></a><a onclick="CKEDITOR.tools.callFunction(208,this);return false;" onmousedown="return CKEDITOR.tools.callFunction(207,event);" onfocus="return CKEDITOR.tools.callFunction(206,event);" onkeydown="return CKEDITOR.tools.callFunction(205,event);" onblur="this.style.cssText = this.style.cssText;" aria-haspopup="false" aria-labelledby="cke_73_label" role="button" hidefocus="true" tabindex="-1" title="插入打印分页符" class="cke_button cke_button__pagebreak  cke_button_off" id="cke_73"><span style="background-image:url(http://app.focussend.com/focussend/NewCkeditor/plugins/icons.png?t=E1PE);background-position:0 -1488px;background-size:auto;" class="cke_button_icon cke_button__pagebreak_icon">&nbsp;</span><span aria-hidden="false" class="cke_button_label cke_button__pagebreak_label" id="cke_73_label">插入打印分页符</span></a></span><span class="cke_toolbar_end"></span></span><span class="cke_toolbar_break"></span><span role="toolbar" aria-labelledby="cke_74_label" class="cke_toolbar" id="cke_74"><span class="cke_voice_label" id="cke_74_label">样式</span><span class="cke_toolbar_start"></span><span role="presentation" class="cke_combo cke_combo__styles  cke_combo_off" id="cke_10"><span class="cke_combo_label" id="cke_10_label">样式</span><a onclick="CKEDITOR.tools.callFunction(209,this);return false;" onfocus="return CKEDITOR.tools.callFunction(211,event);" onmousedown="return CKEDITOR.tools.callFunction(212,event);" onkeydown="return CKEDITOR.tools.callFunction(210,event,this);" onblur="this.style.cssText = this.style.cssText;" aria-haspopup="true" aria-labelledby="cke_10_label" role="button" tabindex="-1" title="样式" hidefocus="true" class="cke_combo_button"><span class="cke_combo_text cke_combo_inlinelabel" id="cke_10_text">样式</span><span class="cke_combo_open"><span class="cke_combo_arrow"></span></span></a></span><span role="presentation" class="cke_combo cke_combo__format  cke_combo_off" id="cke_11"><span class="cke_combo_label" id="cke_11_label">格式</span><a onclick="CKEDITOR.tools.callFunction(213,this);return false;" onfocus="return CKEDITOR.tools.callFunction(215,event);" onmousedown="return CKEDITOR.tools.callFunction(216,event);" onkeydown="return CKEDITOR.tools.callFunction(214,event,this);" onblur="this.style.cssText = this.style.cssText;" aria-haspopup="true" aria-labelledby="cke_11_label" role="button" tabindex="-1" title="格式" hidefocus="true" class="cke_combo_button"><span class="cke_combo_text cke_combo_inlinelabel" id="cke_11_text">格式</span><span class="cke_combo_open"><span class="cke_combo_arrow"></span></span></a></span><span role="presentation" class="cke_combo cke_combo__font  cke_combo_off" id="cke_12"><span class="cke_combo_label" id="cke_12_label">字体</span><a onclick="CKEDITOR.tools.callFunction(217,this);return false;" onfocus="return CKEDITOR.tools.callFunction(219,event);" onmousedown="return CKEDITOR.tools.callFunction(220,event);" onkeydown="return CKEDITOR.tools.callFunction(218,event,this);" onblur="this.style.cssText = this.style.cssText;" aria-haspopup="true" aria-labelledby="cke_12_label" role="button" tabindex="-1" title="字体" hidefocus="true" class="cke_combo_button"><span class="cke_combo_text cke_combo_inlinelabel" id="cke_12_text">字体</span><span class="cke_combo_open"><span class="cke_combo_arrow"></span></span></a></span><span role="presentation" class="cke_combo cke_combo__fontsize  cke_combo_off" id="cke_13"><span class="cke_combo_label" id="cke_13_label">大小</span><a onclick="CKEDITOR.tools.callFunction(221,this);return false;" onfocus="return CKEDITOR.tools.callFunction(223,event);" onmousedown="return CKEDITOR.tools.callFunction(224,event);" onkeydown="return CKEDITOR.tools.callFunction(222,event,this);" onblur="this.style.cssText = this.style.cssText;" aria-haspopup="true" aria-labelledby="cke_13_label" role="button" tabindex="-1" title="大小" hidefocus="true" class="cke_combo_button"><span class="cke_combo_text cke_combo_inlinelabel" id="cke_13_text">大小</span><span class="cke_combo_open"><span class="cke_combo_arrow"></span></span></a></span><span class="cke_toolbar_end"></span></span><span role="toolbar" aria-labelledby="cke_75_label" class="cke_toolbar" id="cke_75"><span class="cke_voice_label" id="cke_75_label">颜色</span><span class="cke_toolbar_start"></span><span role="presentation" class="cke_toolgroup"><a onclick="CKEDITOR.tools.callFunction(228,this);return false;" onmousedown="return CKEDITOR.tools.callFunction(227,event);" onfocus="return CKEDITOR.tools.callFunction(226,event);" onkeydown="return CKEDITOR.tools.callFunction(225,event);" onblur="this.style.cssText = this.style.cssText;" aria-haspopup="true" aria-labelledby="cke_76_label" role="button" hidefocus="true" tabindex="-1" title="文本颜色" class="cke_button cke_button__textcolor cke_button_off " id="cke_76"><span style="background-image:url(http://app.focussend.com/focussend/NewCkeditor/plugins/icons.png?t=E1PE);background-position:0 -408px;background-size:auto;" class="cke_button_icon cke_button__textcolor_icon">&nbsp;</span><span aria-hidden="false" class="cke_button_label cke_button__textcolor_label" id="cke_76_label">文本颜色</span><span class="cke_button_arrow"></span></a><a onclick="CKEDITOR.tools.callFunction(232,this);return false;" onmousedown="return CKEDITOR.tools.callFunction(231,event);" onfocus="return CKEDITOR.tools.callFunction(230,event);" onkeydown="return CKEDITOR.tools.callFunction(229,event);" onblur="this.style.cssText = this.style.cssText;" aria-haspopup="true" aria-labelledby="cke_77_label" role="button" hidefocus="true" tabindex="-1" title="背景颜色" class="cke_button cke_button__bgcolor cke_button_off " id="cke_77"><span style="background-image:url(http://app.focussend.com/focussend/NewCkeditor/plugins/icons.png?t=E1PE);background-position:0 -384px;background-size:auto;" class="cke_button_icon cke_button__bgcolor_icon">&nbsp;</span><span aria-hidden="false" class="cke_button_label cke_button__bgcolor_label" id="cke_77_label">背景颜色</span><span class="cke_button_arrow"></span></a></span><span class="cke_toolbar_end"></span></span><span role="toolbar" aria-labelledby="cke_78_label" class="cke_toolbar" id="cke_78"><span class="cke_voice_label" id="cke_78_label">工具</span><span class="cke_toolbar_start"></span><span role="presentation" class="cke_toolgroup"><a onclick="CKEDITOR.tools.callFunction(236,this);return false;" onmousedown="return CKEDITOR.tools.callFunction(235,event);" onfocus="return CKEDITOR.tools.callFunction(234,event);" onkeydown="return CKEDITOR.tools.callFunction(233,event);" onblur="this.style.cssText = this.style.cssText;" aria-haspopup="false" aria-labelledby="cke_79_label" role="button" hidefocus="true" tabindex="-1" title="全屏" class="cke_button cke_button__maximize  cke_button_off" id="cke_79"><span style="background-image:url(http://app.focussend.com/focussend/NewCkeditor/plugins/icons.png?t=E1PE);background-position:0 -1392px;background-size:auto;" class="cke_button_icon cke_button__maximize_icon">&nbsp;</span><span aria-hidden="false" class="cke_button_label cke_button__maximize_label" id="cke_79_label">全屏</span></a><a onclick="CKEDITOR.tools.callFunction(240,this);return false;" onmousedown="return CKEDITOR.tools.callFunction(239,event);" onfocus="return CKEDITOR.tools.callFunction(238,event);" onkeydown="return CKEDITOR.tools.callFunction(237,event);" onblur="this.style.cssText = this.style.cssText;" aria-haspopup="false" aria-labelledby="cke_80_label" role="button" hidefocus="true" tabindex="-1" title="显示区块" class="cke_button cke_button__showblocks  cke_button_off" id="cke_80"><span style="background-image:url(http://app.focussend.com/focussend/NewCkeditor/plugins/icons.png?t=E1PE);background-position:0 -1776px;background-size:auto;" class="cke_button_icon cke_button__showblocks_icon">&nbsp;</span><span aria-hidden="false" class="cke_button_label cke_button__showblocks_label" id="cke_80_label">显示区块</span></a></span><span class="cke_toolbar_end"></span></span></span></span><div role="presentation" class="cke_contents cke_reset" id="cke_1_contents" style="height: 500px;"><span class="cke_voice_label" id="cke_85">按 ALT+0 获得帮助</span><iframe frameborder="0" src="" style="width: 100%; height: 100%;" class="cke_wysiwyg_frame cke_reset" title="所见即所得编辑器, ctl00_ContentPlaceHolder1_divCkeditorBody" aria-describedby="cke_85" tabindex="0" allowtransparency="true"></iframe></div><span role="presentation" class="cke_bottom cke_reset_all" id="cke_1_bottom" style="-moz-user-select: none;"><span class="cke_voice_label" id="cke_1_path_label">元素路径</span><span aria-labelledby="cke_1_path_label" role="group" class="cke_path" id="cke_1_path"><span class="cke_path_empty">&nbsp;</span></span></span></div></div>
                            </div>
                            <div style="display: none;" id="divTextBody">
                                <textarea style="width:100%;" id="ctl00_ContentPlaceHolder1_txtBody" cols="20" rows="30" name="ctl00$ContentPlaceHolder1$txtBody"></textarea>
                            </div>
                        </td>
                    </tr>
                    </tbody></table>
            </div>
        </td>
    </tr>
    </tbody></table>
<div style="width: 100%;" class="send_ku_box1">
    <b class="send_ku"><b class="send_ku1"><b></b></b><b class="send_ku2"><b></b></b><b class="send_ku3"></b><b class="send_ku4"></b><b class="send_ku5"></b></b>
    <div class="send_ku_content">
        <table cellspacing="0" cellpadding="0" border="0" id="tblSpam">
            <tbody><tr>
                <td class="save_p2">
                    <div align="left">
                        <input type="checkbox" style="margin-left: 5px;" id="ctl00_ContentPlaceHolder1_cbxNotSpam" name="ctl00$ContentPlaceHolder1$cbxNotSpam"><font style="font-size: 14px;">我保证不是垃圾邮件</font>
                    </div>
                </td>
            </tr>
            </tbody></table>
    </div>
    <b class="send_ku"><b class="send_ku5"></b><b class="send_ku4"></b><b class="send_ku3">
    </b><b class="send_ku2"><b></b></b><b class="send_ku1"><b></b></b></b>
</div>
<div style="width: 100%; margin-bottom: 10px; display: none;" class="send_note_box1">
    <b class="send_note"><b class="send_note1"><b></b></b><b class="send_note2"><b></b></b>
        <b class="send_note3"></b><b class="send_note4"></b><b class="send_note5"></b>
    </b>
    <div class="send_note_content">
        <table cellspacing="0" cellpadding="0" border="0">
            <tbody><tr>
                <td style="padding-bottom: 5px;" class="save_p6">
                    <a href="#">
                        <img align="absmiddle" src="/static/images/attach.gif">添加附件</a>
                </td>
            </tr>
            <tr>
                <td class="save_p6">
                    <img align="absmiddle" src="/static/images/attach1.gif">focussend.gif <a style="font-size: 12px;" href="#">
                    删除</a>
                </td>
            </tr>
            <tr>
                <td class="save_p6">
                    <img align="absmiddle" src="/static/images/attach2.gif">eBay.jpg <a style="font-size: 12px;" href="#">
                    删除</a>
                </td>
            </tr>
            <tr>
                <td class="save_p6">
                    <img align="absmiddle" src="/static/images/attach3.gif">eBay.jpg <font style="color: #f00;">
                    上传失败</font> <a style="font-size: 12px;" href="#">重新添加</a>
                </td>
            </tr>
            <tr>
                <td class="save_p6">
                    <img align="absmiddle" src="/static/images/attach4.gif">eBay.jpg <font style="color: #90c600;">
                    正在上传...</font> <a style="font-size: 12px;" href="#">取消</a>
                </td>
            </tr>
            <tr>
                <td style="padding-top: 5px;" class="save_p6">
                    <font style="color: #4e4e4e;">上传总进度：
                        <img align="absmiddle" style="border: solid 1px #ccc; padding: 1px;" src="/static/images/jidut.gif">
                        100%&nbsp;&nbsp;&nbsp;已上传116.76K，总文件大小116.76K </font>
                </td>
            </tr>
            </tbody></table>
    </div>
    <b class="send_note"><b class="send_note5"></b><b class="send_note4"></b><b class="send_note3">
    </b><b class="send_note2"><b></b></b><b class="send_note1"><b></b></b></b>
</div>
<div style="width: 100%; margin-bottom: 10px; display: none;" class="send_note_box1">
    <b class="send_note"><b class="send_note1"><b></b></b><b class="send_note2"><b></b></b>
        <b class="send_note3"></b><b class="send_note4"></b><b class="send_note5"></b>
    </b>
    <div class="send_note_content">
        <table cellspacing="0" cellpadding="0" border="0">
            <tbody><tr>
                <td style="padding-bottom: 5px;" class="save_p6">
                    <a href="#">
                        <img align="absmiddle" src="/static/images/ceshi.gif">测试</a>
                </td>
            </tr>
            </tbody></table>
    </div>
    <b class="send_note"><b class="send_note5"></b><b class="send_note4"></b><b class="send_note3">
    </b><b class="send_note2"><b></b></b><b class="send_note1"><b></b></b></b>
</div>
</div>
<b class="send_tan"><b class="send_tan5"></b><b class="send_tan4"></b><b class="send_tan3">
</b><b class="send_tan2"><b></b></b><b class="send_tan11"><b></b></b></b>
<div style="width: 100%; margin-bottom: 10px;" class="send_note_box1">
    <b class="send_note"><b class="send_note1"><b></b></b><b class="send_note2"><b></b></b>
        <b class="send_note3"></b><b class="send_note4"></b><b class="send_note5"></b>
    </b>
    <div class="send_note_content">
        <table cellspacing="0" cellpadding="0" width="100%" border="0">
            <tbody><tr>
                <td style="padding-bottom: 5px;" class="save_p6">
                    <a id="fileUpDisplay" href="javaScript:void(0)">
                        <img align="absmiddle" src="/static/images/attach.gif">添加附件</a><span id="tishi"></span>
                </td>
            </tr>
            <tr style="display: none" id="ctl00_ContentPlaceHolder1_fileContent">
                <td>
                    <div style="padding-left: 10px; padding-top: 8px; float: left; width: 88%; text-align: left;">
                        <div>
                            <div id="ctl00_ContentPlaceHolder1_uplSending">

                                <table cellspacing="0" cellpadding="0" width="100%" border="0" id="TabFileNum">

                                </table>

                            </div>
                        </div>

                        <label style="display: none;" id="ctl00_ContentPlaceHolder1_overfile">
                        </label>
                        <div class="subgroup_file" style="padding-bottom: 5px; width: 100%;" id="files">

                            <input type="file" onchange="change()" id="ctl00_ContentPlaceHolder1_FileUpload1" name="ctl00$ContentPlaceHolder1$FileUpload1">
                        </div>
                        <div style="width: 80%">
                            <input type="submit" style="float: left" id="ctl00_ContentPlaceHolder1_beginUpload" value="开始上传" name="ctl00$ContentPlaceHolder1$beginUpload">
                            <input type="button" value="继续添加" style="display: none; float: left; padding-left: 5px" id="ctl00_ContentPlaceHolder1_addFile" name="ctl00$ContentPlaceHolder1$addFile">
                        </div>
                    </div>
                </td>
            </tr>

            </tbody></table>
    </div>
    <b class="send_note"><b class="send_note5"></b><b class="send_note4"></b><b class="send_note3">
    </b><b class="send_note2"><b></b></b><b class="send_note1"><b></b></b></b>
</div>
</div>
<table cellspacing="0" cellpadding="0" width="100%" border="0">
    <tbody><tr>
        <td style="padding: 0" class="back">
            <a id="ctl00_ContentPlaceHolder1_aBack" href="http://app.focussend.com/focussend/Email/Template.aspx">
                <img align="absmiddle" src="/static/images/left.gif">返回上一步</a>
        </td>
        <td>
            <ul style="padding: 0px;" class="button">
                <li>
                    <a href="javascript:__doPostBack('ctl00$ContentPlaceHolder1$btnContinue','')" class="btn_next" id="ctl00_ContentPlaceHolder1_btnContinue"></a></li>
            </ul>
            <input type="hidden" value="40,{{{Email}}},{{{FullName}}},{{{Company}}},{{{City}}},{{{Phone}}},{{{Reserved1}}},{{{Reserved2}}},{{{Reserved3}}}" id="ctl00_ContentPlaceHolder1_HdMaxCount" name="ctl00$ContentPlaceHolder1$HdMaxCount">
        </td>
    </tr>
    </tbody></table>
</div>
</div>
<div class="clear">
</div>
</div>
</@layout.standard>