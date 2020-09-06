<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/login.css" />
<title>欢迎来到Team01，请登录</title>
</head>
<body>
    <div id="div-relative0">
	    <h1>海量品牌　信息共享</h1>
        <h3>数据结合商业 然大数据发挥大价值<br><br></h3>
        <h4>精准营销，数据化管理，提升管理水平。<br><br>
            大作线上线下数字一体化。<br><br>
            双选平台，建立工厂与经销商双向选择平台。<br><br>
            服务市场，塑造经销商信等级，为其提供相应的金融服务。</h4>
	</div>
	
	<div id="div-relative1">
        <h1>请登录</h1>
	        <a>用戸名:</a><br>
	        <form action="<%=request.getContextPath() %>/home" method="post">
			<a><input type="tel" class="box" name="login_username" id="login_username" placeholder="请输入您的用户名" ></a><br>
			<font size="4">密码:</font><br>
            <a><input type="password" name="login_password" id="login_password" class="box" placeholder="请输入密码"></a><br><br>
			<a align="center"><input type="submit" class="button" value="登录" id="loginbtn"></a><br><br>
			 </form>
			<div class=block2><a><input type="checkbox" name="確認" value="">记住密码</a></div>
			<div class=block1><a class="font1" align="right" href="#">忘记密码</a><br><br></div>
			<div class=block3><a class="font1" href="#">没有账号？</a></div>
	        <div class=block4><a class="font2" href="jsp/sign_in.jsp">立即注册</a></div>
	</div>
	
	<div id="div-relative2">｜
	    <a class="font1" href="#">关于我们</a>｜
	    <a class="font1" href="#">诚聘人才</a>｜
	    <a class="font1" href="#">联系商家</a>｜
	    <a class="font1" href="#">广告服务</a>｜
	    <a class="font1" href="#">上海浦东经济开发区xx路666号xxx公司 Camping 2018-2019</a>
	</div>
	
	<div id="div-relative3">
	    <div class=block1><a class="font1" href="#">首页</a></div>
	    <div class=block1><a class="font1" href="#">链接一</a></div>
	    <div class=block1><a class="font1" href="#">链接二</a></div>
	    <div class=block1><a class="font1" href="#">链接三</a></div>
	</div>
<%
	Object verification=request.getAttribute("success");
	if(verification=="True"){
		out.print("<script type='text/javascript'>alert('登录成功，欢迎！');</script>");
	}
	else if(verification=="False"){
		out.print("<script type='text/javascript'>alert('用户名或密码错误');</script>");
	}
%>
</body>
</html>