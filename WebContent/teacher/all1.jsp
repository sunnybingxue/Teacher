<%@page import="Model.Teacher"%>
<%@page import="java.util.List"%>
<%@page import="Bean.TeacherDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="fenye/css/font-awesome.min.css">
<link rel="stylesheet" href="fenye/css/jquery.paginate.css" />
<link rel="stylesheet" href="fenye/css/jquery.yhhDataTable.css" />

<script type="text/javascript" src="fenye/js/jquery.min.js"></script>
<script type="text/javascript" src="fenye/js/jquery.paginate.js" ></script>
<script type="text/javascript" src="fenye/js/jquery.yhhDataTable.js" ></script>
<script type="text/javascript" src="fenye/js/index.js" ></script>

</head>
<body>

     <div>
    <span  style="font-size:50px;text-align: center;display:block;">教师信息列表</span>
    </div>
    
    
    
    
    
<%
	TeacherDao teacherDao=new TeacherDao();
	List<Teacher> teachers=teacherDao.load2();
	
%>
<table id="testtable2" >
		<thead>
			<tr>
				<td>教师编号</td>
			<td>教师姓名</td>
			<td>教师身份证号</td>
			<td>教师地址</td>
			<td>教师电话</td>
			<td>教师部门</td>
			<td>教师工资</td>
			<td>教师参加工作时间</td>
			<td>教师专业</td>
			<td>教师职务</td>
			<td>教师出生年月</td>
			</tr>
		</thead>
		<tbody>
		<%
		
				for(Teacher teacher : teachers){
					
					
 		%>
		<tr>
			<td><%=teacher.getId() %></td>
			<td><%=teacher.getName() %></td>
			<td><%=teacher.getNum() %></td>
			<td><%=teacher.getAddress() %></td>
			<td><%=teacher.getPhone() %></td>
		    <td><%=teacher.getDepartment() %></td>
			<td><%=teacher.getWages() %></td>
			<td><%=teacher.getTime() %></td>
			<td><%=teacher.getMajor() %></td>
			<td><%=teacher.getDuty() %></td>
			<td><%=teacher.getBirth() %></td>

			
			<td><a href="xiangqing1.jsp?id=<%=teacher.getId()%>">查看</a></td>
				<td><a href="xiugai.jsp?id=<%=teacher.getId()%>">修改</a></td>

			
		</tr>
<%
 			}
%>

		</tbody>
	</table>
</body>
</html>