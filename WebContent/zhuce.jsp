<!DOCTYPE html>
<%@ page pageEncoding="utf-8"%>
<html lang="en" class="no-js">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<title>zhuce</title>
<link rel="stylesheet" type="text/css" href="css/normalize.css" />
<link rel="stylesheet" type="text/css" href="css/demo.css" />
<!--必要样式-->
<link rel="stylesheet" type="text/css" href="css/component.css" />
<!--[if IE]>
<script src="js/html5.js"></script>
<![endif]-->
<script type="text/javascript">
	function check(){
		if (document.getElementById('username').value == "") {
			alert("用户名为空！");
			return false;
		}
		if (document.getElementById('passowrd').value == "") {
			alert("输入的密码为空！");
			return false;
		}
	} 
	/*-------------------------------------------------------------------------------------*/
</script>
</head>

<body>
<form action="zhuceInput.jsp" method="post">
		<div class="container demo-1">
			<div class="content">
				<div id="large-header" class="large-header">
					<canvas id="demo-canvas"></canvas>
					<div class="logo_box">
					<h1>&nbsp;&nbsp;&nbsp;&nbsp;教师信息管理系统</h1>
						<h3>欢迎你</h3>
						<!--  <form action="zhuceInput.jsp" method="post">-->
							<div class="input_outer">
								<span class="u_user"></span>
								<input name="logname" class="text" style="color: #FFFFFF !important" type="text" placeholder="请输入用户名" check();>
							</div>
							<div class="input_outer">
								<span class="us_uer"></span>
								<input name="logpass" class="text" style="color: #FFFFFF !important; position:absolute; z-index:100;"value="" type="password" placeholder="请输入密码" check();>
							</div>
							 <!--<div class="mb2"><input type="submit" value="注册"/>
							 <div class="mb2"><a class="act-but submit" " style="color: #FFFFFF">注册</a></div>-->
								<div class="mb2"><input type="submit" value="注册"class="act-but submit" " style="color: #FFFFFF"></div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div><!-- /container -->
		<script src="js/TweenLite.min.js"></script>
		<script src="js/EasePack.min.js"></script>
		<script src="js/rAF.js"></script>
		<script src="js/demo-1.js"></script>
		<div style="text-align:center;">

</div>
	</body>
</html>