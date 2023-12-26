<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ page  contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="law.jsp"%>
<%
    String  id=request.getParameter("id");
    KcdingdanService dingdanSrv=BeansUtil.getBean("kcdingdanService", KcdingdanService.class);
    if( id!=null){
      Kcdingdan temobjdingdan=dingdanSrv.load(" where id="+ id);
      request.setAttribute("dingdan",temobjdingdan);
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>报名订单信息查看</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js"></script>
     <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
</head>
<body >
	<div class="search-title">
		<h2>查看报名订单</h2>
		<div class="description"></div>
	</div>
	<table cellpadding="0" cellspacing="1" class="grid" width="100%">
		<tr>
			<td width="10%" align="right">订单号:</td>
			<td>${requestScope.dingdan.ddno}</td>
		</tr>
		<tr>
			<td width="10%" align="right">课程名称:</td>
			<td>${requestScope.dingdan.kcname}</td>
		</tr>
		
		
		
		<tr>
			<td width="10%" align="right">教练名称:</td>
			<td>${requestScope.dingdan.jlaccount}-${requestScope.dingdan.jlname}</td>
		</tr>
		<tr>
			<td width="10%" align="right">人数:</td>
			<td>${requestScope.dingdan.renshu}人</td>
		</tr>
		<tr>
			<td width="10%" align="right">总金额:</td>
			<td>${requestScope.dingdan.totalfee}元</td>
		</tr>
		<tr>
			<td width="10%" align="right">元/人:</td>
			<td>${requestScope.dingdan.fee}</td>
		</tr>
		<tr>
			<td align="right">下单时间:</td>
			<td><fmt:formatDate value="${requestScope.dingdan.xdtime}"
					pattern="yyyy-MM-dd" /></td>
		</tr>
		<tr>
			<td width="10%" align="right">状态:</td>
			<td>
			    <c:if test="${requestScope.dingdan.state==1}">
			                    待付款
			    </c:if>
			    <c:if test="${requestScope.dingdan.state==2}">
			                    已付款
			    </c:if>
			
			</td>
		</tr>
		<tr>
			<td width="10%" align="right">联系电话:</td>
			<td>${requestScope.dingdan.mobile}</td>
		</tr>
		
		<tr>
			<td width="10%" align="right">报名人:</td>
			<td>${requestScope.dingdan.hyaccount}-${requestScope.dingdan.hyname}</td>
		</tr>
	</table>
</body>
</html>
