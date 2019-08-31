<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="js/select-ui.min.js"></script>
<script type="text/javascript" src="editor/kindeditor.js"></script>

<script type="text/javascript">
    KE.show({
        id : 'content7',
        cssPath : './index.css'
    });
  </script>
  
<script type="text/javascript">
$(document).ready(function(e) {
    $(".select1").uedSelect({
		width : 345			  
	});
	$(".select2").uedSelect({
		width : 167  
	});
	$(".select3").uedSelect({
		width : 100
	});
});
</script>
</head>

<body>


	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="main.jsp">首页</a></li>
    <li><a href="#">系统设置</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    
    <div id="usual1" class="usual"> 
    
    <div class="itab">
  	<ul> 
    <li><a href="#tab1" class="selected">添加信息</a></li> 
    <!--  <li><a href="#tab2">自定义</a></li> -->
  	</ul>
    </div> 
    
  	<div id="tab1" class="tabson">
    
    <div class="formtext">Hi，<b>admin</b>，欢迎您使用添加教师信息功能！</div>
    <form action="tabInput.jsp" method="post">
    <ul class="forminfo">
    <li><label>教师编号<b>*</b></label><input name="id" type="text" class="dfinput" placeholder="编号"   style="width:518px;"/></li>
    <li><label>教师姓名<b>*</b></label><input name="name" type="text" class="dfinput" placeholder="姓名"  style="width:518px;"/></li>
     <li><label>教师身份证号<b>*</b></label><input name="num" type="text" class="dfinput" placeholder="身份证号"  style="width:518px;"/></li>
      <li><label>教师住址<b>*</b></label><input name="address" type="text" class="dfinput" placeholder="住址"  style="width:518px;"/></li>
       <li><label>教师电话<b>*</b></label><input name="phone" type="text" class="dfinput" placeholder="电话"  style="width:518px;"/></li>
        <li><label>教师部门<b>*</b></label><input name="department" type="text" class="dfinput" placeholder="部门"  style="width:518px;"/></li>
         <li><label>教师工资<b>*</b></label><input name="wages" type="text" class="dfinput" placeholder="工资"  style="width:518px;"/></li>
         <li><label>教师参加工作时间<b>*</b></label><input name="time" type="text" class="dfinput" placeholder="参加工作时间"  style="width:518px;"/></li>
         
          <li><label>教师专业<b>*</b></label><input name="major" type="text" class="dfinput" placeholder="专业"  style="width:518px;"/></li>
           <li><label>教师职务<b>*</b></label><input name="duty" type="text" class="dfinput" placeholder=职务"  style="width:518px;"/></li>
            <li><label>教师出生年月<b>*</b></label><input name="birth" type="text" class="dfinput" placeholder="出生年月"  style="width:518px;"/></li>
    </li>
  <!--  <li><label>通知内容<b>*</b></label>
    

    <textarea id="content7" name="content" style="width:700px;height:250px;visibility:hidden;"></textarea>
    
    </li> --> 
    <li><label>&nbsp;</label><input name="" type="submit" class="btn" value="添加"/></li>
    </ul>
    </form>
    </div> 

    
    
   
  
    
    </div>  
       
	</div> 
 
	<script type="text/javascript"> 
      $("#usual1 ul").idTabs(); 
    </script>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
    
    
    
    
    
    </div>

</body>
</html>
