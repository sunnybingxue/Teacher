<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<html> 
  <head> 
    <title>纯字验证码</title> 
    <meta http-equiv='content-type' content='text/html;charset=utf-8'/> 
    <script type='text/javascript' src='jquery-1.7.2.js'></script> 
    <script type='text/javascript'> 
    var code ; //在全局定义验证码  
       
    function createCode(){ 
       code = "";  
       var codeLength = 4;//验证码的长度  
       var checkCode = document.getElementById("code");  
       var random = new Array(0,1,2,3,4,5,6,7,8,9,'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R',  
       'S','T','U','V','W','X','Y','Z');//随机数  
       for(var i = 0; i < codeLength; i++) {//循环操作  
        var index = Math.floor(Math.random()*36);//取得随机数的索引（0~35）  
        code += random[index];//根据索引取得随机数加到code上  
      }  
      checkCode.value = code;//把code值赋给验证码  
    } 
    //校验验证码  
    function validate(){  
      var inputCode = document.getElementById("input").value.toUpperCase(); //取得输入的验证码并转化为大写     
      if(inputCode.length <= 0) { //若输入的验证码长度为0  
        alert("请输入验证码！"); //则弹出请输入验证码  
      }else if(inputCode != code ) { //若输入的验证码与产生的验证码不一致时  
        alert("验证码输入错误！@_@"); //则弹出验证码输入错误  
        createCode();//刷新验证码  
        document.getElementById("input").value = "";//清空文本框  
      }else { //输入正确时  
        alert("合格！^-^"); 
      } 
    } 
    </script> 
    <style type='text/css'> 
    #code{ 
      font-family:Arial,宋体; 
      font-style:italic; 
      color:green; 
      border:0; 
      padding:2px 3px; 
      letter-spacing:3px; 
      font-weight:bolder; 
    } 
    </style> 
  </head> 
  <body onload='createCode()'> 
    <div>验证码：  
      <input type = "text" id = "input"/>  
      <input type="button" id="code" onclick="createCode()" style="width:60px" title='点击更换验证码' /> 
      <input type = "button" value = "验证" onclick = "validate()"/> 
    </div>  
  </b ody> 
</html>
</body>
</html>