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
<form action="${pageContext.request.contextPath }/addNews.action" name="ff"
	method="post" onsubmit="return checkValue()">
	<input id="newsId" name="newsId" value="${news.newsId }" type="hidden" />
	新闻标题:<br>
	<input id="title" name="title" value="${news.title }" type="text"/><br>
	新闻类别:<br>
	<select name="categoryId" id="categoryId">
		<option value="">--请选择--</option>
		<c:forEach items="${categoryList }" var="c">
			<option value="${c.categoryId }"
				<c:if test="${c.categoryId eq news.categoryId }">
					selected="selected"
				</c:if>
				>
				${c.categoryName }
			</option>
			</c:forEach>
	</select><br>
	新闻内容标题：<br>
	<input id="contentTitle" name="contentTitle" value="${news.contentTitle }" type="text"/>
	<hr>
	内容摘要:<br>
	<textarea id="contentAbstract" name="contentAbstract" cols="100" rows="2"
		style="width:800px;height:50px;">${news.contentAbstract }</textarea>
	<hr>
	内容：<br>
	<textarea id="content" name="content" cols="100" rows="4"
		style="width:800px;heigh:100px;">${news.content}</textarea><br>
	关键词：<br>
	<input id="keywords" name="keywords" value="${news.keywords }" type="text"/><br>
	作者/来源:<br>
	<input id="author" name="author" value="${news.author }" type="text"/><br>
	<input name="" type="submit" value="确认发布"/>
	&nbsp;&nbsp;<input name="" type="button" onclick="goback();" value="返回列表"/>
	</form>
	<script>
		function goback(){
			window.location.href="${pageContext.request.contextPath}/findNewsByPage.action";
		}
		function checkValue(){
			var str=document.getElementById("title").value;
			if(str.length<1){
				alert("新闻标题");
				document.getElementById("title").focus();
				return false;
			}
			str=document.getElementById("categoryId").value;
			if(str==''){
				alert("请选择新闻类别");
				return false;
			}
			str = document.getElementById("contentTitle").value;
			if(str.length<1){
				alert("新闻内容页标题");
				document.getElementById("contentTitle").focus();
				return false;
			}
			str = document.getElementById("content").value;
			if(str.length<1){
				alert("请输入新闻内容");
				document.getElementById("content").focus();
				return false;
			}
			return true;
		}
		
	</script> 
</body>
</html>