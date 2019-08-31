<%@page import="java.util.List"%>
<%@page import="Bean.TeacherDao"%>
<%@page import="Model.Teacher"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<link href="css/style.css" rel="stylesheet" type="text/css" />




<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/jquery.paginate.css" />
<link rel="stylesheet" href="css/jquery.yhhDataTable.css" />

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.paginate.js" ></script>
<script type="text/javascript" src="js/jquery.yhhDataTable.js" ></script>
<script type="text/javascript" src="js/index.js" ></script>
<script type="text/javascript">
$(document).ready(function(){
  $(".click").click(function(){
  $(".tip").fadeIn(200);
  });
  
  $(".tiptop a").click(function(){
  $(".tip").fadeOut(200);
});
s
  $(".sure").click(function(){
  $(".tip").fadeOut(100);
});

  $(".cancel").click(function(){
  $(".tip").fadeOut(100);
});

});
</script>


<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
	TeacherDao teacherDao=new TeacherDao();
	List<Teacher> teachers=teacherDao.load2();
	
%>
<body style="padding-bottom:10px;">
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">数据表</a></li>
    <li><a href="#">基本内容</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
	    <div class="tools">
	    
	    	<ul	 class="toolbar">
	        <li class="click"><span><img src="images/t01.png" /></span>添加</li>
	        <li class="click"><span><img src="images/t02.png" /></span>修改</li>
	        <li><span><img src="images/t03.png" /></span>删除</li>
	        <li><span><img src="images/t04.png" /></span>统计</li>
	        </ul>
	        
	        
	        <ul class="toolbar1">
	        <li><span><img src="images/t05.png" /></span>设置</li>
	        </ul>
	    
	    </div>
    <div style="width:100%;margin:20px auto;">
				<table id="testtable4" >
					<thead>
						<tr>
							<th>教师编号</th>
							<th>教师姓名</th>
							<th>教师身份证号</th>
							<th>教师住址</th>
							<th>教师电话</th>
							
							<th>修改</th>
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
						
						<td><span style="color:green">已确认</span></td>
						<td></td>
						
							<td><span style="color:red">暂时保存</span></td>
							<td><a href="xiugai.jsp?id=<%=teacher.getId()%>">修改或查看</a></t                                                                                                                              d>
						<%
			 				}
						%>
						
					</tr>
		
					</tbody>
				</table>
		</div>

</div>
</body>
</html>