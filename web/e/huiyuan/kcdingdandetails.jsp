<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ page  contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="law.jsp"%>
<%
    String  id=request.getParameter("id");
    KcdingdanService dingdanSrv=BeansUtil.getBean("dingdanService", KcdingdanService.class);
    Dingdan temobjdingdan=null;
    if( id!=null){
      temobjdingdan=dingdanSrv.load(" where id="+ id);
      request.setAttribute("dingdan",temobjdingdan);
    }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
  <title>报名订单信息查看</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/register.css" type="text/css"></link>
<link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
</head>
<body >
	<jsp:include page="head.jsp"></jsp:include>
	<div class="wrap">
		<div class="cover-title">
			当前位置：<a href="${pageContext.request.contextPath}/e/index.jsp">首页</a> &gt;&gt; 订单查询
		</div>
	</div>
	<div class="wrap">
		<div class="main">
			<jsp:include page="menu.jsp"></jsp:include>
			<div class="main-content">	
			       <!-----开始---->
				<table cellpadding="0" cellspacing="1" class="grid" width="100%">
					<tr>
						<td width="15%" align="right">订单号:</td>
						<td>${requestScope.dingdan.ddno}</td>
					</tr>
					<tr>
						<td align="right">课程名称:</td>
						<td>${requestScope.dingdan.kcname}</td>
					</tr>
				
					<tr>
						<td align="right">培训教练:</td>
						<td>${requestScope.dingdan.jlname}-${requestScope.dingdan.jlaccount}</td>
					</tr>
					
					<tr>
						<td  align="right">人数:（人次）</td>
						<td>${requestScope.dingdan.renshu}人</td>
					</tr>
					<tr>
						<td  align="right">费用 :</td>
						<td>${requestScope.dingdan.totalfee}元（${requestScope.dingdan.fee}元/人）</td>
					</tr>
	
					<tr>
						<td align="right">下单时间:</td>
						<td><fmt:formatDate value="${requestScope.dingdan.xdtime}"
								pattern="yyyy-MM-dd" /></td>
					</tr>
					<tr>
						<td width="10%" align="right">状态:</td>
						<td>
						     <%if(temobjdingdan.getState()==1) {%>
						                        待付款
						     <%} %>
						      <%if(temobjdingdan.getState()==2) {%>
						                        已付款
						     <%} %>
						
						
						</td>
					</tr>
					<tr>
						<td  align="right">联系电话:</td>
						<td>${requestScope.dingdan.mobile}</td>
					</tr>
					<tr>
						<td align="right">报名人:</td>
						<td>${requestScope.dingdan.hyname}-${requestScope.dingdan.hyaccount}</td>
					</tr>
					
				</table>
				<!-----结束---->
			</div>
	     </div>
	</div>
</body>
</html>
