

StarConfig={};
//进行邮件内容里地址映射的关键字符,有该关键字意味着要对其映射
StarConfig.UrlMapKey="(((StarMap)))";

//进行邮件内容里地址解映射的关键字符,有该关键字意味着要对其解映射
StarConfig.UrlDeMapKey="(((StarDeMap)))";

//地址映射到的域名,也就是说href=www.baidu.com/sdfsdfs/sdfsdf.html 会被映射为 www.greentomail.com/map?t=55这种形式
StarConfig.UrlMapTo="image.phenixsend.com";

//带该标示,说明已经跟踪过了
StarConfig.UrlMappedSignal="STARID";

//"如果不能查看,请点击这里"的链接地址
StarConfig.ViewMail="http://image.izacholsm.com/t/zz?t=D49DE87F-74DB-4B3D-A46C-C71BD5B37923&amp;STARID={{{STARID}}}";

//"如果不想再收到此类邮件,请点击这里"的链接地址
StarConfig.UnsubscribeUrl="http://image.izacholsm.com/t/zz?t=4F8075B3-DE3C-4CC2-9645-82C75463318F&amp;STARID={{{STARID}}}";
StarConfig.UnsubscribeUrlEn="http://image.izacholsm.com/t/zz?t=3A2A7805-6E1B-4F85-9500-E4C7127FA498&amp;STARID={{{STARID}}}";

//"转发"的链接地址
StarConfig.TransmitUrl="http://image.izacholsm.com/t/zz?t=6C5EF622-5558-4124-8F55-CB545A08F588&amp;STARID={{{STARID}}}";

StarConfig.Unsubscribe='<p  style="font-size:12px; font-family:Arial; color:#222; line-height:28px; border-top:solid 1px #daf0b0; background-color: #daf0b0; width:740px; vertical-align:middle; margin-right:auto; margin-left:auto" align="center">如果您不想再收到此邮件，请点击<a style="color: red" href="'+StarConfig.UnsubscribeUrl+'">退订</a>，转发请点击<a style="color: red" href="'+StarConfig.TransmitUrl+'">这里</a></p>'

StarConfig.UnsubscribeTD9344='<p  style="font-size:12px; font-family:Arial; color:#222; line-height:28px; border-top:solid 1px #daf0b0; background-color: #daf0b0; width:740px; vertical-align:middle; margin-right:auto; margin-left:auto" align="center">如果您不想继续收到我们的宣传或推广电子邮件，请<a style="color: red" href="'+StarConfig.UnsubscribeUrl+'">点击此处</a>退订。如果您希望恢复订阅，请致电400-088-8899</p><p  style="font-size:12px; font-family:Arial; color:#222; line-height:28px; border-top:solid 1px #daf0b0; background-color: #daf0b0; width:740px; vertical-align:middle; margin-right:auto; margin-left:auto" align="center">If you do not wish to receive emails from Wanda Club, please <a style="color: red" href="'+StarConfig.UnsubscribeUrlEn+'">click here </a>to unsubscribe.You may also call at 400-088-8899 to regain your subscription.</p>'


//退订的正则,4F8075B3 是退订连接的地址
StarConfig.UnsubscribePtn= /<p((?!<\/p>).)+4F8075B3((?!<p>).)+<\/p>/ig;
StarConfig.UnsubscribePtnEn= /<p((?!<\/p>).)+3A2A7805((?!<p>).)+<\/p>/ig;

StarConfig.UrlShare='<table border="0" cellspacing="0" cellpadding="0" width="740" align="center"><tbody><tr><td style="padding:5px 0;"><div style="float: left"><a target="_blank" href="http://image.izacholsm.com/t/zz?t=b38ed66b-b63a-425e-a35f-80d3b7cb0123&amp;STARID=[[[STARID]]]"><img border="0" alt="" src="http://image.izacholsm.com/a/4/image/share.gif" /></a></div></td></tr></tbody></table>'
StarConfig.UrlClick='<table border="0" cellspacing="0" cellpadding="0" width="740" align="center"><tbody><tr><td style="padding:5px 0;"><div style="float: right; valign: center"><p style="padding-top:2px;font-size:12px;">如果您无法正常查看，请点击<a style="color: #f00" href="http://image.izacholsm.com/t/zz?t=D49DE87F-74DB-4B3D-A46C-C71BD5B37923&amp;STARID={{{STARID}}}">在线浏览</a></p></div></td></tr></tbody></table>'
StarConfig.UrlShareAndClick='<table align="center" border="0" cellpadding="0" cellspacing="0" width="740"><tbody><tr><td style="padding:5px;"><div style="float:left"><a href="http://image.izacholsm.com/t/zz?t=b38ed66b-b63a-425e-a35f-80d3b7cb0123&amp;STARID=[[[STARID]]]" target="_blank"><img alt="" border="0" src="http://image.izacholsm.com/a/4/image/share.gif" /></a></div><div style="float:right; font-size:12px; color:#000;">如果您无法正常查看，请点击<a href="http://image.izacholsm.com/t/zz?t=D49DE87F-74DB-4B3D-A46C-C71BD5B37923&amp;STARID={{{STARID}}}" style="color:#f00; text-decoration:underline;">在线浏览</a></div></td></tr></tbody></table>';


StarConfig.UrlShareEn=StarConfig.UrlShare.replace("image/share.gif","image/E_share.gif");
StarConfig.UrlClickEn=StarConfig.UrlClick.replace("如果您无法正常查看，请点击","If you have problem viewing this email, you can ").replace("在线浏览","view it as a web page ");
StarConfig.UrlShareAndClickEn=StarConfig.UrlShareAndClick.replace("如果您无法正常查看，请点击","If you have problem viewing this email, you can view it as a web page ").replace("在线浏览","here").replace("image/share.gif","image/E_share.gif");;


//头部共享的正则
StarConfig.UrlSharePtn=/<table.+b38ed66b.+?<\/table>/ig;

//不能查看的正则
StarConfig.ClickPtn=/<table.+d49de87f.+?<\/table>/ig;

//英文转发的链接地址
StarConfig.TransmitUrlEn="http://image.izacholsm.com/t/zz?t=FF94B4D0-C31D-4BF3-8E06-89C4D8C3D14F&amp;STARID={{{STARID}}}";

StarConfig.UnsubscribeEn='<p  style="font-size:12px; font-family:Arial; color:#222; line-height:28px; border-top:solid 1px #daf0b0; background-color: #daf0b0; width:740px; vertical-align:middle; margin-right:auto; margin-left:auto" align="center"><a style="color: red" href="'+StarConfig.UnsubscribeUrlEn+'">Unsubscribe</a> | <a style="color: red" href="'+StarConfig.TransmitUrlEn+'">Forward to Friends</a></p>';
StarConfig.UnsubscribeEnTD9344='<p  style="font-size:12px; font-family:Arial; color:#222; line-height:28px; border-top:solid 1px #daf0b0; background-color: #daf0b0; width:740px; vertical-align:middle; margin-right:auto; margin-left:auto" align="center">If you do not wish to receive emails from Wanda Club, please <a style="color: red" href="'+StarConfig.UnsubscribeUrlEn+'">click here </a>to unsubscribe.You may also call at 400-088-8899 to regain your subscription.</p>';

