$(document).ready(function () {
    $("#signinbtn").click(function () {
        if($("#signin_username").val()!=""&&$("#signin_password").val()!=""&&$("#signin_phonenumber").val()!=""){
        	alert("注册成功！请登录");
        }
        else{
        	alert("用户名或密码或电话不能为空，请重新输入");
        }
    });
});