<%@ page import="java.util.*"%>
<%@ page import="com.daowen.entity.*" %>
<%@ page import="com.daowen.service.*" %>
<%@ page import="com.daowen.util.*" %>
<%@ page import="com.daowen.uibuilder.*" %>
<%@ page import="java.text.*" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
      Huiyuan tem_huiyuan=null;
      
      if(request.getSession().getAttribute("huiyuan")!=null){
         tem_huiyuan=(Huiyuan)request.getSession().getAttribute("huiyuan");
      }
      else
      {
    	 String url=request.getHeader("Referer");
      	 String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
      	 String forwardurl=url.replace(basePath, "");
      	 forwardurl=java.net.URLEncoder.encode(forwardurl, "UTF-8");
         response.sendRedirect(request.getContextPath()+"/e/login.jsp?forwardurl="+forwardurl);
      }  
      
 %>
