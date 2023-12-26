<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="law.jsp"%>
<%
	String  id=request.getParameter("id");
    
    Dingdan temobjdingdan=null;
    DingdanService dingdanSrv=BeansUtil.getBean("dingdanService", DingdanService.class);
    DingdanitemsService dditemsSrv=BeansUtil.getBean("dingdanitemsService", DingdanitemsService.class);
    if( id!=null)
    {
      
      temobjdingdan=dingdanSrv.load(" where id="+ id);
      request.setAttribute("dingdan",temobjdingdan);
    }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>订单信息查看</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/e/css/box.all.css"
	type="text/css"></link>
<link href="${pageContext.request.contextPath}/admin/css/web2table.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/uploadifyv3.1/uploadify.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.js"></script>
<script
	src="${pageContext.request.contextPath}/uploadifyv3.1/jquery.uploadify-3.1.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/webui/jquery-validation/jquery.validate.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/webui/jquery-validation/jquery.metadata.js"></script>

<script type="text/javascript">
	$(function() {
	});
</script>
</head>
<body >
	<jsp:include page="head.jsp"></jsp:include>
	<div class="fn-clear"></div>
	
	<div class="wrap round-block">
		<div class="line-title">
			当前位置：<a href="${pageContext.request.contextPath}/e/index.jsp">首页</a> &gt;&gt; 查看订单信息
		</div>
	
		<div class="main">
			<jsp:include page="menu.jsp"></jsp:include>
			<div class="main-content">
				
				<table cellpadding="0" cellspacing="1" class="grid" width="100%">

					<tr>
						<td align="right">订单号:</td>
						<td>${requestScope.dingdan.ddno}</td>

						<td align="right">下单时间:</td>
					    <td><fmt:formatDate value="${requestScope.dingdan.xiadantime}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
					</tr>
					<tr>
						<td align="right">下单人:</td>
						<td>${requestScope.dingdan.xiadanren}</td>

						<td align="right">总价格:</td>
						<td>${requestScope.dingdan.totalprice}</td>
					</tr>
				
					<tr>
						<td align="right">联系电话:</td>
						<td>${requestScope.dingdan.shrtel}</td>

						<td align="right">收货人姓名:</td>
						<td>${requestScope.dingdan.shrname}</td>
					</tr>
						<tr>
						<td align="right">状态:</td>
						<td>
						
						    <c:if test="${requestScope.dingdan.status==1}">
						                     待付款
						    </c:if>
						    <c:if test="${requestScope.dingdan.status==2}">
						                    已付款
						    </c:if>
						    <c:if test="${requestScope.dingdan.status==5}">
						                    已取消
						    </c:if>
						  
						    
						</td>


						
					</tr>

					<tr>
						<td colspan="4">

							<table border="0" cellspacing="1" class="whitegrid"
								cellpadding="0" width="100%">

								<tr>
									<td>快照</td>
									<td>商品名</td>
									<td>商品数量</td>
									<td>价格</td>
								</tr>

								<%
									List<Dingdanitems> listdingdanitems = dditemsSrv.getEntity("where ddno='" + temobjdingdan.getDdno()+ "'");
										for (Dingdanitems items : listdingdanitems) {
								%>
								<tr>

									<td bgcolor="#ffffff"><img src='${pageContext.request.contextPath}<%=items.getSpimage()%>'
										width="60px" height="60px" />
									</td>
									<td><%=items.getSpname()%></td>

									<td><%=items.getShuliang()%></td>

									<td><%=items.getJiage()%>元</td>
								</tr>

								<%
									}
								%>
							</table>
						</td>
					</tr>

					

				</table>
			</div>
		</div>
	 </div>
</body>
</html>
