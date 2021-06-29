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

			<a href="${pageContext.request.contextPath}/toAddNews.action">
				<span><img src="images/t01.jpg"/></span>添加新闻
			</a>
	
		
		
	    <form id="ff"    method="post" >
	    	<table cellpadding="5">
	    		<tr>
	    			<td>搜索关键词:</td>
	    			<td>
	    			<input  class="easyui-textbox" name="keywords" value="${keywords }"
					placeholder="这里输入标题或关键词" type="text"
					style="width:400px;"class="scinput"/></input></td>
	    		</tr>
	    		<tr>
	    			<td>新闻类别:</td>	&nbsp;&nbsp;
	    			<td>
	    		<select name="newsListCategoryId" id="newsListCategoryId" class="dfinput">
				<option value="">请选择</option>
					<c:forEach items="${categoryList }" var="c">
						<option value="${c.categoryId}"
					
					>
					&nbsp;&nbsp;&nbsp;&nbsp;${c.categoryName }
					</option>
				 </c:forEach>
			</select></td>
	    		</tr>
	    		
	    	</table>
	    </form>
	     <div style="text-align:center;padding:5px">
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">查询</a>
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

	
	<table class="easyui-datagrid" style="width:700px;height:250px" >
   <thead>
		<tr>
			<th data-options="field:'title',width:130">新闻标题</th>
            <th data-options="field:'style',width:130">新闻类别</th>
             <th data-options="field:'publish_time',width:130">发布/更新时间</th>
              <th data-options="field:'publish_status',width:130">发布状态</th>
            <th data-options="field:'select',width:130">操作</th>
	
		</tr>
		</thead>
		
		<tbody>
			<c:if test="${!empty pb.list}">
				<c:forEach items="${pb.list }" var="news">
				<tr>
					<td align="center">${news.title }</td>
					<td align="center">${news.categoryName }</td>
					<td align="center">
						<fmt:formatDate value="${news.publishTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
					</td>
					<td align="center">
						<c:if test="${news.publishStatus=='1' }" var="flag">
							已发布
						</c:if>
						<c:if test="${not flag }">
							已撤稿
						</c:if>
					</td>
					<td align="center">
					<a href="${pageContext.request.contextPath}/toEditNews.action?newsId=${news.newsId}">
					修改
					</a>
			
							<c:if test="${news.publishStatus=='2' }" var="status_flag">
							|<a href='#' onclick="upNews(${news.newsId})">发布</a>
							</c:if>
							
							
							<c:if test="${not status_flag }">
							|<a href='#' onclick="downNews(${news.newsId})">撤稿</a>
							</c:if>
						
						|<a href='#' onclick="deleteNews(${news.newsId})">删除</a>
		
					</td>
					</tr>
					</c:forEach>
					</c:if>
					
					

					
					
					
					
					<c:if test="${empty pb.list }">
					<div>
						<tr>
						<td colspan="5" align="center">
						暂无新闻
						</td>
						</tr>
					</div>
					</c:if>
		</tbody>
	</table>
						<tr>
					<td colspan="9" align="center">
					<div class="pagination">
						第${pb.currentPage }页
						&nbsp;&nbsp;共${pb.totalPage }页
						&nbsp;&nbsp;共${pb.count }条新闻
						<div style="height:10px;"></div>
						<c:if test="${pb.currentPage==1 }">首页&nbsp;&nbsp;上一页</c:if>
							<c:if test="${pb.currentPage>1 }">
								<a href="#" onclick="fy(1)">首页</a>
								<a href="#" onclick="fy(${pb.currentPage-1})">上一页</a>
							</c:if>
							<c:if test="${pb.currentPage<pb.totalPage }">
								<a href="#" onclick="fy(${pb.currentPage+1})">下一页</a>
								<a href="#" onclick="fy(${pb.totalPage})">尾页</a>
							</c:if>
							<c:if test="${pb.currentPage==pb.totalPage }">
							下一页&nbsp;&nbsp;尾页</c:if>&nbsp;&nbsp;
							跳转至
			<input type="text" style="height:22px;width:30px;" value="${gotoPageNo }" name="gotoPageNo" id="gotoPageNo">页
							<a href="#" onclick="validate()">跳转</a>
					</div>
					</td>
					</tr>
	
	
	
	<script type="text/javascript">
	
		<!--发布新闻-->
		function upNews	(newsId){
			$.ajax({
				url:"${pageContext.request.contextPath}/setNewsPublishStatus.action",
				type:"post",
				data:JSON.stringify({newsId:newsId,publishStatus:1}),
				contentType:"application/json;charset=UTF-8",
				dataType:"json",
				success:function(data){
					if(data!=null){
						if(data.newsId>0){
							alert("发布成功！");
							window.location.reload();
						}else{
							alert("发布失败");
							window.location.reload();
						}
					}
				}
			
			});
		
		}
		
		<!--撤稿新闻-->
		function downNews(newsId){
			$.ajax({
				url:"${pageContext.request.contextPath}/setNewsPublishStatus.action",
				type:"post",
				data:JSON.stringify({newsId:newsId,publishStatus:2}),
				contentType:"application/json;charset=UTF-8",
				dataType:"json",
				success:function(data){
					if(data!=null){
						if(data.newsId>0){
							alert("撤稿成功！");
							window.location.reload();
						}else{
							alert("撤稿失败");
							window.location.reload();
						}
					}
				}
			
			});
		
		}

		<!--删除用户-->
		function deleteNews(newsId){
			if(window.confirm("您确定删除吗？"))
				{
			$.ajax({
				url:"${pageContext.request.contextPath}/deleteNews.action",
				type:"post",
				data:JSON.stringify({newsId:newsId}),
				contentType:"application/json;charset=UTF-8",
				dataType:"json",
				success:function(data){
					if(data!=null){
						if(data.newsId>0){
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
		
		//翻页
		function fy(gotoPageNo)
		{
		
	
			var form = document.getElementById("ff");
			form.action=
				"${pageContext.request.contextPath}/findNewsByPage.action?currentPage="+gotoPageNo;
				form.submit();
				
		}
		//跳转验证
		function validate(){

			var totalPage=${pb.totalPage};
			var gotoPageNo=document.getElementById("gotoPageNo").value;
			if(gotoPageNo>totalPage || gotoPageNo<=0){
				alert("输入页码有错");
			}else{
				fy(gotoPageNo);
				return true;
			}
			fy(gotoPageNo);
			return true;
		}
		
		
	</script>
	</div>
	<script type="text/javascript">
		$('.tablelist tbody tr:odd').addClass('odd');
	</script>
	
	
	
</body>
</html>