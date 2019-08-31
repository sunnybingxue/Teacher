<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page pageEncoding="utf-8"%>
<%@page import="Bean.UserDao"%>
<%@page import="Model.User"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="js/jquery.js"></script>

<script type="text/javascript">
$(function(){	
	//导航切换
	$(".menuson li").click(function(){
		$(".menuson li.active").removeClass("active")
		$(this).addClass("active");
	});
	
	$('.title').click(function(){
		var $ul = $(this).next('ul');
		$('dd').find('ul').slideUp();
		if($ul.is(':visible')){
			$(this).next('ul').slideUp();
		}else{
			$(this).next('ul').slideDown();
		}
	});
})	
</script>


</head>

<body style="background:#f0f9fd;">

	<div class="lefttop"><span></span>通讯录</div>
    
    <dl class="leftmenu">
        
    <dd>
    <div class="title">
    <span><img src="images/leftico01.png" /></span>管理信息
    </div>
    	<ul class="menuson">
        <li class="active"><cite></cite><a href="index.jsp" target="rightFrame">首页模版</a><i></i></li>
        <li ><cite></cite><a href="tab.jsp" target="rightFrame">添加教师信息</a><i></i></li>
        
       <!-- <li><cite></cite><a href="tab.jsp" target="rightFrame">添加教师信息</a><i></i></li> --> 
        <li><cite></cite><a href="all.jsp" target="rightFrame">查看教师信息</a><i></i></li>
        <li><cite></cite><a href="form.jsp" target="rightFrame">删除教师信息</a><i></i></li>
        <li><cite></cite><a href="main1.jsp" target="rightFrame">查询教师信息</a><i></i></li>
        
    
    <dd>
    <div class="title">
    <span><img src="images/leftico02.png" /></span>个人中心
    </div>
    <ul class="menuson">
        <li><cite></cite><a href="tab1.jsp" target="rightFrame">修改密码</a><i></i></li>

        </ul>     
    </dd> 
    
    
  
    
    </dl>
</body>
</html>
