

StarConfig={};
//�����ʼ��������ַӳ��Ĺؼ��ַ�,�иùؼ�����ζ��Ҫ����ӳ��
StarConfig.UrlMapKey="(((StarMap)))";

//�����ʼ��������ַ��ӳ��Ĺؼ��ַ�,�иùؼ�����ζ��Ҫ�����ӳ��
StarConfig.UrlDeMapKey="(((StarDeMap)))";

//��ַӳ�䵽������,Ҳ����˵href=www.baidu.com/sdfsdfs/sdfsdf.html �ᱻӳ��Ϊ www.greentomail.com/map?t=55������ʽ
StarConfig.UrlMapTo="image.phenixsend.com";

//���ñ�ʾ,˵���Ѿ����ٹ���
StarConfig.UrlMappedSignal="STARID";

//"������ܲ鿴,��������"�����ӵ�ַ
StarConfig.ViewMail="http://image.izacholsm.com/t/zz?t=D49DE87F-74DB-4B3D-A46C-C71BD5B37923&amp;STARID={{{STARID}}}";

//"����������յ������ʼ�,��������"�����ӵ�ַ
StarConfig.UnsubscribeUrl="http://image.izacholsm.com/t/zz?t=4F8075B3-DE3C-4CC2-9645-82C75463318F&amp;STARID={{{STARID}}}";
StarConfig.UnsubscribeUrlEn="http://image.izacholsm.com/t/zz?t=3A2A7805-6E1B-4F85-9500-E4C7127FA498&amp;STARID={{{STARID}}}";

//"ת��"�����ӵ�ַ
StarConfig.TransmitUrl="http://image.izacholsm.com/t/zz?t=6C5EF622-5558-4124-8F55-CB545A08F588&amp;STARID={{{STARID}}}";

StarConfig.Unsubscribe='<p  style="font-size:12px; font-family:Arial; color:#222; line-height:28px; border-top:solid 1px #daf0b0; background-color: #daf0b0; width:740px; vertical-align:middle; margin-right:auto; margin-left:auto" align="center">������������յ����ʼ�������<a style="color: red" href="'+StarConfig.UnsubscribeUrl+'">�˶�</a>��ת������<a style="color: red" href="'+StarConfig.TransmitUrl+'">����</a></p>'

StarConfig.UnsubscribeTD9344='<p  style="font-size:12px; font-family:Arial; color:#222; line-height:28px; border-top:solid 1px #daf0b0; background-color: #daf0b0; width:740px; vertical-align:middle; margin-right:auto; margin-left:auto" align="center">�������������յ����ǵ��������ƹ�����ʼ�����<a style="color: red" href="'+StarConfig.UnsubscribeUrl+'">����˴�</a>�˶��������ϣ���ָ����ģ����µ�400-088-8899</p><p  style="font-size:12px; font-family:Arial; color:#222; line-height:28px; border-top:solid 1px #daf0b0; background-color: #daf0b0; width:740px; vertical-align:middle; margin-right:auto; margin-left:auto" align="center">If you do not wish to receive emails from Wanda Club, please <a style="color: red" href="'+StarConfig.UnsubscribeUrlEn+'">click here </a>to unsubscribe.You may also call at 400-088-8899 to regain your subscription.</p>'


//�˶�������,4F8075B3 ���˶����ӵĵ�ַ
StarConfig.UnsubscribePtn= /<p((?!<\/p>).)+4F8075B3((?!<p>).)+<\/p>/ig;
StarConfig.UnsubscribePtnEn= /<p((?!<\/p>).)+3A2A7805((?!<p>).)+<\/p>/ig;

StarConfig.UrlShare='<table border="0" cellspacing="0" cellpadding="0" width="740" align="center"><tbody><tr><td style="padding:5px 0;"><div style="float: left"><a target="_blank" href="http://image.izacholsm.com/t/zz?t=b38ed66b-b63a-425e-a35f-80d3b7cb0123&amp;STARID=[[[STARID]]]"><img border="0" alt="" src="http://image.izacholsm.com/a/4/image/share.gif" /></a></div></td></tr></tbody></table>'
StarConfig.UrlClick='<table border="0" cellspacing="0" cellpadding="0" width="740" align="center"><tbody><tr><td style="padding:5px 0;"><div style="float: right; valign: center"><p style="padding-top:2px;font-size:12px;">������޷������鿴������<a style="color: #f00" href="http://image.izacholsm.com/t/zz?t=D49DE87F-74DB-4B3D-A46C-C71BD5B37923&amp;STARID={{{STARID}}}">�������</a></p></div></td></tr></tbody></table>'
StarConfig.UrlShareAndClick='<table align="center" border="0" cellpadding="0" cellspacing="0" width="740"><tbody><tr><td style="padding:5px;"><div style="float:left"><a href="http://image.izacholsm.com/t/zz?t=b38ed66b-b63a-425e-a35f-80d3b7cb0123&amp;STARID=[[[STARID]]]" target="_blank"><img alt="" border="0" src="http://image.izacholsm.com/a/4/image/share.gif" /></a></div><div style="float:right; font-size:12px; color:#000;">������޷������鿴������<a href="http://image.izacholsm.com/t/zz?t=D49DE87F-74DB-4B3D-A46C-C71BD5B37923&amp;STARID={{{STARID}}}" style="color:#f00; text-decoration:underline;">�������</a></div></td></tr></tbody></table>';


StarConfig.UrlShareEn=StarConfig.UrlShare.replace("image/share.gif","image/E_share.gif");
StarConfig.UrlClickEn=StarConfig.UrlClick.replace("������޷������鿴������","If you have problem viewing this email, you can ").replace("�������","view it as a web page ");
StarConfig.UrlShareAndClickEn=StarConfig.UrlShareAndClick.replace("������޷������鿴������","If you have problem viewing this email, you can view it as a web page ").replace("�������","here").replace("image/share.gif","image/E_share.gif");;


//ͷ�����������
StarConfig.UrlSharePtn=/<table.+b38ed66b.+?<\/table>/ig;

//���ܲ鿴������
StarConfig.ClickPtn=/<table.+d49de87f.+?<\/table>/ig;

//Ӣ��ת�������ӵ�ַ
StarConfig.TransmitUrlEn="http://image.izacholsm.com/t/zz?t=FF94B4D0-C31D-4BF3-8E06-89C4D8C3D14F&amp;STARID={{{STARID}}}";

StarConfig.UnsubscribeEn='<p  style="font-size:12px; font-family:Arial; color:#222; line-height:28px; border-top:solid 1px #daf0b0; background-color: #daf0b0; width:740px; vertical-align:middle; margin-right:auto; margin-left:auto" align="center"><a style="color: red" href="'+StarConfig.UnsubscribeUrlEn+'">Unsubscribe</a> | <a style="color: red" href="'+StarConfig.TransmitUrlEn+'">Forward to Friends</a></p>';
StarConfig.UnsubscribeEnTD9344='<p  style="font-size:12px; font-family:Arial; color:#222; line-height:28px; border-top:solid 1px #daf0b0; background-color: #daf0b0; width:740px; vertical-align:middle; margin-right:auto; margin-left:auto" align="center">If you do not wish to receive emails from Wanda Club, please <a style="color: red" href="'+StarConfig.UnsubscribeUrlEn+'">click here </a>to unsubscribe.You may also call at 400-088-8899 to regain your subscription.</p>';

