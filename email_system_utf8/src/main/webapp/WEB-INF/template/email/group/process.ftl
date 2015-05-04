<#import "/include/admin_layout.ftl" as layout />
<@layout.standard "通讯录管理" 2>

<script type="text/javascript">

    var auto = setInterval("rate()",5000)
    function rate(){
        $.ajax({
            type:'POST',
            dataType:'json',
            url:'/email/importRate.html',
            data:{fileName:"${fileName}",groupId:${group.id},originalCount:${group.count}},
            success:function(res){
                $("#progressbar").css("width", res.data);
                if (res.data=="100%") {
                    clearInterval(auto);
                    alert("导入完成");
                }else if (res.code == 1){
                    clearInterval(auto);
                    alert("导入数据与存在数据有部分重复，已导入完成");
                }
            },
            error:function(){
            }
        });
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
        <li><a class="sel" id="nav_subs">联系人</a></li>
    </ul>
</div>

    <div class="edit_u">批量导入</div>

    <div style=" width:70%" class="send_body1">
		<div style=" padding-bottom:0px;" class="dashblue_box3"> <b class="dashblue"> <b class="dashblue1"><b></b></b> <b class="dashblue2"><b></b></b> <b class="dashblue3"></b> <b class="dashblue4"></b> <b class="dashblue5"></b> </b>
			<div class="dashblue_content">
				<div style="padding:0pt;" class="dashlight_blue_box"> <b class="dashlight_blue"> <b class="dashlight_blue1"><b></b></b> <b class="dashlight_blue2"><b></b></b> <b class="dashlight_blue3"></b> <b class="dashlight_blue4"></b> <b class="dashlight_blue5"></b> </b>
					<div class="dashlight_blue_content">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tbody><tr>
                                <td class="dash_td3">
                                    进度
                                </td>
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
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tbody><tr>
                                            <td bgcolor="#ffffff" style=" width:99%; height:35px; border:solid 1px #bbb; padding:1px;" colspan="2">
                                                <div style="width: 0%; height: 38px; background-color: rgb(53, 99, 156);" id="progressbar">
                                                <!--div>
                                                     导入中，可查看该组联系人
                                                     <a href="/email/emailList.html?groupId=${group.id}" target="_blank">
                                                        <b>————》 ${group.name}</b>
                                                     </a>
                                                </div-->
                                            </td>
										</tr>
										<tr>
                                            <td style="font-size: 14px; color: #4e4e4e; text-align: center; padding-top: 10px;" colspan="2">
                                                <dd>
                                                    <img vspace="2" border="0" src="/static/images/wait.gif"><!--span id="msg" class="cibiaoti">已完成</span-->
                                                </dd>
                                                <div style=" width:auto; background-color:White; height:auto" id="Div1">

                                                </div>
                                            </td>
										</tr>
									</tbody></table>
								</div>
								<b class="dashwhite"> <b class="dashwhite5"><b></b></b> <b class="dashwhite4"><b></b></b> <b class="dashwhite3"></b> <b class="dashwhite2"></b> <b class="dashwhite1"></b> </b> </div>
						</td>
					</tr>
				</tbody></table>
			</div>
			<b class="dashblue"> <b class="dashblue5"></b> <b class="dashblue4"></b> <b class="dashblue3"></b> <b class="dashblue2"><b></b></b> <b class="dashblue1"><b></b></b> </b> </div>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tbody><tr>
					<td><div style="display: block;" id="divNext"><ul class="button"><li><a id="btn_next" href="/email/groupList.html">下一步</a></li></ul></div></td>
				</tr>
			</tbody></table>
	</div>

	<div class="send_body2">
        <div style="padding-top:0px; margin-left:0px;" class="dashblue_box3">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tbody><tr>
                    <td>
                        <div class="dashblue_box2"> <b class="dashblue"> <b class="dashblue1"><b></b></b> <b class="dashblue2"><b></b></b> <b class="dashblue3"></b> <b class="dashblue4"></b> <b class="dashblue5"></b> </b>
                            <div class="dashblue_content">
                                <div style="padding:0pt;" class="dashlight_blue_box"> <b class="dashlight_blue"> <b class="dashlight_blue1"><b></b></b> <b class="dashlight_blue2"><b></b></b> <b class="dashlight_blue3"></b> <b class="dashlight_blue4"></b> <b class="dashlight_blue5"></b> </b>
                                    <div class="dashlight_blue_content">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tbody><tr>
                                                <td class="dash_td3">联系人</td>
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
                                                <td class="chakan"><a href="/email/addList.html?groupId=${group.id}"><img align="absmiddle" src="/static/images/dot08.gif">添加更多联系人</a></td>
                                            </tr>
                                            <tr>
                                                <td class="chakan"><a href="/email/emailList.html?groupId=${group.id}"><img align="absmiddle" src="/static/images/dot08.gif">查看该组联系人</a></td>
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

    <div class="clear">
    </div>
</div>
</@layout.standard>