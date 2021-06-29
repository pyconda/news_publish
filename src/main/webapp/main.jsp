<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>新闻发布管理系统</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
	var url;
	
	function openTab(text,url,iconCls){
		if($("#tabs").tabs("exists",text)){
			$("#tabs").tabs("select",text);
		}else{
			var content="<iframe frameborder=0 scrolling='auto' style='width:100%;height:100%' src='${pageContext.request.contextPath}/"+url+"'></iframe>";
			$("#tabs").tabs("add",{
				title:text,
				iconCls:iconCls,
				closable:true,
				content:content
			});
		}
	}
	
	function openPasswordModifyDialog(){
		$("#dlg").dialog("open").dialog("setTitle","修改密码");
		url="${pageContext.request.contextPath}/modifyPassword.action?userId=${login_user.userId}";
	}
	
	function closePasswordModifyDialog(){
		$("#dlg").dialog("close");
		$("#oldPassword").val("");
		$("#newPassword").val("");
		$("#newPassword2").val("");
	}
	
	function modifyPassword(){
		$("#fm").form("submit",{
			url:url,
			onSubmit:function(){
				var oldPassword=$("#oldPassword").val();
				var newPassword=$("#newPassword").val();
				var newPassword2=$("#newPassword2").val();
				if(!$(this).form("validate")){
					return false;
				}
				if(oldPassword!='${login_user.password}'){
					$.messager.alert("系统提示","用户密码输入错误！");
					return false;
				}
				if(newPassword!=newPassword2){
					$.messager.alert("系统提示","确认密码输入错误！");
					return false;
				}
				return true;
			},
			success:function(result){
				var result=eval('('+result+')');
				if(result.success){
					$.messager.alert("系统提示","密码修改成功，下一次登录生效！");
					closePasswordModifyDialog();
				}else{
					$.messager.alert("系统提示","密码修改失败");
					return;
				}
			}
		});
	}
	
	function logout(){
		$.messager.confirm("系统提示","您确定要退出系统吗",function(r){
			if(r){
				window.location.href="${pageContext.request.contextPath}/logout.action";
			}
		});
	}
	

</script>
</head>
<body class="easyui-layout">
<div region="north" style="height: 78px;background-color: #E0ECFF">
	<table style="padding: 5px" width="100%">
		<tr>
			<td width="1%">
				<img src="${pageContext.request.contextPath}/images/bg.jpg"/>

			</td><td width="10%">
			
				<h1>新闻发布管理系统</h1>
			</td>
			<td valign="bottom" align="right" width="50%">
				<font size="3">&nbsp;&nbsp;<strong>欢迎：</strong>${login_user.userName }</font>
			</td>
		</tr>
	</table>
</div>
<div region="center">
	<div class="easyui-tabs" fit="true" border="false" id="tabs">
		<div title="首页" data-options="iconCls:'icon-home'">
			<div align="center" style="padding-top: 100px"><font color="red" size="10">欢迎使用</font></div>
		</div>
	</div>
</div>
<div region="west" style="width: 200px" title="导航菜单" split="true">
	<div class="easyui-accordion" data-options="fit:true,border:false">
		<div title="用户管理" data-options="selected:true,iconCls:'icon-yxgl'" style="padding: 10px">
			<a href="javascript:openTab('用户列表','findUserList.action','icon-yxjhgl')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-yxjhgl'" style="width: 150px;">用户列表</a>
			<a href="javascript:openTab('添加用户','toAddUser.action','icon-khkfjh')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-khkfjh'" style="width: 150px;">添加用户</a>
		</div>
		
		<div title="新闻管理"  data-options="iconCls:'icon-khgl'" style="padding:10px;">
			<a href="javascript:openTab('新闻列表','findNewsByPage.action','icon-khxxgl')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-khxxgl'" style="width: 150px;">新闻列表</a>
			<a href="javascript:openTab('发布新闻','toAddNews.action','icon-khlsgl')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-khlsgl'" style="width: 150px;">发布新闻</a>
		</div>
		
		<div title="新闻类型管理"  data-options="iconCls:'icon-khgl'" style="padding:10px;">
			<a href="javascript:openTab('新闻类型列表','getCategoryList.action','icon-khxxgl')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-khxxgl'" style="width: 150px;">新闻类型列表</a>
			<a href="javascript:openTab('增加新闻类型','toAddCategory.action','icon-khlsgl')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-khlsgl'" style="width: 150px;">添加新闻类型</a>
		</div>

		<div title="系统管理"  data-options="iconCls:'icon-item'" style="padding:10px">
			<a href="javascript:openPasswordModifyDialog()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-modifyPassword'" style="width: 150px;">修改密码</a>
			<a href="javascript:logout()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-exit'" style="width: 150px;">安全退出</a>
		</div>
	</div>
</div>
<div region="south" style="height: 25px;padding: 5px;" align="center">
	版权所有   <a href="http://www.java1234.com" target="_blank">@chenzhi</a> (2013-2015)
</div>


<div id="dlg" class="easyui-dialog" style="width: 400px;height:250px;padding: 10px 20px"
  closed="true" buttons="#dlg-buttons">
 	<form id="fm" method="post">
 		<table cellspacing="8px">
 			<tr>
 				<td>用户名：</td>
 				<td><input type="text" id="userName" name="userName" value="${login_user.userName }" readonly="readonly" style="width: 200px"/></td>
 			</tr>
 			<tr>
 				<td>原密码：</td>
 				<td><input type="password" id="oldPassword" class="easyui-validatebox" required="true" style="width: 200px"/></td>
 			</tr>
 			<tr>
 				<td>新密码：</td>
 				<td><input type="password" id="newPassword" name="password" class="easyui-validatebox" required="true" style="width: 200px"/></td>
 			</tr>
 			<tr>
 				<td>确认新密码：</td>
 				<td><input type="password" id="newPassword2"  class="easyui-validatebox" required="true" style="width: 200px"/></td>
 			</tr>
 		</table>
 	</form>
</div>

<div id="dlg-buttons">
	<a href="javascript:modifyPassword()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
	<a href="javascript:closePasswordModifyDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
</div>
</body>
</html>