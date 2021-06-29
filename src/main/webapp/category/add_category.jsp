<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.jstl.com" prefix="c" %>
<%@ taglib uri="http://www.jstl.com/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="${pageContext.request.contextPath }/addCategory.action" name="ff"
	method="post" onsubmit="return checkValue()">
	
	
	新闻类别id:<br>

	<input id="categoryId" name="categoryId" value="${category.categoryId }" type="text"/><br>
	新闻类别名称:<br>

	<input id="categoryName" name="categoryName" value="${category.categoryName }" type="text"/><br>
	


	<input name="" type="submit" value="确认发布"/>
	&nbsp;&nbsp;<input name="" type="button" onclick="goback();" value="返回列表"/>
	</form>
	<script>
		function goback(){
			window.location.href="${pageContext.request.contextPath}/getCategoryList.action";
		}
		function checkValue(){
			
			var str=document.getElementById("categoryId").value;
			if(str==''){
				alert("请填写新闻id");
				return false;
			}
			var str=document.getElementById("categoryName").value;
			if(str==''){
				alert("请填写新闻类别");
				return false;
			}
			return true;
		}
		
	</script> 
</body>
</html>