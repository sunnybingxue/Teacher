<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<title>认证码输入页面</title>  
  <meta   http-equiv="Content-Type"   content="text/html;   charset=gb2312">  
  <META   HTTP-EQUIV="Pragma"   CONTENT="no-cache">    
  <META   HTTP-EQUIV="Cache-Control"   CONTENT="no-cache">    
  <META   HTTP-EQUIV="Expires"   CONTENT="0">    
  </head>  
  <body>  
  <form method="post" name="myform" action="check.jsp">  
   <table>  
    <tr>  
     <td   align="left">系统产生的认证码：</td>  
     <td><img   border="0"   src="image.jsp"></td>  
    </tr>  
    <tr>  
     <td   align="left">输入上面的认证码：</td>  
     <td><input   type="text"   name="rand"   maxlength="4"   value=""></td>  
    </tr>  
    <tr>  
     <td   colspan="2"   align="center"><input name="b1"  type="submit"   value="提交检测"></td>  
    </tr>  
   </table>
  </form>  
  </body>  
  </html>  
</body>
</html>