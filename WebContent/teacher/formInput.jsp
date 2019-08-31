<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="Bean.TeacherDao"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String id = request.getParameter("id");
%>
<%
	
	//工厂模式
	TeacherDao teacherDao = new TeacherDao();
    
    teacherDao.delete(id);
    %>
	   <script type="text/javascript" language="javascript">
	   alert("删除成功");
	   response.sendRedirect("main.jsp");
	   </script> 
	  