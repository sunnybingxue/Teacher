<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script language="javascript">  
  
        /*****************************************************  
         *  Share JavaScript (http://www.ShareJS.com)  
         * 使用此脚本程序，请保留此声明  
         * 获取此脚本以及更多的JavaScript程序，请访问 http://www.ShareJS.com  
         ******************************************************/  
      
<!--  
function getValue(_obj){  
 var caiying2007=_obj.parentNode.parentNode.getElementsByTagName("td")[0].innerHTML  
 caiying2007=parseInt(caiying2007.split("(")[1])  
 return caiying2007  
}  
function checkValue(_obj){  
    if(isNaN(_obj.value)){  
        alert("必须是数字");  
        _obj.value=_obj.value.substr(0,_obj.value.length-1)  
        _obj.focus()  
        return false;  
    }  
    var defValue=getValue(_obj)  
    if(_obj.value>defValue){  
        alert("数值过大！\n\n最高分是："+defValue+" 分");  
        _obj.value=_obj.value.substr(0,_obj.value.length-1)  
//        _obj.value=""  
        _obj.focus()  
    }  
}  
onload=function init(){  
 var obj=document.getElementById("form1").getElementsByTagName("input"),j=obj.length  
 for (var i=0;i<j-1;i++)  
  obj[i].onkeyup=function(){checkValue(this)}  
}  
//-->  
</script>  
<form id="form1" name="form1" method="post" action="">  
    <table width="600" border="0" align="center" cellpadding="0" cellspacing="0">  
      <tr>  
        <td><p>求下面的实现要求：</p>  
          <p>一、在输入分数，只动验证输入的有效性：<br />  
            1、  
          一定要数字（可以是小数）</p>  
          <p>2、数值不能大于小题的分值，比如输入8，就提示出错</p>  
          <p>　</p>  
          <p>二、为了提高输入速度，按回车后可以自动跳到下一个输入框</p>  
        <p>到最后一个输入框，回车后就跳到 提交保存 按钮，可以手工提交保存</p></td>  
      </tr>  
    </table>  
    <table width="600" border="0" align="center" cellpadding="0" cellspacing="0" onkeydown="if  
  
(event.keyCode==13)event.keyCode=9">  
      <tr>  
        <td><table width="300" border="0" align="right" cellpadding="0" cellspacing="0">  
          <tr>  
            <td width="104" height="36">题号</td>  
            <td width="196">分值</td>  
            </tr>  
          <tr>  
            <td height="31">第1小题(5分）</td>  
            <td><input name="t1" type="text" id="t1" size="5"  /></td>  
            </tr>  
          <tr>  
            <td height="31">第2小题(6分）</td>  
            <td><input name="t2" type="text" id="t2" size="5" /></td>  
            </tr>  
          <tr>  
            <td height="31">第3小题(7分）</td>  
            <td><input name="t3" type="text" id="t3" size="5" /></td>  
            </tr>  
          <tr>  
            <td height="31">第4小题(8分）</td>  
            <td><input name="t4" type="text" id="t4" size="5" /></td>  
            </tr>  
          <tr>  
            <td height="31">第5小题(9分）</td>  
            <td><input name="t5" type="text" id="t5" size="5" /></td>  
            </tr>  
        </table></td>  
        <td><table width="300" border="0" align="left" cellpadding="0" cellspacing="0">  
          <tr>  
            <td width="93" height="36">题号</td>  
            <td width="207">分值</td>  
            </tr>  
          <tr>  
            <td height="31" nowrap="nowrap">第6小题(15分）</td>  
            <td><input name="t6" type="text" id="t6" size="5" /></td>  
            </tr>  
          <tr>  
            <td height="31">第7小题(25分）</td>  
            <td><input name="t7" type="text" id="t7" size="5" /></td>  
            </tr>  
          <tr>  
            <td height="31">第8小题(35分）</td>  
            <td><input name="t8" type="text" id="t8" size="5" /></td>  
            </tr>  
          <tr>  
            <td height="31">第9小题(45分）</td>  
            <td><input name="t9" type="text" id="t9" size="5" /></td>  
            </tr>  
          <tr>  
            <td height="31">第10小题(55分）</td>  
            <td><input name="t10" type="text" id="t10" size="5" /></td>  
            </tr>  
        </table></td>  
      </tr>  
    </table>  
    <table width="600" border="0" align="center" cellpadding="0" cellspacing="0">  
      <tr>  
        <td align="center"><p>  
          <input type="submit" name="button" id="button" value="提交保存" />  
        </p></td>  
      </tr>  
    </table>  
  </form>  
</body>
</html>
<script>
// $(function () { 
//     $('input:text:first').focus(); //获取第一个焦点
//     var $inp = $('input:text'); //定义全部焦点
//     $inp.bind('keydown', function (e) {// 绑定事件
//         var key = e.which;//定义按键
//         if (key == 13) {//回车事件
//             e.preventDefault();
//             var nxtIdx = $inp.index(this) + 1;
//             $(":input:text:eq(" + nxtIdx + ")").focus();
//             if(nxtIdx==3){
//                 $('textarea').focus();
//             }
//         }
//     });
// });
</script>