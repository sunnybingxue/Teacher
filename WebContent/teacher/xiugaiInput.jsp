<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@page import="Bean.TeacherDao"%>
<%@page import="Model.Teacher"%>
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
String id=request.getParameter("id");
String name=request.getParameter("name");
String num=request.getParameter("num");
String address=request.getParameter("address");
String phone=request.getParameter("phone");
String department=request.getParameter("department");
String wages=request.getParameter("wages");
String time=request.getParameter("time");
String major=request.getParameter("major");
String duty=request.getParameter("duty");
String birth=request.getParameter("birth");
Teacher teacher=new Teacher();
teacher.setId(id);
teacher.setName(name);
teacher.setNum(num);
teacher.setAddress(address);
teacher.setPhone(phone);
teacher.setDepartment(department);
teacher.setWages(Double.parseDouble(wages));
teacher.setTime(time);
teacher.setMajor(major);
teacher.setDuty(duty);
teacher.setBirth(birth);
TeacherDao teacherDao=new TeacherDao();

try{
       teacherDao.update(teacher);
      // System.out.println("lalala11111");
       %>
	   <script type="text/javascript" language="javascript">
	   alert("修改成功");
	  // window.document.location.href="main.jsp";
	   </script> 
	   <%
	  // response.sendRedirect("main.jsp");
	   
}catch(Exception e){
	response.sendRedirect("xiugai.jsp");
}

%>
</body>
</html>