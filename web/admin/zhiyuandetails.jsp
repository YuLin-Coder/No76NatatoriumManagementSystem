<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ page  contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="law.jsp"%>
<%
    String  id=request.getParameter("id");
    ZhiyuanService zhiyuanSrv=BeansUtil.getBean("zhiyuanService", ZhiyuanService.class);
    if( id!=null)
    {
      Zhiyuan temobjzhiyuan=zhiyuanSrv.load(" where id="+ id);
      request.setAttribute("zhiyuan",temobjzhiyuan);
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>员工信息查看</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js"></script>
     <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
</head>
<body >
	<div class="search-title">
		<h2>查看员工</h2>
		<div class="description"></div>
	</div>
	<table cellpadding="0" cellspacing="1" class="grid" width="100%">
		<tr>
			<td width="10%" align="right">账户名:</td>
			<td>${requestScope.zhiyuan.accountname}</td>
			<td colspan="2" rowspan="6"><img id="imgPhoto" width="200px" height="200px"
				src="${pageContext.request.contextPath}${requestScope.zhiyuan.photo}" /></td>
		</tr>
		
		<tr>
			<td width="10%" align="right">姓名:</td>
			<td>${requestScope.zhiyuan.name}</td>
		</tr>
		<tr>
			<td align="right">性别:</td>
			<td>${requestScope.zhiyuan.sex}</td>
		</tr>
		<tr>
			<td width="10%" align="right">身份证号:</td>
			<td>${requestScope.zhiyuan.lianxiren}</td>
		</tr>
		<tr>
			<td width="10%" align="right">籍贯:</td>
			<td>${requestScope.zhiyuan.jiguan}</td>
		</tr>
		<tr>
			<td width="10%" align="right">民族:</td>
			<td>${requestScope.zhiyuan.nation}</td>
		</tr>
		<tr>
			<td align="right">部门:</td>
			<td>${requestScope.zhiyuan.bumen}</td>
		
			<td align="right">职务:</td>
			<td>${requestScope.zhiyuan.zhiwu}</td>
		</tr>
		<tr>
			<td width="10%" align="right">电话:</td>
			<td>${requestScope.zhiyuan.mobile}</td>
		</tr>
		<tr>
			<td width="10%" align="right">薪资:</td>
			<td>${requestScope.zhiyuan.qq}</td>
		</tr>
		
		<tr>
			<td align="right">备注:</td>
			<td colspan="3">${requestScope.zhiyuan.des}</td>
		</tr>
	</table>
</body>
</html>
