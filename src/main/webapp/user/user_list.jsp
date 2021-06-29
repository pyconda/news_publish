<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.jstl.com" prefix="c" %>
<%@ taglib uri="http://www.jstl.com/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<title>Insert title here</title>
</head>
<body>


	<div style="margin:20px 0;"></div>
	<div class="easyui-panel" title="New Topic" style="width:700px">
		<div style="padding:10px 60px 20px 60px">
	    <a href="${pageContext.request.contextPath}/toAddUser.action">
				<span><img src="images/t01.jpg"/></span>添加用户
			</a>
			
	    <form id="ff" method="post">
	    	<table cellpadding="5">
	    		<tr>
	    			<td>搜索关键字:</td>
	    			<td><input class="easyui-textbox" data-options="required:true" name="keyword" value="${keywords }"
			placeholder="请输入姓名或登录账号" type="text"
			style="width:400px;"class="scinput"/>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>角色:</td>
	    			<td>
	    			<select name="userListRoleId" id="userListRoleId" class="dfinput">
				<option value="">请选择</option>
				<c:forEach items="${roleList }" var="r">
					<option 
					value="${r.roleId }"
					<c:if test="${r.roleId eq userListRoleId }">
					selected="selected" </c:if>
					>
					&nbsp;&nbsp;&nbsp;&nbsp;${r.roleName }
					</option>
				 </c:forEach>
			</select></td>
	    		</tr>
	    	
	    	</table>
	    
	    </form>
	    <div style="text-align:center;padding:5px">
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">提交</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">清除</a>
	    </div>
	    </div>
	</div>
	<script>
		function submitForm(){
			var form = document.getElementById("ff");
            form.submit();
		}
		function clearForm(){
			$('#ff').form('clear');
		}
	</script>


<div style="margin:20px 0;"></div>
	
	<table class="easyui-datagrid" title="Basic DataGrid" style="width:700px;height:250px"
			data-options="singleSelect:true,collapsible:true,url:'datagrid_data1.json',method:'get'">
		<thead>
			<tr>
				<th data-options="field:'itemid',width:80">用户姓名</th>
				<th data-options="field:'productid',width:100">登录账号</th>
				<th data-options="field:'listprice',width:80">联系电话</th>
				<th data-options="field:'unitcost',width:120">注册/修改时间</th>
				<th data-options="field:'attr2',width:80">用户角色</th>
				<th data-options="field:'status',width:80">审核状态</th>
				<th data-options="field:'attr1',width:80">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${!empty userList }">
				<c:forEach items="${userList }" var="user">
				<tr>
					<td align="center">${user.userName }</td>
					<td align="center">${user.loginName }</td>
					<td align="center">${user.tel }</td>
					<td align="center">
						<fmt:formatDate value="${user.registerTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
					</td>
					<td align="center">${user.roleName}</td>
					<td align="center">
						<c:if test="${user.status=='2' }" var="flag">
							已启用
						</c:if>
						<c:if test="${not flag }">
							未启用或被禁用
						</c:if>
					</td>
					<td align="center">
					<a href="${pageContext.request.contextPath}/toEditUser.action?userId=${user.userId}">
					修改
					</a>
					<c:if test="${user.loginName!='admin' }">
							<c:if test="${user.status=='2' }" var="status_flag">
							|<a href='#' onclick="disableUser(${user.userId})">禁用</a>
							</c:if>
							<c:if test="${not status_flag }">
							|<a href='#' onclick="enableUser(${user.userId})">启用</a>
							</c:if>
						|<a href='#' onclick="deleteUser(${user.userId})">删除</a>
					</c:if>
					</td>
					</tr>
					</c:forEach>
					</c:if>
					<c:if test="${empty userList }">
					<div>
						<tr>
						<td colspan="7" align="center">
						暂无用户
						</td>
						</tr>
					</div>
					</c:if>
		</tbody>
	</table>



	
	<script type="text/javascript">
		<!--禁用用户-->
		function disableUser(userId){
			$.ajax({
				url:"${pageContext.request.contextPath}/disableUser.action",
				type:"post",
				data:JSON.stringify({userId:userId,status:3}),
				contentType:"application/json;charset=UTF-8",
				dataType:"json",
				success:function(data){
					if(data!=null){
						if(data.userId>0){
							alert("禁用成功！");
							window.location.reload();
						}else{
							alert("禁用失败");
							window.location.reload();
						}
					}
				}
			
			});
		
		}
		
		<!--启用用户-->
		function enableUser(userId){
			$.ajax({
				url:"${pageContext.request.contextPath}/enableUser.action",
				type:"post",
				data:JSON.stringify({userId:userId,status:2}),
				contentType:"application/json;charset=UTF-8",
				dataType:"json",
				success:function(data){
					if(data!=null){
						if(data.userId>0){
							alert("启用成功！");
							window.location.reload();
						}else{
							alert("启用失败");
							window.location.reload();
						}
					}
				}
			
			});
		
		}
		
		<!--删除用户-->
		function deleteUser(userId){
			if(window.confirm("您确定删除吗？"))
				{
			$.ajax({
				url:"${pageContext.request.contextPath}/deleteUser.action",
				type:"post",
				data:JSON.stringify({userId:userId}),
				contentType:"application/json;charset=UTF-8",
				dataType:"json",
				success:function(data){
					if(data!=null){
						if(data.userId>0){
							alert("删除成功！");
							window.location.reload();
						}else{
							alert("删除失败");
							window.location.reload();
						}
					}
				}
			
			});
				}
		}
	</script>
	</div>
	<script type="text/javascript">
		$('.tablelist tbody tr:odd').addclass('odd');
	</script>
	
	
	
</body>
</html>