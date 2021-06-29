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

			<a href="${pageContext.request.contextPath}/toAddCategory.action">
				<span><img src="images/t01.jpg"/></span>添加新闻类别
			</a>
	
		
		
	   
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

	
	<table class="easyui-datagrid" style="width:700px;height:250px" >
   <thead>
		<tr>
			 <th data-options="field:'id',width:130">新闻类别id</th>

            <th data-options="field:'style',width:130">新闻类别</th>

            <th data-options="field:'select',width:130">操作</th>
	
		</tr>
		</thead>
		
		<tbody>
			<c:if test="${!empty categoryList}">
				<c:forEach items="${categoryList }" var="ct">
				<tr>
	
					<td align="center">${ct.categoryId }</td>
			 
					<td align="center">${ct.categoryName }</td>
					
					<td align="center">
					
			
							
						
						|<a href='#' onclick="deleteCategory(${ct.categoryId})">删除</a>
		
					</td>
					</tr>
					</c:forEach>
					</c:if>
					
					

					
					
					
					
					<c:if test="${empty categoryList }">
					<div>
						<tr>
						<td colspan="5" align="center">
						暂无新闻类别
						</td>
						</tr>
					</div>
					</c:if>
		</tbody>
	</table>
					
	
	
	<script type="text/javascript">
	
		
		<!--删除用户-->
		function deleteCategory(categoryId){
			if(window.confirm("您确定删除吗？"))
				{
			$.ajax({
				url:"${pageContext.request.contextPath}/deleteCategory.action",
				type:"post",
				data:JSON.stringify({categoryId:categoryId}),
				contentType:"application/json;charset=UTF-8",
				dataType:"json",
				success:function(data){
					if(data!=null){
						if(data.categoryId>0){
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
		$('.tablelist tbody tr:odd').addClass('odd');
	</script>
	
	
	
</body>
</html>