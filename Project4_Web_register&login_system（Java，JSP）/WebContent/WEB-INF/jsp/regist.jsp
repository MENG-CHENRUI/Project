<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>用户注册表</title>
</head>


<body>

	    <div class="container">
	    <h1 style="text-align:center;margin-top:10%;color:teal;">注册成为Team01的用户</h1>
        <div class="row" style="margin-top:5%;">
            <div class="offset-3 col-6">
                <div class="card">
                    <div class="card-body">
                    	<form action="<%=request.getContextPath() %>/sign_in"  method="post">
                        <div class="form-group">
                            <label for="signin_username">请输入用户名：</label>
                            <input type="text" class="form-control" name="signin_username" id="signin_username"/>
                        </div>
                        
                        <div class="form-group">
                            <label for="signin_password">请输入密码：</label>
                            <input type="password" class="form-control" name="signin_password" id="signin_password"/>
                        </div>
                        <p>
                            <small>如果忘记密码，需要电话号码验证</small>
                        </p>
                        <div class="form-group">
                            <label for="signin_phonenumber">请输入电话：</label>
                            <input type="password" class="form-control" name="signin_phonenumber" id="signin_phonenumber"/>
                        </div>
                       
                        <input class="btn btn-primary" type="submit" style="float:right;" value="登录" id="signinbtn">
                        <p id="registerresult"></p>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
<script src="js/signin.js"></script>
<script src="../js/signin.js"></script>
</body>
</html>