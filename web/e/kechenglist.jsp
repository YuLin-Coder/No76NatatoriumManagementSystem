<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.daowen.webcontrol.*" %>
<%@ taglib prefix="daowen" uri="/daowenpager"%>
<%@  include file="import.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <%
    KechengService kechengSrv=BeansUtil.getBean("kechengService",KechengService.class);
    String  filter="";
    int pageindex = 1;
	int pagesize = 10;
	// 获取当前分页
	String currentpageindex = request.getParameter("currentpageindex");
	// 当前页面尺寸
	String currentpagesize = request.getParameter("pagesize");
	// 设置当前页
	if (currentpageindex != null)
		pageindex = new Integer(currentpageindex);
	// 设置当前页尺寸
	if (currentpagesize != null)
		pagesize = new Integer(currentpagesize);
	List<Kecheng> kechenglist = kechengSrv.getPageEntitys(filter,pageindex, pagesize);
	int recordscount = kechengSrv.getRecordCount(filter == null ? "": filter);
	request.setAttribute("listKecheng", kechenglist);
	PagerMetal pm = new PagerMetal(recordscount);
	// 设置尺寸
	pm.setPagesize(pagesize);
	// 设置当前显示页
	pm.setCurpageindex(pageindex);
	// 设置分页信息
	request.setAttribute("pagermetal", pm);
  %>
<head>
<title>培训课程列表</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>
<script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
</head>
<body>
	<jsp:include page="head.jsp"></jsp:include>
	<div class="wrap round-block">
		<div class="line-title">
			当前位置：<a href="${pageContext.request.contextPath}/e/index.jsp">首页</a>
			&gt;&gt; 培训课程查询
		</div>
		<div class="picture-list">
			<ul>
				<c:forEach var="kecheng" items="${listKecheng}">
					<li>
						<div class="item">
							<div class="tag">
								<span>推荐</span>
							</div>
							<div class="img">
								<a href="${pageContext.request.contextPath}/e/kechenginfo.jsp?id=${kecheng.id}">
									<img src="${kecheng.tupian}"/>
								</a>
							</div>
							<div class="name">${kecheng.title}</div>
							<div class="price">${kecheng.fee}元</div>
							<div class="discount">${kecheng.keshi }课时</div>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
		<c:if test="${listKecheng== null || fn:length(listKecheng) == 0}">
			<div class="no-record-tip">
				<div class="content">
					<i class="fa fa-warning"></i>没有找到相关培训课程
				</div>
			</div>
		</c:if>
		<div class="clear"></div>
		<form id="kechengsearchForm" method="post" action="${pageContext.request.contextPath}/e/kechenglist.jsp">
			<input type="hidden" name="actiontype" value="get"/>
			<input type="hidden" name="forwardurl" value="/e/kechenglist.jsp"/>
		</form>
		<daowen:pager id="pager1" attcheform="kechengsearchForm"/>
	</div>
	<div class="fn-clear"></div>
	<jsp:include page="bottom.jsp"></jsp:include>
 </body>
</html>
