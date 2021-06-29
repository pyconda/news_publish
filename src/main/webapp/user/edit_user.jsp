<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.jstl.com" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<form acton="${pageContext.request.contextPath }/addUser.action" name="ff"
	method="post" onsubmit="return checkValue()">
	<input id="userId" name="userId" value="${user.userId }" type="hidden"/>
	登录账号：
<input id="loginName" name="loginName" value="${user.loginName }" type="text"/>
&nbsp;<font style="color:Red;">${checkUserLoginNameMsg }</font>
密码：
<input id="password" name="password" type="password"/>
用户姓名：
<input id="userName" name="userName" value="${user.userName }" type="text"/>
电话号码:
<input id="tel" name="tel" value="${user.tel }" type="text"/>
用户角色：
<select name="roleId" id="roleId">
	<option value="">--请选择--</option>
	<c:forEach items="${roleList }" var="r">
		<option value="${r.roleId }"
			<c:if test="${r.roleId eq user.roleId }">
			selected="selected"
			</c:if>
			>
			${r.roleName }
			</option>
			</c:forEach>
</select>

<input name="" type="submit" value="确认添加"/>
&nbsp;&nbsp;
<input name="" type="button" onclick="goback();" value="返回列表"/>
</form>

<script>
	function goback(){
		window.location.href="${pageContext.request.contextPath}/findUserList.action";
	}
	function checkValue(){
		var str = document.getElementById("loginName").value;
		if(str.length<1){
			alert("请输入登录账号");
			document.getElementById("loginName").focus();
			return false;
		}
		str=document.getElementById("password").value;
		if(str.length<1){
			alert("请输入密码");
			document.getElementById("password").focus();
			return false;
		}
		if(str.length>0 && str.length<0){
			alert("密码长度应大于等于6");
			document.getElementById("password").focus();
			return false;
		}
		str=document.getElementById("userName").value();
		if(str.length<1){
			alert("请输入用户姓名");
			document.getElementById("userName").focus();
			return false;
		}
		str = document.getElementById("roleId").value();
		if(str == ''){
			alert("请选择用户角色");
			return false;
		}
		return true;
	}
</script>	 


</body>
</html>