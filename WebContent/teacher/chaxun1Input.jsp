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

<link rel="stylesheet" type="text/css" href="../ayangshi/fenye/css/font-awesome.min.css">
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
		request.setCharacterEncoding("UTF-8");
		String sname=request.getParameter("sname");
		String sname1=request.getParameter("sname1");
		String sname2=request.getParameter("sname2");
		String sname3=request.getParameter("sname3");
		String sname4=request.getParameter("sname4");
		String tiaojian1=request.getParameter("tiaojian1");
		String tiaojian2=request.getParameter("tiaojian2");
		String tiaojian3=request.getParameter("tiaojian3");
		String tiaojian4=request.getParameter("tiaojian4");
		String neirong=request.getParameter("neirong");
		String neirong1=request.getParameter("neirong1");
		String neirong2=request.getParameter("neirong2");
		String neirong3=request.getParameter("neirong3");
		String neirong4=request.getParameter("neirong4");
		String cx=request.getParameter("cx");
		String cx1=request.getParameter("cx1");
		String cx2=request.getParameter("cx2");
		String cx3=request.getParameter("cx3");
		String cx4=request.getParameter("cx4");
		String[] snames=new String[5];
		String[] tiaojians=new String[5];
		String[] neirongs=new String[5];
		String[] cxs=new String[5];
		snames[0]=sname;snames[1]=sname1;snames[2]=sname2;snames[3]=sname3;snames[4]=sname4;	
		neirongs[0]=neirong;neirongs[1]=neirong1;neirongs[2]=neirong2;neirongs[3]=neirong3;neirongs[4]=neirong4;
		tiaojians[0]="where";tiaojians[1]=tiaojian1;tiaojians[2]=tiaojian2;tiaojians[3]=tiaojian3;tiaojians[4]=tiaojian4;
		cxs[0]=cx;cxs[1]=cx1;cxs[2]=cx2;cxs[3]=cx3;cxs[4]=cx4;
		String sql="";
		if(cxs[0]==null){
			sql="select * from t_teacher where "+sname+" "+cxs[0]+" '%"+neirong+"%' ";
		}
		else{
			if(cxs[0].equals("like")){
				sql="select * from t_teacher where "+sname+" "+cxs[0]+" '%"+neirong+"%' ";
			}else{
				sql="select * from t_teacher where "+sname+" "+cxs[0]+" '"+neirong+"' ";
			}
		}
		
		String[] sqls= new String [6];
		//或者存到最后，且和不含放到开始
		int stat=1;
		int end=4;
		for(int i=1;i<5;i++){
				if(tiaojians[i]==null){
					continue;
				}
				if(tiaojians[i].equals("and"))
				{
					if(neirongs[i]==null||"".equals(neirongs[i].trim()))
					{
						sqls[stat]=" ";
					}else{
						if(cxs[i].equals("like")){
							sqls[stat]=" and "+snames[i]+" "+cxs[i]+" '%"+neirongs[i]+"%' ";
						}else{
							sqls[stat]=" and "+snames[i]+" = ' "+neirongs[i]+ " ' ";
						}
					}
					stat+=1;
				}
				if(tiaojians[i].equals("not"))
				{
					if(neirongs[i]==null||"".equals(neirongs[i].trim()))
					{
						sqls[stat]=" ";
					}else{
						if(cxs[i].equals("like")){
							sqls[stat]=" and "+snames[i]+" not like '%"+neirongs[i]+"%' ";
						}else{
							sqls[stat]=" and "+snames[i]+" <> '"+neirongs[i]+"' ";
						}
					
					}
					stat+=1;
				}
				if(tiaojians[i].equals("or"))
				{
					if(neirongs[i]==null||"".equals(neirongs[i].trim()))
					{
						sqls[end]=" ";
					}else{
						if(cxs[i].equals("like")){
							sqls[end]=" or "+snames[i]+" "+cxs[i]+" '%"+neirongs[i]+"%' ";
						}else{
							sqls[end]=" or "+snames[i]+" = '"+neirongs[i]+"' ";
						}
						
					}
					end-=1;
				}
			
		}
		sqls[0]=sql;
		String beginriqi=request.getParameter("beginriqi");
		String endriqi=request.getParameter("endriqi");
		if(beginriqi!=null&&!"".equals(beginriqi.trim())&&endriqi!=null&&!"".equals(endriqi.trim())){
			sqls[5]="and pizhunny between '"+beginriqi+"' and '"+endriqi+"'";
		}else{
			sqls[5]=" ";
		}
		for(int i=0;i<6;i++){
			out.print(sqls[i]);
		}
		TeacherDao teacherDao=new TeacherDao();
		String check=request.getParameter("check");
		List<Teacher> teachers=null;
		if(check!=null){
			teachers=(List)session.getAttribute("jibenxxs");
		}else{
			try{
				teachers=teacherDao.loadzonghe(sqls);
			}catch(Exception e){
				teachers=null;
			}
		session.setAttribute("jibenxxs", teachers);
		}

	
		if(teachers!=null){
%>
	
<table id="testtable2" >
		<thead>
			<tr>
				<th>教师编号</th>
				<th>教师姓名</th>
				<th>教师身份证号</th>
				<th>教师住址</th>
				<th>教师电话</th>
				
				<th >操作</th>
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
			
			<td><a href="xiangqing1.jsp?id=<%=teacher.getId()%>">查看</a></td>
			

			<!--  	<td><a href="xiugai.jsp?id=<%=teacher.getId()%>">修改</a></td>  -->
			<%
 				}
			%>
			
		</tr>
<%
 			}
		
%>

		</tbody>
	</table>
</body>
</html>