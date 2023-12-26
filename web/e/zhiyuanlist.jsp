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
    ZhiyuanService zhiyuanSrv=BeansUtil.getBean("zhiyuanService",ZhiyuanService.class);
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
	List<Zhiyuan> zhiyuanlist = zhiyuanSrv.getPageEntitys(filter,pageindex, pagesize);
	int recordscount = zhiyuanSrv.getRecordCount(filter == null ? "": filter);
	request.setAttribute("listZhiyuan", zhiyuanlist);
	PagerMetal pm = new PagerMetal(recordscount);
	// 设置尺寸
	pm.setPagesize(pagesize);
	// 设置当前显示页
	pm.setCurpageindex(pageindex);
	// 设置分页信息
	request.setAttribute("pagermetal", pm);
  %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>员工列表</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>
<script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js" type="text/javascript"></script>
</head>
<body>
	<jsp:include page="head.jsp"></jsp:include>
	<div class="wrap round-block">
		<div class="line-title">
			当前位置：<a href="${pageContext.request.contextPath}/e/index.jsp">首页</a>
			&gt;&gt; 教练信息
		</div>
		<div  class="picture-list">
		     <ul>
		       <c:forEach var="zhiyuan" items="${listZhiyuan}">
		        <li>
		             <div class="item">
			              <div class="tag">
			                 <span>优秀</span>
			              </div>
		              <div class="img">
					   <a href="${pageContext.request.contextPath}/e/zhiyuaninfo.jsp?id=${zhiyuan.id}" >
                          <img src="${pageContext.request.contextPath}${zhiyuan.photo}" />
						 </a>
		              </div>
		               <div class="name">${zhiyuan.name}</div>
		               <div class="price">${zhiyuan.zhiwu}</div>
		           </div>
		        </li>
		        </c:forEach>
		     </ul>
		   </div>
		   <c:if test="${listZhiyuan== null || fn:length(listZhiyuan) == 0}">
		       <div style="font-size:26px;padding-left:200px;padding-top:150px;color:red;font-weight:600;">
没有找到相关员工信息
		       </div>
		    </c:if>
						<div class="clear"></div>
				<form id="zhiyuansearchForm" method="post" action="${pageContext.request.contextPath}/e/zhiyuanlist.jsp">
<input type="hidden" name="actiontype" value="get" />
                      <input type="hidden" name="forwardurl" value="/e/zhiyuanlist.jsp" />
                 </form>
		<daowen:pager id="pager1"  attcheform="zhiyuansearchForm" />
	</div>
	<div class="fn-clear"></div>
	<jsp:include page="bottom.jsp"></jsp:include>
 </body>
</html>
