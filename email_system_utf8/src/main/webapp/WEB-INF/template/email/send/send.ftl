<#import "/include/admin_layout.ftl" as layout />
<@layout.standard "发送任务" 4>
<link rel="stylesheet" type="text/css" href="/static/css/common.css" media="all" />
<script type="text/javascript" src="/static/js/component.sbsAjax.js"></script>
<script type="text/javascript" src="/static/js/json2.js"></script>
<script type="text/javascript" src="/static/js/App.calendar.js"></script>

<script type="text/javascript">
    var c=function()
        {
            var checked=$(this).attr("checked");
            $("#ctl00_ContentPlaceHolder1_ulMsg").hide();
            var result=$("#ctl00_ContentPlaceHolder1_hiGroupString").val();
            $("input",$("#tblTo")).each(
            function()
            {
                var value=$(this).val();
                result+=value+",";
                $(this).attr("checked",checked);
            });
            if(checked)
            {
              $("#ctl00_ContentPlaceHolder1_hiGroupString").val(result);
            }
            else
            {
              $("#ctl00_ContentPlaceHolder1_hiGroupString").val("");
            }
        };

        var d=function()
        {
            var choosedGroup=false;
            $("#tblTo input").each(
            function()
            {
                if(this.checked)
                    choosedGroup=true;
            }
            );

            if(!choosedGroup)
            {
                $("#ctl00_ContentPlaceHolder1_ulMsg").attr({innerHTML:""});
                $("#ctl00_ContentPlaceHolder1_ulMsg").append("你必须要选择一个联系组!");
                return false;
            }
            return true;

        }

    $(function()
    {
       $("#ctl00_ContentPlaceHolder1_cbxEveryone").click(c);
    }
    );

    function reBind()
    {
        $("#ctl00_ContentPlaceHolder1_cbxEveryone").click(c);
    }

     isNumber = function (e) {
        if ($.browser.msie) {
            if ( ((event.keyCode > 47) && (event.keyCode < 58)) || (event.keyCode == 8) ) {
                return true;
            } else {
               alert('请输入数字！');
                return false;
            }
        } else {
            if ( ((e.which > 47) && (e.which < 58)) || (e.which == 8) ) {
                return true;
            } else {
                alert('请输入数字！');
                return false;
            }
        }
    }

   function checkEmail(a){
       var s = document.getElementById("Div1").getElementsByTagName("INPUT");
       for(var i=0;i<s.length;i++)
       {
          s[i].checked=false;
       }
       a.checked=true;
   }

   function toArray()
   {
       var myArray=new Array(arguments.length);
       for(i=0;i<arguments.length;i++)
       {
           myArray[i]=arguments[i];
       }
       return myArray;
   }

   function setFilterChanged()
   {
       if(filterSelect.selectedIndex!=currentIndex)
       {
           filterDescriptionSpan.innerHTML=descriptionArray[filterSelect.selectedIndex];
           currentIndex=filterSelect.selectedIndex;
       }
       setTimeout("setFilterChanged()",100);
   }

   function umEmbargo()
   {
       $("#kemu").show();
   }

   var isShow= $("#ctl00_ContentPlaceHolder1_DpdUserDomain").css("display")!="none";

   function judgeIsEmpty(send_type){
         var taskName=$("#ctl00_ContentPlaceHolder1_taskName").val();
         var sentName=$("#ctl00_ContentPlaceHolder1_SendName").val();
         var sentEmail=$("#ctl00_ContentPlaceHolder1_sendEmail").val();
         var subject=$("#ctl00_ContentPlaceHolder1_txtSubject").val();
         var resultGroupStr=$("#ctl00_ContentPlaceHolder1_hiGroupString").val();

         var userId=$("#ctl00_ContentPlaceHolder1_hiUserId").val();
         var filterId=$("#ctl00_ContentPlaceHolder1_filterDropD").val();
         var Edm=$("#Div1 input:checkbox:checked");
         var sendDate = "";
         if (send_type==1){
            sendDate = $("#calendar_fix_time").val();
            if ($.trim(sendDate) == "") {
               alert("请选择定时发送时间！");
               return false;
            }
         }

         var tpl_id = $("#Div1 input:checkbox:checked").val();
         var resultGroupStr="";
         var count = 0;
         $("#tblTo input:checkbox:checked").each(function(){
            var $this=$(this);
            resultGroupStr=resultGroupStr+","+$this.val();
            count = count + Number($this.attr("count"));
         })
         if (resultGroupStr != "") resultGroupStr = resultGroupStr.substring(1);

         if(Edm.length==0)
         {
           alert("请选择需要发送的邮件模版！");
           return false;
         }

         if($.trim(taskName)=="")
         {
          alert("任务名称输入不能为空！");
          $("#ctl00_ContentPlaceHolder1_taskName").focus();
          return false;
         }
         if($.trim(sentName)=="")
         {
          alert("发件人名称不能为空！");
          $("#ctl00_ContentPlaceHolder1_SendName").focus();
          return false;
         }

         /*
         if($.trim(sentEmail)=="")
         {
           alert("发件人邮箱不能为空！");
           $("#ctl00_ContentPlaceHolder1_sendEmail").focus();
           return false;
         }

         //checkEmail();
         sendEmailAll = sentEmail;

        if(!sendEmailAll.match(/[\w-\.&]+@[\w-\.]+?/i )){
          alert("您输入的电子邮箱地址格式不正确");
          $("#ctl00_ContentPlaceHolder1_sendEmail").focus();
             return false;
        }
        var sReg = /^[a-zA-Z_\d\-\.&]+@[a-zA-Z_\d\-]+(\.[_a-zA-Z\d\-]+)+$/;
        if(!sReg.test(sendEmailAll)) {
            alert("您输入的电子邮箱地址格式不正确");
             $("#ctl00_ContentPlaceHolder1_sendEmail").focus();
             return false;
        }
        */
        var reg=new RegExp("^[a-z0-9A-Z-_.]+?@[a-z0-9A-Z-_.]+$");
        var revertEmail=$("#ctl00_ContentPlaceHolder1_RevertEmail").val().replace(/(^\s*)|(\s*$)/g , '');
        if ($.trim(revertEmail)!=""){
              if(!reg.test(revertEmail))
              {
                   $("#ctl00_ContentPlaceHolder1_RevertEmail").focus();
                   alert('回复邮箱地址格式不正确！');
                   return false;
              }
        }

        var senderEmail=$("#ctl00_ContentPlaceHolder1_txtSenderEmail").val().replace(/(^\s*)|(\s*$)/g , '');
        if ($.trim(senderEmail)!=""){
              if(!reg.test(senderEmail))
              {
               $("#ctl00_ContentPlaceHolder1_txtSenderEmail").focus();
               alert('自动回复邮箱地址格式不正确！');
               return false;
              }
        }

        if($.trim(subject)==""){
          alert("邮件主题不能为空！");
          $("#ctl00_ContentPlaceHolder1_txtSubject").focus();
          return false;
        }
        if($.trim(resultGroupStr)=="")
        {
          alert("请选择联系组！");
          $("#ctl00_ContentPlaceHolder1_cbxEveryone").focus();
          return false;
        }
        var remain = ${currentUser.score} - count;
        if (remain < 0) {
            alert("积分不够");
            return;
        }
        if (confirm("本次发送将消耗"+count+"积分，发送后您的积分为："+remain)) {
            $.ajax({
                 type:'POST',
                 contentType: 'application/json',
                 url:'/email/addTask.html',
                 data:JSON.stringify({"groupIds":resultGroupStr,"tplId":tpl_id,"subject":subject,"sendDateStr":sendDate,"name":taskName,"sendName":sentName,"sendEmail":sentEmail,"replyEmail":revertEmail}),
                 success:function(res){
                    var resObj = JSON.parse(res);
                    if (resObj.success){
                        window.location.href="/email/taskList.html"
                    } else{
                        if (resObj.code == 1)
                            alert("积分不够");
                        else
                            alert("发送任务创建失败");
                    }
                 },
                 error:function(){
                    alert("发送任务创建失败");
                 }
            });
        }
   }

</script>

<div id="container">
    <br/>
    <input type="hidden" value="0" id="hidChooseGroupId">

	<div class="send_body1">
		    <div style="margin:0px 25px;">
			<div class="send_tan_box"> <b class="send_tan"> <b class="send_tan1"><b></b></b> <b class="send_tan2"><b></b></b> <b class="send_tan3"></b> <b class="send_tan4"></b> <b class="send_tan5"></b> </b>
				<div class="send_tan_content"><div style="display:none;" class="wrong" id="ctl00_ContentPlaceHolder1_ulMsg"></div>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tbody><tr>
							<td class="send_from" colspan="2">发件人<input type="hidden" value="11941" id="ctl00_ContentPlaceHolder1_hiUserId" name="ctl00$ContentPlaceHolder1$hiUserId"></td>
						</tr>
						<tr>
							<td width="30%" class="send_from1 border4">任务名称<font style="color:#f00;">*</font></td>
							<td class="send_from2 border4"><input type="text" style="width:40%" class="input_text" id="ctl00_ContentPlaceHolder1_taskName" name="ctl00$ContentPlaceHolder1$taskName"><span style="color:Red;" id="taskNameInfo"></span></td>
						</tr>
						<tr>
							<td class="send_from1 border4">发件人名称<font style="color:#f00;">*</font></td>
							<td class="send_from2 border4"><input type="text" value="" style="width:40%" class="input_text" id="ctl00_ContentPlaceHolder1_SendName" name="ctl00$ContentPlaceHolder1$SendName"></td>
						</tr>
						<tr>
							<td class="send_from1">发件人邮箱<font style="color:#f00;">*</font></td>
							<td class="send_from2">

							            <input type="text" class="input_text"  style="width:40%" id="ctl00_ContentPlaceHolder1_sendEmail" value="" name="ctl00$ContentPlaceHolder1$sendEmail"></td>
							            <!--td style="display:block;" id="ctl00_ContentPlaceHolder1_showDomain"><select style="height:22px;" id="ctl00_ContentPlaceHolder1_DpdUserDomain" name="ctl00$ContentPlaceHolder1$DpdUserDomain">
                                            <option value="@fashionglassesshopping.com">@fashionglassesshopping.com</option>
                                            <option value="@louisvuittonneed.com">@louisvuittonneed.com</option>
                                            <option value="@trustmta.com" selected="selected">@trustmta.com</option>

                                        </select></td-->



							</td>
						</tr>
						<tr>
							<td class="border4">&nbsp;</td>
							<!--td class="send_from7 border4">
							        为了保证发送效果,我们强烈建议您使用自己的域名进行发送，使用前，<br>请确保发件人域名已
                                     <a target="_blank" href="http://app.focussend.com/focussend/spf.html">对我们的域名做spf解析</a>,解析生效后，您可以通知客服为<br>
                                     您添加或者<a target="_blank" href="../SysDomainSet.aspx">自行设置</a>
                            </td-->
						</tr>
						<tr>
							<td class="send_from3">&nbsp;回复到</td>
							<td>&nbsp;</td>
						</tr>
					</tbody></table>
					<div style="width:100%;margin:0" id="ctl00_ContentPlaceHolder1_replyTbl">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tbody><tr style="display:none;">
                            <td width="30%" class="send_from1">
                                回复人名称<font>：</font>
                            </td>
                            <td width="70%" class="send_from2">
                                <input type="text" size="30" id="ctl00_ContentPlaceHolder1_RevertName" name="ctl00$ContentPlaceHolder1$RevertName">
                            </td>
                        </tr>
                        <tr>
                            <td width="30%" style="border: 0px;" class="send_from1">
                                回复人邮箱<font>：</font>
                            </td>
                            <td width="70%" style="border: 0px;" class="send_from2">
                                <input type="text" style="width:40%" class="input_text" id="ctl00_ContentPlaceHolder1_RevertEmail" name="ctl00$ContentPlaceHolder1$RevertEmail">
                            </td>
                        </tr>
                        <tr style="display:none;" id="ctl00_ContentPlaceHolder1_trAutoReply">
                            <td width="30%" style="border: 0px;" class="send_from1">
                                                                代发邮箱<font>：</font>
                                                            </td>
                            <td width="70%" style="border: 0px;" class="send_from2">
                                                                <input type="text" style="width:40%" class="input_text" id="ctl00_ContentPlaceHolder1_txtSenderEmail" name="ctl00$ContentPlaceHolder1$txtSenderEmail">
                                                            </td>
                        </tr>

                         </tbody></table>
                    </div>
				</div>
				<b class="send_tan"> <b class="send_tan5"></b> <b class="send_tan4"></b> <b class="send_tan3"></b> <b class="send_tan2"><b></b></b> <b class="send_tan11"><b></b></b> </b> </div>
		    </div>

		    <div style=" padding:0px 25px">
				<div class="send_tan_box"> <b class="send_tan"> <b class="send_tan1"><b></b></b> <b class="send_tan2"><b></b></b> <b class="send_tan3"></b> <b class="send_tan4"></b> <b class="send_tan5"></b> </b>
					<div class="send_tan_content">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tbody><tr>
								<td width="30%" class="send_from">邮件及收件人</td>
								<td width="70%"><input type="hidden" value="id=-1" id="ctl00_ContentPlaceHolder1_hfdid" name="ctl00$ContentPlaceHolder1$hfdid"></td>
							</tr>
						</tbody></table>
					    <div class="blue_box2"> <b class="blue"> <b class="blue1"><b></b></b> <b class="blue2"><b></b></b> <b class="blue3"></b> <b class="blue4"></b> <b class="blue5"></b> </b>

						<div class="blue_content">
							<div style="padding:0pt;" class="light_blue_box"> <b class="light_blue"> <b class="light_blue1"><b></b></b> <b class="light_blue2"><b></b></b> <b class="light_blue3"></b> <b class="light_blue4"></b> <b class="light_blue5"></b> </b>
								<div class="light_blue_content">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tbody><tr>
											<td class="send_from6"><img align="absmiddle" src="/static/images/database.gif">邮件模板 </td>
										</tr>
									</tbody></table>
								</div>
								<b class="light_blue"> <b class="light_blue5"><b></b></b> <b class="light_blue4"><b></b></b> <b class="light_blue3"></b> <b class="light_blue2"></b> <b class="light_blue1"></b><b style="background:#cdddfb; height:5px;"></b> </b> </div>
						</div>
						<div class="blue_content">
							<div class="white_content">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tbody><tr>
											<td style="color:#4e4e4e" class="create_sub">所有邮件模板<br>
											    <div style="width:100%; padding-left:8px">
											    <div style="height:100px;width:98%;overflow:auto;" id="ctl00_ContentPlaceHolder1_Panel2">

                                                    <div id="Div1">
                                                        <#list templates as template>
                                                        <div style="width:75%;" class="left">
                                                        <img width="12" height="16" src="/static/images/turn_left.gif">
                                                        <input type="checkbox" value="${template.id}" onclick="checkEmail(this);" id="ctl00_ContentPlaceHolder1_rptAllEmail_ctl00_cbxEmail" name="ctl00$ContentPlaceHolder1$rptAllEmail$ctl00$cbxEmail">
                                                        <span title="ray" style="color:#4e4e4e" class="little">${template.title}</span>
                                                        </div>
                                                        <div style="width:15%; text-align:right" class="right"><a href="/email/preview.html?tid=${template.id}" target="_blank">
                                                            <img align="absmiddle" src="/static/images/html.gif">预览&nbsp;&nbsp;</a>
                                                        </div>
                                                        </#list>
                                                    </div>
											    </div>
											</td>
										</tr>
									</tbody></table>
								</div>
						</div>

						<div class="blue_content">
							<div style="padding:0pt;" class="light_blue_box"> <b class="light_blue"> <b class="light_blue1"><b></b></b> <b class="light_blue2"><b></b></b> <b class="light_blue3"></b> <b class="light_blue4"></b> <b class="light_blue5"></b> </b>
								<div class="light_blue_content">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tbody><tr>
											<td class="send_from6"><img align="absmiddle" src="/static/images/database.gif">我的联系人 <font style="color:#999; font-weight:normal;">
											</font></td>
										</tr>
									</tbody></table>
								</div>
								<b class="light_blue"> <b class="light_blue5"><b></b></b> <b class="light_blue4"><b></b></b> <b class="light_blue3"></b> <b class="light_blue2"></b> <b class="light_blue1"></b><b style="background:#cdddfb; height:5px;"></b> </b> </div>
						</div>
						<div class="blue_content">
							<div style="padding:0pt;" class="white_box"> <b class="white"> <b class="white1"><b></b></b> <b class="white2"><b></b></b> <b class="white3"></b> <b class="white4"></b> <b class="white5"></b> </b>
								<div class="white_content">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tbody><tr>
											<td style="color:#4e4e4e" class="create_sub"> <input type="checkbox" value="checkbox" id="ctl00_ContentPlaceHolder1_cbxEveryone" name="ctl00$ContentPlaceHolder1$cbxEveryone">所有人<br>
                                               <input type="hidden" id="ctl00_ContentPlaceHolder1_hiGroupString" name="ctl00$ContentPlaceHolder1$hiGroupString">
											    <div style="width:98%; padding-left:8px">
											    <div id="ctl00_ContentPlaceHolder1_UpdatePanel23">

											    <div style="width:98%;" id="ctl00_ContentPlaceHolder1_Panel1">

                                                    <div id="tblTo">
                                                    <div>
                                                        <#list groups as group>
                                                        <div style="width:60%" class="left">
                                                        <img width="12" height="17" src="/static/images/turn_left.gif">
                                                        <input type="checkbox" value="${group.id}" count="${group.count}" id="ctl00_ContentPlaceHolder1_rptGroup_ctl00_AddGroup" name="ctl00$ContentPlaceHolder1$rptGroup$ctl00$AddGroup">
                                                        <span title="${group.name}" style="color:#4e4e4e" class="little"> ${group.name}（<span style="color:#4E4E4E;" class="groupNum" id="ctl00_ContentPlaceHolder1_rptGroup_ctl00_lblGroupNum">${group.count}</span>
                                                            人）</span> </div>
                                                        <div style="color:#4e4e4e" class="right">随机发送此组<input type="text" style="width:45px; text-align:right; height:14px;color:#4e4e4e" class="input_text" onkeypress="javascript:return isNumber(event);" id="NewId892540">人
                                                        <a href="/email/addList.html?groupId=${group.id}" target="_blank" style="color:#35639c; font-size:12px;" name="892540" id="add" >
                                                            <img align="absmiddle" src="/static/images/add1.gif">添加联系人</a></div>
                                                          <div id="892540"></div>

                                                        </#list>

                                                    </div>
                                                </div>
	                                            </div>

                                            </div>
											</div>
											</td>
										</tr>
									</tbody></table>
								</div>
                            </div>
                            <b class="light_blue"> <b class="light_blue5"><b></b></b> <b class="light_blue4"><b></b></b> <b class="light_blue3"></b> <b class="light_blue2"></b> <b class="light_blue1"></b><b style="background:#cdddfb; height:5px;"></b> </b>
                        </div>

                    </div>
                    </div>

			    </div>
			</div>


            <div style="margin:0px 25px;">
				<div class="send_tan_box"> <b class="send_tan"> <b class="send_tan1"><b></b></b> <b class="send_tan2"><b></b></b> <b class="send_tan3"></b> <b class="send_tan4"></b> <b class="send_tan5"></b> </b>
					<div class="send_tan_content">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tbody><tr>
								<td class="send_from">邮件主题</td>
							</tr>
							<tr>
								<td class="guang_p"><input type="text" class="input_text" style="width:50%;" id="ctl00_ContentPlaceHolder1_txtSubject" name="ctl00$ContentPlaceHolder1$txtSubject"></td>
							</tr>
							<!--tr>
							   <td class="guang_p">
								    <span class="guang_p"><strong><a href="javascript:void(0)" unselectable="on" id="insertTag">
                                                        <img align="absmiddle" src="/static/images/add1.gif">插入自定义标签 </a></strong> </span>
								    <select style="padding:2px 4px;" class="news" id="ctl00_ContentPlaceHolder1_ddlTags" name="ctl00$ContentPlaceHolder1$ddlTags">
                                        <option value="{{{FullName}}}">姓名</option>
                                        <option value="{{{Email}}}">邮箱</option>
                                        <option value="{{{Company}}}">公司名称</option>
                                        <option value="{{{City}}}">城市</option>
                                        <option value="{{{Phone}}}">电话</option>
                                        <option value="{{{Reserved1}}}">自定义一</option>
                                        <option value="{{{Reserved2}}}">自定义二</option>
                                        <option value="{{{Reserved3}}}">自定义三</option>
                                    </select>
								</td>
                            </tr>
                            <tr>
                                <td class="send_from3"><p id="_altlayer" style="display: none; position: absolute; padding: 5px; width: 200px; text-decoration: none;">
                                            </p>
                                    <input type="checkbox" id="ctl00_ContentPlaceHolder1_cbxAddAd" name="ctl00$ContentPlaceHolder1$cbxAddAd">&nbsp;将对发给如下域名的邮件主题前加(AD)<img style="margin-left: 5px;" src="/static/images/light.gif" altborder="#fef083" altcolor="#4e4e4e" altbg="#fefed4" title="&lt;i style='font-size:12px; font-style:normal; font-weight:normal; letter-spacing:1.2px; line-height:16px; color:#4e4e4e;'&gt;对于广告性质的邮件,有些ISP严格要求主题中必须加 AD,否则拒绝接受或退信,建议对于广告性质的邮件选中此项，有利于提升发送效果!&lt;/i&gt;">
                                </td>
                            </tr>
                            <tr>
                                <td class="guang_p">
                                    <input type="text" class="input_text" style="width: 50%;" value="163.com,126.com,yeah.net" id="ctl00_ContentPlaceHolder1_txtAdDomains" name="ctl00$ContentPlaceHolder1$txtAdDomains">
                                </td>
                            </tr-->
                        </tbody></table>
					</div>
					<b class="send_tan"> <b class="send_tan5"></b> <b class="send_tan4"></b> <b class="send_tan3"></b> <b class="send_tan2"><b></b></b> <b class="send_tan11"><b></b></b> </b></div>

			<div class="">
			    <table width="103%" border="0" cellspacing="0" cellpadding="0">
                    <tbody><tr>
                        <td width="70%" valign="top" style="padding-right: 25px; padding-top: 4px;">

                            <div style="margin-bottom: 15px;">
                                <b class="light_tan"><b class="light_tan1"><b></b></b><b class="light_tan2"><b></b></b>
                                    <b class="light_tan3"></b><b class="light_tan4"></b><b class="light_tan5"></b>
                                </b>
                                <div class="send_tan_content">
                                    <table width="100%" bordercolor="#FBFBFB" cellspacing="0">
                                        <tbody><tr>
                                            <td>
                                                <div class="left">
                                                    <span class="send_tan14">发送方式</span><br><br></div>
                                            </td>
                                        </tr>
                                        <tr>
								            <td style="border-top:solid 1px #e5e7e9;" class="send_del4">
								            &nbsp;<input type="checkbox" checked="checked" value="checkbox" id="ctl00_ContentPlaceHolder1_cbxTrack" name="ctl00$ContentPlaceHolder1$cbxTrack">跟踪超链接
								            &nbsp;&nbsp;<img align="absmiddle" src="/static/images/dot02.gif">
                                            &nbsp;&nbsp;<img align="absmiddle" src="/static/images/xing.gif">每小时发送量
                                             <select id="ctl00_ContentPlaceHolder1_ddlSetTimeNum" name="ctl00$ContentPlaceHolder1$ddlSetTimeNum">
                                                <option value="-1" selected="selected">请选择</option>
                                                <option value="75000">75,000</option>
                                                <option value="50000">50,000</option>
                                                <option value="25000">25,000</option>
                                                <option value="10000">10,000</option>
                                                <option value="5000">5,000</option>
                                                <option value="1000">1,000</option>
                                                <option value="500">500</option>

                                            </select>
								            </td>
							            </tr>
                                        <tr>
                                            <td>
                                                <table width="100%">
                                                    <tbody><tr>
                                                        <td height="5" colspan="3">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <!--td style="width:25%;" class="send_del5">
                                                             <img align="absmiddle" src="/static/images/caogao.gif">保存草稿
                                                         </td-->
                                                        <td height="24" style="width:25%;padding-left:8px">
                                                            <div align="left">
                                                                <p>
                                                                    <img width="18" height="18" src="/static/images/email_go.gif"><span style="color:#333;" class="style1 send_del5">立即发送</span></p>
                                                            </div>
                                                        </td>
                                                        <td style="width:25%; border-left:solid 1px #e5e7e9; padding-left:8px">
                                                            <div align="left">
                                                                <p>
                                                                    <img width="19" height="17" src="/static/images/dot15.gif"><span class="style1 send_del5">定时发送</span></p>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <!--td class="send_del6">信息填写完毕，您可以保存为草稿，用于后续发送</td-->
                                                        <td class="send_del6">
                                                                您的邮件将立刻发送出去
                                                        </td>
                                                        <td style="border-left:solid 1px #e5e7e9; " class="send_del6">
                                                                &nbsp;设置您想发送的时间
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <!--td class="send_del7">&nbsp;</td-->
                                                        <td style="padding-left:3px">   </td>
                                                        <td style="border-left:solid 1px #e5e7e9; padding-left:3px">
                                                            <span class="style1 send_del7">日期:</span>
                                                            <input type="text" style="width:100px;" class="input_text" id="calendar_fix_time" onclick="showcalendar(event,1,null,'today');">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <!--td class="send_del7">&nbsp;</td-->
                                                        <td style="padding-left:3px">   </td>
                                                        <td style="border-left:solid 1px #e5e7e9; padding-left:3px"> </td>
                                                    </tr>
                                                     <tr>
                                                       <!--td class="send_del0"></td-->
                                                        <td style="padding-left:3px">   </td>
                                                        <td height="36" style="border-left:solid 1px #e5e7e9; padding-left:3px">
                                                            <div align="left">
                                                                <span class="style1 send_del7">时区:</span> <img width="18" height="18" src="/static/images/world.gif"><span class="style1 send_del7">北京(GMT 08:00)</span>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                            	        <!--td class="send_del0 "> <div visible="true" style="padding-right:15px" class="right">&nbsp;
                                            	                <input type="submit" style="width:80px;" display="none" id="ctl00_ContentPlaceHolder1_bthSaveOutline" onclick="return judgeIsEmpty();" value="保存草稿" name="ctl00$ContentPlaceHolder1$bthSaveOutline"></div>
                                            	             </td-->
                                                        <td style="padding-left:8px">
                                                            <div align="right" style="padding-right:8px;">
                                                                <input type="image" border="0" style="border-width:0px;" onclick="return judgeIsEmpty(0);" src="/static/images/NowSend.jpg"/></div>
                                                        </td>
                                                        <td height="28" style="border-left:solid 1px #e5e7e9; padding-left:8px">
                                                            <p align="center" class="little">
                                                            </p><div align="right" style="padding-right:8px; padding-bottom:0">
                                                                <input type="image" style="border-width:0px;" onclick="return judgeIsEmpty(1);" src="/static/images/TimeSend.gif" text="定时发送" id="ctl00_ContentPlaceHolder1_btnSendSchedule" name="ctl00$ContentPlaceHolder1$btnSendSchedule">
                                                             </div>
                                                            <p></p>
                                                        </td>
                                                    </tr>
                                                </tbody></table>
                                            </td>
                                        </tr>
                                   </tbody></table>
                                </div>
                                <b class="light_tan"><b class="light_tan5"></b><b class="light_tan4"></b><b class="light_tan3">
                                </b><b class="light_tan2"><b></b></b><b class="light_tan11"><b></b></b></b>
                            </div>
                        </td>
                    </tr>
                </tbody></table>
            </div>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tbody><tr>
					<td style="padding:0" class="back"><a id="ctl00_ContentPlaceHolder1_linkPrevious" href="javascript:history.back();"><img align="absmiddle" src="/static/images/left.gif">返回上一步</a></td>
					<td></td>
				</tr>
			</tbody></table>
		</div>
	</div>
		<div class="send_body2">
		<div style="height:300px;">&nbsp;</div>
			<div class="blue_box5"><b class="blue"><b class="blue1"><b></b></b> <b class="blue2"><b></b></b><b class="blue3"></b><b class="blue4"></b> <b class="blue5"></b></b>
				<div class="blue_content">
					<div style="padding:0pt;" class="light_blue_box"> <b class="light_blue"> <b class="light_blue1"><b></b></b> <b class="light_blue2"><b></b></b> <b class="light_blue3"></b> <b class="light_blue4"></b> <b class="light_blue5"></b> </b>
						<div class="light_blue_content">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tbody><tr>
									<td class="send_from6"><img align="absmiddle" src="/static/images/group.gif">订阅人数 <font style="color:#999; font-weight:normal;"></font></td>
									<td class="send_view"><div style="display:none"><a href="#">查看<img align="absmiddle" src="/static/images/dot08.gif"></a></div></td>
								</tr>
							</tbody></table>
						</div>
						<b class="light_blue"> <b class="light_blue5"><b></b></b> <b class="light_blue4"><b></b></b> <b class="light_blue3"></b> <b class="light_blue2"></b> <b class="light_blue1"></b><b style="background:#cdddfb; height:5px;"></b> </b> </div>
				</div>
				<div class="blue_content">
					<div style="padding:0pt;" class="white_box"> <b class="white"> <b class="white1"><b></b></b> <b class="white2"><b></b></b> <b class="white3"></b> <b class="white4"></b> <b class="white5"></b> </b>
						<div class="white_content">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tbody><tr>
									<td style="text-align:center; font-size:26px; color:#ff00b8;"><span style="color:#FF00B8;font-size:25px;" id="ctl00_ContentPlaceHolder1_lblSubscriberCountInGroups">0</span>

									</td>
								</tr>
							</tbody></table>
						</div>
						<b class="white"> <b class="white5"><b></b></b> <b class="white4"><b></b></b> <b class="white3"></b> <b class="white2"></b> <b class="white1"></b><b style="background:#cdddfb; height:5px;"></b> </b> </div>
				</div>
				<div class="blue_content">
					<div style="padding:0pt;" class="white_box"> <b class="white"> <b class="white1"><b></b></b> <b class="white2"><b></b></b> <b class="white3"></b> <b class="white4"></b> <b class="white5"></b> </b>
						<div class="white_content">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tbody><tr>
									<td class="send_count">
                                       <div style="width:100%"><div style="width:35%" class="left">&nbsp;</div><div style="width:17px; height:16px" class="left">
                                       <img style="display:none" src="/static/images/indicator.gif" id="imgCount"></div>
									    <div class=" left"><a id="calculated" href="javascript:void(0)">计算</a></div></div>
									</td>
								</tr>
							</tbody></table>
						</div>
						<b class="white"> <b class="white5"><b></b></b> <b class="white4"><b></b></b> <b class="white3"></b> <b class="white2"></b> <b class="white1"></b> </b> </div>
				</div>
				<b class="blue"> <b class="blue5"></b> <b class="blue4"></b> <b class="blue3"></b> <b class="blue2"><b></b></b> <b class="blue1"><b></b></b> </b> </div>
		</div>
    <div class="send_body2">
        <div style="margin-right:25px;">
            <div class="send_tan_box">
             <b class="send_tan"> <b class="send_tan1"><b></b></b> <b class="send_tan2"><b></b></b> <b class="send_tan3"></b> <b class="send_tan4"></b> <b class="send_tan5"></b> </b>
                <div class="send_tan_content">
                    <p style="color:#4e4e4e; line-height:20px; padding:5px; text-align:justify; text-justify:inter-ideograph;">
                    <img align="texttop" style="margin-right:5px;" src="/static/images/light.gif"> 当选择多个组里有重复联系人只算一人，可选排除组、过滤器进行数据刷选。
                    <br>
                     <img align="texttop" style="margin-right:5px;" src="/static/images/light.gif">
                        建议发送时选中排出组里的无效地址组和退订组，对其进行排除操作，避免其对后期发送效果的影响和减少不必要投诉。</p>
                </div>
                <b class="send_tan"> <b class="send_tan5"></b> <b class="send_tan4"></b> <b class="send_tan3"></b> <b class="send_tan2"><b></b></b> <b class="send_tan11"><b></b></b> </b> </div>
        </div>


        <div style="margin-top:360px;width:90%; padding-top:8px; padding-right:8px" class="send_body2">
            <b class="light_tan"><b class="light_tan1"><b></b></b><b class="light_tan2"><b></b></b>
               <b class="light_tan3"></b><b class="light_tan4"></b><b class="light_tan5"></b>
                </b>
                    <div class="send_tishi send_tan_content">
                    <h2>邮件评分规则</h2>
                    <p>邮件评分功能为对邮件主题、发件人邮箱、发件人名称、邮件内容的判定，打分越低越好，此功能仅供参考。<br>当描述里出现“blocklist”时为进入“黑名单”;<br>contains“XXX”时为出现敏感字符等。&nbsp;</p>
                     </div>
              <b class="light_tan"><b class="light_tan5"></b><b class="light_tan4"></b><b class="light_tan3">
              </b><b class="light_tan2"><b></b></b><b class="light_tan11"><b></b></b></b>
        </div>
    </div>
    <div class="clear"></div>
</div>

</@layout.standard>