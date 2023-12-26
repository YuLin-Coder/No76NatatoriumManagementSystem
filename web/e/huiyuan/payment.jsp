<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ page  contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="law.jsp"%>
<%
	String  id=request.getParameter("id");
	KcdingdanService dingdanSrv=BeansUtil.getBean("kcdingdanService", KcdingdanService.class);
	Kcdingdan temobjdingdan=null;
	if(id!=null){
	  temobjdingdan=dingdanSrv.load(" where id="+ id);
	  request.setAttribute("dingdan",temobjdingdan);
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
 <head>
  <title>报名订单信息查看</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>

<script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
</head>
<body >
	<jsp:include page="head.jsp"></jsp:include>
	<div class="wrap round-block">
		<div class="line-title">
			当前位置：<a href="${pageContext.request.contextPath}/e/index.jsp">首页</a> &gt;&gt; 报名订单管理
		</div>
	
		<div class="main">
			<jsp:include page="menu.jsp"></jsp:include>
			<div class="main-content">	
			       <!-----开始---->
				
			<form name="dingdanform"  method="post" action="${pageContext.request.contextPath}/admin/kcdingdanmanager.do"  id="dingdanForm">
			
			      <input type="hidden" name="ddid" value="<%=id %>" />
						        <input type="hidden" name="actiontype" value="payment" />

						         <input type="hidden" name="errorurl" value="/e/huiyuan/payment.jsp?id=<%=id %>" />
						        <input type="hidden" name="forwardurl" value="/e/huiyuan/payresult.jsp" />
				<table cellpadding="0" cellspacing="1" class="grid" width="100%">
					
					
					<tr>
						<td width="15%" align="right">订单号:</td>
						<td>${requestScope.dingdan.ddno}</td>
					</tr>
					<tr>
						<td  align="right">课程名称:</td>
						<td>${requestScope.dingdan.kcname}</td>
					</tr>
					
					<tr>
						<td  align="right">培训教练:</td>
						<td>${requestScope.dingdan.jlname}-${requestScope.dingdan.jlaccount}</td>
					</tr>
					
					<tr>
						<td  align="right">人数:（人次）</td>
						<td>${requestScope.dingdan.renshu}人</td>
					</tr>
					
	
					<tr>
						<td align="right">下单时间:</td>
						<td><fmt:formatDate value="${requestScope.dingdan.xdtime}"
								pattern="yyyy-MM-dd" /></td>
					</tr>
					<tr>
						<td  align="right">状态:</td>
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
						<td  align="right">报名人:</td>
						<td>${requestScope.dingdan.hyname}-${requestScope.dingdan.hyaccount}</td>
					</tr>
					<tr>
						<td  align="right">支付金额 :</td>
						<td>${requestScope.dingdan.totalfee}元</td>
					</tr>
						<tr>
							<td align="right">支付密码 :</td>
							<td colspan="3" align="left"><input name="paypwd"
								value="${paypwd}"
								validate="{required:true,messages:{required:'请输入支付密码'}}"
								type="password" class="input-txt" />${errormsg}</td>

						</tr>
						<tr>
							<td colspan="2">
								
									<button class="btn btn-default">
										<i class="fa fa-check"></i>付款
									</button>
								
							</td>
						</tr>

					</table>
				
				</form>
				<!-----结束---->
			</div>
	     </div>
	</div>
</body>
</html>
