<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@page import="Bean.UserDao"%>
<%@page import="Model.User"%>
<%@page import="Util.DBUtil"%>
<%@page import="java.util.*,java.sql.Timestamp" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<% 
//接受从客户端传递过来的参数
System.out.println("cbdjchsbdh");
request.setCharacterEncoding("UTF-8");
String username=request.getParameter("username");
String password=request.getParameter("password");

User user=new User();
user.setUsername(username);
user.setPassword(password);
UserDao userDao=new UserDao();
try{
       boolean flag=userDao.check(username,password);
       System.out.println(flag);
       if(flag==true) response.sendRedirect("teacher/main.jsp");
       else
       {
    	    %>
		   <script type="text/javascript" language="javascript">
		   alert("密码输入错误，请重新输入");
		   window.document.location.href="login.jsp";
		   </script> 
		   <%   	 
       }
    	   
}catch(Exception e){
	  response.sendRedirect("login.jsp");
}
%>
</body>
</html>