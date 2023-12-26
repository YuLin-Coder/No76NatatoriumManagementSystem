<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  include file="import.jsp"%>
<%
            KechengService kechengSrv=BeansUtil.getBean("kechengService",KechengService.class);
            String id=request.getParameter("id");
            if(id!=null){
                Kecheng kecheng=kechengSrv.load("where id="+id);
                if(kecheng!=null)
                   request.setAttribute("kecheng",kecheng);
            }
   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>培训课程</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/webui/bootstrap/css/font-awesome.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/leaveword.css" type="text/css"></link>
<script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
</head>
<body>
	<jsp:include page="head.jsp"></jsp:include>
	<input type="hidden" id="commentresurl" value="/e/kechenginfo.jsp?id=<%=id%>" />
	<div class="wrap round-block">
		<div class="line-title">
			当前位置：
			<a href="${pageContext.request.contextPath}/e/index.jsp">首页</a>
			&gt;&gt;
			<a href="${pageContext.request.contextPath}/e/kechenglist.jsp">培训课程</a>
		</div>
		<div class="show-details">
			<div class="picture-box">
				<img id="imgTupian" src="${requestScope.kecheng.tupian}" />
				<div class="operation">
					<div class="ticket-price">图片</div>
				</div>
			</div>
			<div class="text-box">
				<div class="title">${requestScope.kecheng.title}</div>
				<div class="sub-title"></div>
				<div>
					<ul>
						
						<li>
							<strong>课时:</strong>
							${requestScope.kecheng.keshi}小时
						</li>
						<li>
							<strong>上课时间:</strong>
							${requestScope.kecheng.skshijian}
						</li>
						<li>
							<strong>收费标准(元）:</strong>
							${requestScope.kecheng.fee}元
						</li>
						<li>
							<strong>上线时间:</strong>
							${requestScope.kecheng.createtime}
						</li>
						
						<li>
							<strong>教师名:</strong>
							${requestScope.kecheng.tno}-${requestScope.kecheng.tname}
						</li>
						<li>
						     <a class="button" href="${pageContext.request.contextPath}/e/kcbaoming.jsp?id=<%=id%>"><i class="fa fa-plus"></i>报名</a>
						</li>
					</ul>
				</div>
				<div></div>
			</div>
		</div>
		<!--end text-box-->
	</div>
	<!--end show details-->
	<div class="wrap info">
		<div class="brief-title">介绍</div>
		<div class="brief-content">${requestScope.kecheng.des}</div>
		<jsp:include page="comment.jsp">
			<jsp:param value="kecheng" name="commenttype" />
		</jsp:include>
	</div>
	<div class="fn-clear"></div>
	<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>
