﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ include file="law.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="daowen" uri="/daowenpager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>留言信息</title>
    <script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/webui/combo/combo.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/webui/treetable/skin/jquery.treetable.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/webui/treetable/skin/jquery.treetable.theme.default.css" rel="stylesheet"
        type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/treetable/js/jquery.treetable.js" type="text/javascript"></script>
     <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript">
			$(function() {
			    $("#btnDelete").click(function(){
			        if($(".check:checked").length<1)
			        {
			           top.$.dialog.alert("请选择需要删除的记录");
			           return;
			        } 
			        $(".check:checked").each(function(index,domEle){
			             var id=$(domEle).val();
			             top.$.dialog.confirm("你确定要注销留言信息?", function(){
				             window.location.href=encodeURI('${pageContext.request.contextPath}/admin/leavewordmanager.do?forwardurl=/zhiyuan/leavewordmanager.jsp&actiontype=delete&id='+id);
				         });
			        });
			    });
			    $("#btnCheckAll").click(function(){
			           var ischeck=false;
			           $(".check").each(function(){
			               if($(this).is(":checked"))
			               {
			                  $(this).prop("checked","");
			                  ischeck=false;
			                }
			               else
			               {
			                  $(this).prop("checked","true");
			                  ischeck=true;
			                }
			           });
			           if($(this).text()=="选择记录")
			              $(this).text("取消选择");
			           else
			              $(this).text("选择记录");
			    })
			});
       </script>
	</head>
	 <body >
	<div class="search-title">
		<h2>留言管理</h2>
		<div class="description">
			
		</div>
	</div>
	<!-- 搜索控件开始 -->
	<div class="search-options">
		<form id="searchForm"
			action="${pageContext.request.contextPath}/admin/leavewordmanager.do"
			method="post">
			<table cellspacing="0" width="100%">
				<tbody>
					<tr>
						<td>标题 <input name="title" value="${title}" class="input-txt"
							type="text" id="title" /> <input type="hidden"
							name="actiontype" value="search" /> <input type="hidden"
							name="seedid" value="${seedid}" /> <input type="hidden"
							name="forwardurl" value="/admin/leavewordmanager.jsp" />
							<div class="ui-button">
								<button class="ui-button-text">搜索</button>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<!-- 搜索控件结束 -->
	<div class="clear"></div>
	<div class="action-details">
		<span class="orange-href" id="btnCheckAll">选择</span> <span
			id="btnDelete" class="orange-href"> 删除 </span>
	</div>
	<table id="leaveword" width="100%" border="0" cellspacing="0"
		cellpadding="0" class="ui-record-table">
		<thead>
			<tr>
				<th>选择</th>
				<th><b>留言内容</b></th>
				<th><b>发布时间</b></th>
				<th><b>状态</b></th>
				<th><b>留言人</b></th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${listleaveword== null || fn:length(listleaveword) == 0}">
				<tr>
					<td colspan="20">没有相关留言信息</td>
				</tr>
			</c:if>
			<%	
								        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
									if(request.getAttribute("listleaveword")!=null)
								      {
									  List<Leaveword> listleaveword=( List<Leaveword>)request.getAttribute("listleaveword");
								     for(Leaveword  temleaveword  :  listleaveword)
								      {
							%>
			<tr>
				<td>&nbsp<input id="chk<%=temleaveword.getId()%>" class="check"
					name="chk<%=temleaveword.getId()%>" type="checkbox"
					value='<%=temleaveword.getId()%>'></td>
				
				<td><%=temleaveword.getDcontent()%></td>
				<td><%=sdf.format(temleaveword.getPubtime())%></td>
				
				
				
				<td><%if(temleaveword.getStatus()==0){%>
				               等待回复
				    <%} %>
				    <%if(temleaveword.getStatus()==1){%>
				                已回复
				    <%} %>
				</td>
				<td><%=temleaveword.getLwren()%></td>
				<td>
				   <%if(temleaveword.getStatus()==0){ %>
				      <a class="orange-href"
					href="${pageContext.request.contextPath}/admin/lwreply.jsp?id=<%=temleaveword.getId()%>">回复</a>
				   <%} else{%>
					 <a class="orange-href"
					     href="${pageContext.request.contextPath}/admin/leaveworddetails.jsp?id=<%=temleaveword.getId()%>">查看</a>
					<%} %>
				</td>
			</tr>
			<%}}%>
		</tbody>
	</table>
	<div class="clear"></div>
	<daowen:pager id="pager1" attcheform="searchForm" />
</body>
</html>
