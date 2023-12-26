<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.daowen.webcontrol.*" %>
<%@  include file="import.jsp"%> 
<%@ taglib prefix="daowen" uri="/daowenpager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <%
    
     //栏目编码
	 String lanmuId=request.getParameter("lanmuid");
     int nlanmuId=0;
     LanmuService lanmuSrv=BeansUtil.getBean("lanmuService", LanmuService.class);
     XinxiService xinxiSrv=BeansUtil.getBean("xinxiService", XinxiService.class);
	 String parentId=request.getParameter("parentid");
	 List<Lanmu> listLanmu=null;
	 if(lanmuId!=null){
	     nlanmuId=Integer.parseInt(lanmuId);
		 Lanmu lanmu=lanmuSrv.load("where id="+lanmuId);
	     if(lanmu!=null)
	        request.setAttribute("lanmu",lanmu);
	     if(lanmu.getIsleaf()!=1){ 
	    	 listLanmu=lanmuSrv.getSublanmus(nlanmuId);
	        parentId=lanmuId;
	     }else 
	     {
	     	if(parentId!=null)
	     		listLanmu=lanmuSrv.getSublanmus(Integer.parseInt(parentId));
	     }
	    
	 }
	 
	request.setAttribute("listLanmu", listLanmu);
	
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
	List<Xinxi> xinxilist =xinxiSrv.findXinxi(nlanmuId,pageindex, pagesize);
	int recordscount =xinxiSrv.getCount(nlanmuId);
	request.setAttribute("listXinxi", xinxilist);
	PagerMetal pm = new PagerMetal(recordscount);
	// 设置尺寸
	pm.setPagesize(pagesize);
	// 设置当前显示页
	pm.setCurpageindex(pageindex);
	// 设置分页信息
	request.setAttribute("pagermetal", pm);
  %>
<head>
<title>网站资讯列表</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>
<script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js" type="text/javascript"></script>
</head>
<body>
	<jsp:include page="head.jsp"></jsp:include>
	<div class="wrap round-block">
		<div class="line-title">
			当前位置：<a href="${pageContext.request.contextPath}/e/index.jsp">首页</a>
			&gt;&gt; ${lanmu.title }
		</div>
		
		  <c:if test="${fn:length(listLanmu)>0 }">
		  <div class="filter-box">
            
              <div class="item">
                 <div class="title">${lanmu.title }:</div>
                 <div class="content-list">
                    <ul>
                        
                       <c:forEach var="lanmu" items="${listLanmu}">
                          <li>
                             <a href="${pageContext.request.contextPath}/e/xinxilist.jsp?lanmuid=${lanmu.id}&parentid=<%=parentId%>">${lanmu.title}</a>
                          </li>
                       </c:forEach>
                    </ul>
                 </div>
             </div>
             
          
          </div>
          </c:if>
	<c:if test="${fn:length(listXinxi) > 0}">
		<div  class="picture-list">
		     <ul>
		       <c:forEach var="xinxi" items="${listXinxi}">
		        <li>
		             <div class="item">
			              <div class="tag">
			                 <span>推荐</span>
			              </div>
		              <div class="img">
					   <a href="${pageContext.request.contextPath}/e/xinxiinfo.jsp?id=${xinxi.id}" >
                            <img src="${pageContext.request.contextPath}${xinxi.tupian2}" />
						 </a>
		              </div>
		               <div class="name">${xinxi.title}</div>
		               <div class="price">${xinxi.clickcount}次</div>
		               <div class="discount">${xinxi.lanmuming}</div>
		           </div>
		        </li>
		        </c:forEach>
		     </ul>
		   </div> 
		   </c:if>
		   <c:if test="${listXinxi== null || fn:length(listXinxi) == 0}">
		        <div style="position:relative;height:400px;">
		     
				     <div
						style="font-size: 26px; position:absolute;left: 50%; top: 50%;transform: translate(-50%, -50%); font-weight: 600;">
						<i class="fa fa-warning"></i>没有找到<span style="color:red;">${requestScope.lanmu.title }</span>信息</div>
				   
				   </div>
		    </c:if>
						<div class="clear"></div>
				<form id="xinxisearchForm" method="post" action="${pageContext.request.contextPath}/e/xinxilist.jsp">
                         <input type="hidden" name="actiontype" value="get" />
                      <input type="hidden" name="lanmuid" value="<%=lanmuId %>" />
                      <%if(parentId!=null){ %>
                      <input type="hidden" name="parentid" value="<%=parentId %>" />
                      <%} %>
                 </form>
		<daowen:pager id="pager1"  attcheform="xinxisearchForm" />
	</div>
	<div class="fn-clear"></div>
	<jsp:include page="bottom.jsp"></jsp:include>
 </body>
</html>
