<%@page import="Bean.TeacherDao"%>
<%@page import="Model.Teacher"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../ayangshi/fenye/css/font-awesome.min.css">
<link rel="stylesheet" href="../ayangshi/fenye/css/jquery.paginate.css" />
<link rel="stylesheet" href="../ayangshi/fenye/css/jquery.yhhDataTable.css" />

<script type="text/javascript" src="fenye/js/jquery.min.js"></script>
<script type="text/javascript" src="fenye/js/jquery.paginate.js" ></script>
<script type="text/javascript" src="fenye/js/jquery.yhhDataTable.js" ></script>
<script type="text/javascript" src="fenye/js/index.js" ></script>
<link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
  <script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
  <script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
    <script>
  $(function() {
    $( "#beginriqi" ).datepicker();
  });
  
  $(function() {
	    $( "#endriqi" ).datepicker();
	  });
  </script>
<title>Insert title here</title>
</head>
<style>

body {

    margin-left: 0px;

    margin-top: 0px;

    margin-right: 0px;

    margin-bottom: 0px;

}

.auto_hidden {

    width:204px;border-top: 1px solid #333;

    border-bottom: 1px solid #333;

    border-left: 1px solid #333;

    border-right: 1px solid #333;

    position:absolute;

    display:none;

}

.auto_show {

    width:204px;

    border-top: 1px solid #333;

    border-bottom: 1px solid #333;

    border-left: 1px solid #333;

    border-right: 1px solid #333;

    position:absolute;

    z-index:9999; /* 设置对象的层叠顺序 */

    display:block;

}

.auto_onmouseover{

    color:#ffffff;

    background-color:highlight;

    width:100%;

}

.auto_onmouseout{

    color:#000000;

    width:100%;

    background-color:#ffffff;

}

</style>
<style>
	input{
			font-size:1.4em; 设置输入框中字体的大小;
			height:20px; 设置输入框的高度;
			width:500px;
			
			
			outline:0; 将输入框点击的时候出现的边框去掉
			text-align:center; 设置输入框中文字的位置
			display:block; 将输入框设置为块级元素
}
		select{
                //清除select的边框样式
                //清除select聚焦时候的边框颜色
                outline: none;
                //将select的宽高等于div的宽高;
                width: 200px;
                height: 30px;
                line-height: 40px;
                //通过padding-left的值让文字居中;
                 padding-left: 60px;
                 font-size:20px;
            }
            body {
           /*  font-family: sans-serif; */
             font-size:19px; 
            
            }
            
</style>
<script language="javascript">


var $ = function (id) {

    return "string" == typeof id ? document.getElementById(id) : id;

}

var Bind = function(object, fun) {

    return function() {
        return fun.apply(object, arguments);
    }
}

function AutoComplete(obj,autoObj,arr){

    this.obj=$(obj);        //输入框

    this.autoObj=$(autoObj);//DIV的根节点

    this.value_arr=arr;        //不要包含重复值

    this.index=-1;          //当前选中的DIV的索引

    this.search_value="";   //保存当前搜索的字符

}

AutoComplete.prototype={

    //初始化DIV的位置

    init: function(){

        this.autoObj.style.left = this.obj.offsetLeft + "px";

        this.autoObj.style.top  = this.obj.offsetTop + this.obj.offsetHeight + "px";

        this.autoObj.style.width= this.obj.offsetWidth - 2 + "px";//减去边框的长度2px

    },

    //删除自动完成需要的所有DIV

    deleteDIV: function(){

        while(this.autoObj.hasChildNodes()){

            this.autoObj.removeChild(this.autoObj.firstChild);

        }

        this.autoObj.className="auto_hidden";

    },

    //设置值

    setValue: function(_this){

        return function(){

            _this.obj.value=this.seq;

            _this.autoObj.className="auto_hidden";

        }

    },

    //模拟鼠标移动至DIV时，DIV高亮

    autoOnmouseover: function(_this,_div_index){

        return function(){

            _this.index=_div_index;

            var length = _this.autoObj.children.length;

            for(var j=0;j<length;j++){

                if(j!=_this.index ){

                    _this.autoObj.childNodes[j].className='auto_onmouseout';

                }else{

                    _this.autoObj.childNodes[j].className='auto_onmouseover';

                }

            }

        }

    },

    //更改classname

    changeClassname: function(length){

        for(var i=0;i<length;i++){

            if(i!=this.index ){

                this.autoObj.childNodes[i].className='auto_onmouseout';

            }else{

                this.autoObj.childNodes[i].className='auto_onmouseover';

                this.obj.value=this.autoObj.childNodes[i].seq;

            }

        }

    }

    ,

    //响应键盘

    pressKey: function(event){

        var length = this.autoObj.children.length;

        //光标键"↓"

        if(event.keyCode==40){

            ++this.index;

            if(this.index>length){

                this.index=0;

            }else if(this.index==length){

                this.obj.value=this.search_value;

            }

            this.changeClassname(length);

        }

        //光标键"↑"

        else if(event.keyCode==38){

            this.index--;

            if(this.index<-1){

                this.index=length - 1;

            }else if(this.index==-1){

                this.obj.value=this.search_value;

            }

            this.changeClassname(length);

        }

        //回车键

        else if(event.keyCode==13){

            this.autoObj.className="auto_hidden";

            this.index=-1;

        }else{

            this.index=-1;

        }

    },

    //程序入口

    start: function(event){

        if(event.keyCode!=13&&event.keyCode!=38&&event.keyCode!=40){

            this.init();

            this.deleteDIV();

            this.search_value=this.obj.value;

            var valueArr=this.value_arr;

            valueArr.sort();

            if(this.obj.value.replace(/(^\s*)|(\s*$)/g,'')==""){ return; }//值为空，退出

            try{ var reg = new RegExp("(" + this.obj.value + ")","i");}

            catch (e){ return; }

            var div_index=0;//记录创建的DIV的索引

            for(var i=0;i<valueArr.length;i++){

                if(reg.test(valueArr[i])){

                    var div = document.createElement("div");

                    div.className="auto_onmouseout";

                    div.seq=valueArr[i];

                    div.onclick=this.setValue(this);

                    div.onmouseover=this.autoOnmouseover(this,div_index);

                    div.innerHTML=valueArr[i].replace(reg,"<strong>$1</strong>");//搜索到的字符粗体显示

                    this.autoObj.appendChild(div);

                    this.autoObj.className="auto_show";

                    div_index++;

                }

            }

        }

        this.pressKey(event);

        window.onresize=Bind(this,function(){this.init();});

    }

}

//-->



</script>
<body>
<div align="center">
	<div  style="background-color:	#FFE4E1;=width:1500px;height:300px;border: 1px solid ;">
		<span style="font-size:50px;">综合查询</span>
		<form action="chaxun1Input.jsp" method="post" id="zongheform" target="bottom">
		<div>
				<a href="chaxun1.jsp" target="top">重置条件</a>&nbsp;&nbsp;
				<a href="#" onclick="blockDiv()"><img src="img/1.jpg" width="25px" height="25px"></a>&nbsp;
				<a href="#" onclick="noneDiv()"><img src="img/2.jpg" width="25px" height="25px"></a>
				<select name="sname">
								<option value ="id">教师编号</option>
								<option value="name">教师姓名</option>
								<option value ="num">教师身份证号</option>
								<option value="address">教师住址</option>
								<option value ="phone">教师电话</option>
				</select>
				<input type="text" name="neirong"  id="o" onkeyup="test1()">
				<div class="auto_hidden" id="auto"><!--自动完成 DIV--></div>
				<select name="cx">
								<option value ="like" >模糊</option>
								<option value ="=">精确</option>
				</select>
		
		</div>
		<table>
				<tr>
					<td>
						<div id="hiddenDiv1" style="display:none;">
							<select name="tiaojian1">
								<option value ="and">并且</option>
								<option value ="or">或者</option>
								<option value="not">不含</option>
							</select>
							<select name="sname1">
							<option value ="id">教师编号</option>
								<option value="name"  selected="selected">教师姓名</option>
								<option value ="num">教师身份证号</option>
								<option value="address">教师住址</option>
								<option value ="phone">教师电话</option>
								
							</select>
	
							<input type="text" name="neirong1">
							<select name="cx1">
								<option value ="like" >模糊</option>
								<option value ="=">精确</option>
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div id="hiddenDiv2" style="display:none;">
							<select name="tiaojian2">
								<option value ="and">并且</option>
								<option value ="or">或者</option>
								<option value="not">不含</option>
							</select>
							<select name="sname2">
								<option value ="id">教师编号</option>
								<option value="name" >教师姓名</option>
								<option value ="num"  selected="selected">教师身份证号</option>
								<option value="address">教师住址</option>
								<option value ="phone">教师电话</option>
							</select>
		<!-- 					<input  placeholder="" type="text" / > -->
							<input type="text" name="neirong2">
							<select name="cx2">
								<option value ="like" >模糊</option>
								<option value ="=">精确</option>
							</select>
							
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div id="hiddenDiv3" style="display:none;">
							<select name="tiaojian3">
								<option value ="and">并且</option>
								<option value ="or">或者</option>
								<option value="not">不含</option>
							</select>
							<select name="sname3">
								<option value ="id">教师编号</option>
								<option value="name" >教师姓名</option>
								<option value ="num"  >教师身份证号</option>
								<option value="address" selected="selected">教师住址</option>
								<option value ="phone">教师电话</option>
							</select>
		<!-- 					<input  placeholder="" type="text" / > -->
							<input type="text" name="neirong3">
							<select name="cx3">
								<option value ="like" >模糊</option>
								<option value ="=">精确</option>
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div id="hiddenDiv4" style="display:none;">
							<select name="tiaojian4">
								<option value ="and">并且</option>
								<option value ="or">或者</option>
								<option value="not">不含</option>
							</select>
							<select name="sname4">
								<option value ="id">教师编号</option>
								<option value="name" >教师姓名</option>
								<option value ="num"  >教师身份证号</option>
								<option value="address" >教师住址</option>
								<option value ="phone" selected="selected">教师电话</option>
							</select>
		<!-- 					<input  placeholder="" type="text" / > -->
							<input type="text" name="neirong4">
							<select name="cx4">
								<option value ="like" >模糊</option>
								<option value ="=">精确</option>
							</select>
						</div>
					</td>
				</tr>
							
			 <tr>
					<td align="center">
						
							 <a href="javascript:document:zongheform.submit();" target="bottom">检索</a>
							
						</td>
				</tr>
		</table>
		</form>
	</div>
	
	
</div>
<script type="text/javascript">
	function cha(){
		document.getElementById("jieguo").style.display='block';
		return false;
	}
</script>
<script type="text/javascript">
               function blockDiv(){
               var idj = 'hiddenDiv';
               	id=idj+1;
               		div=document.getElementById("hiddenDiv1").style.display;
               for(var i=1;i<=5;i++){
            	   		if(div=='none'){
            	   			document.getElementById(id).style.display='block';
            	   			
            	   			
            	   		}else{
            	   			id=idj+i;
            	   			if(id=='hiddenDiv5'){
            	   				alert('到达上限');
            	   			}
            	   			div=document.getElementById(id).style.display;
            	   		}
            	   
            	   }
               }
               function noneDiv(){
                   var idj = 'hiddenDiv';
                   	id=idj+4;
                   		div=document.getElementById("hiddenDiv4").style.display;
                   for(var i=4;i>=0;i--){
                	   		if(div=='block'){
                	   			document.getElementById(id).style.display='none';
                	   			
                	   		}else{
                	   			id=idj+i;
                	   			div=document.getElementById(id).style.display;
                	   		}
                	   
                	   }
                   }
               
             </script>
           <%
           
           String[] n={"a","ac","bc"};
           
           %> 
<script>
		
    var autoComplete=new AutoComplete('o','auto',[
    	<%
    		for(int i=0;i<3;i++){
    	%>
    	
    	'<%=n[i]%>',
    	
    	
    	<%
    		}
    	%>
    	]);
    
    
    function test1(){
    	  var autoComplete=new AutoComplete('o','auto',[
    	    	<%
    	    		for(int i=0;i<3;i++){
    	    	%>
    	    	
    	    	'<%=n[i]%>',
    	    	
    	    	
    	    	<%
    	    		}
    	    	%>
    	    	]);
    	  autoComplete.start(event);
    	
    }

</script>
</body>
</html>