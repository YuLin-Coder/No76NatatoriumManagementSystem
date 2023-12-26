<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="web" uri="/WEB-INF/webcontrol.tld"%>
<%@ include file="law.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>首页栏目</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js"></script>
     <link href="${pageContext.request.contextPath}/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script  type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery.validate.min.js"></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.validateex.js" ></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.metadata.js" ></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/messages_cn.js" ></script>
	    <link href="${pageContext.request.contextPath}/webui/easydropdown/themes/easydropdown.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/easydropdown/jquery.easydropdown.js" type="text/javascript"></script>    
    <link href="${pageContext.request.contextPath}/uploadifyv3.1/uploadify.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/uploadifyv3.1/jquery.uploadify-3.1.js" type="text/javascript"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/editor/kindeditor-min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/editor/lang/zh_CN.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webui/jqueryui/themes/base/jquery.ui.all.css" type="text/css"></link>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jqueryui/ui/jquery-ui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jqueryui/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>
    <script src="${pageContext.request.contextPath}/webui/jqueryui/ui/jquery-ui-timepicker-addon.js" type="text/javascript"></script>
     <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
   <script type="text/javascript">
       
        $(function (){
            $.metadata.setType("attr","validate");
            $("#indexcolumnsForm").validate();
        });  
    </script>
</head>
<body>
	<div class="search-title">
		<h2>修改栏目信息2</h2>
		<div class="description"></div>
	</div>
	<form name="indexcolumnsform" method="post"
		action="${pageContext.request.contextPath}/admin/indexcolumnsmanager.do"
		id="indexcolumnsForm">
		<table class="grid" cellspacing="1" width="100%">
			<input type="hidden" name="id" value="${id}" />
			<input type="hidden" name="actiontype" value="${actiontype}" />
			<input type="hidden" name="seedid" value="${seedid}" />
			<input type="hidden" name="errorurl"
				value="/admin/indexcolumnsadd.jsp" />
			<input type="hidden" name="forwardurl"
				value="/admin/indexcolumnsmanager.do?actiontype=get&forwardurl=/admin/indexcolumnsmanager.jsp" />
			<input name="colid" 
					validate="{required:true,messages:{required:'请输入栏目编号'}}"
					value="${requestScope.indexcolumns.colid}"
					type="hidden" />
			<tr>
				<td colspan="4">${errormsg}</td>
			</tr>
			<tr>
				<td align="right">栏目描述:</td>
				<td><input name="coldes" placeholder="栏目描述"
					validate="{required:true,messages:{required:'请输入栏目描述'}}"
					value="${requestScope.indexcolumns.coldes}" class="input-txt"
					type="text" id="txtColdes" /></td>
			</tr>
			
			<tr>
				<td align="right">栏目类型:</td>
				<td>
				   <input type="radio" name="xtype" value="商品" checked="checked" />商品
				   <input type="radio" name="xtype" value="资讯"  />资讯
				
				</td>
			</tr>
			<tr>
				<td align="right">显示风格:</td>
				<td>
				
				   <input type="radio" name="showstyle" value="图片" checked="checked" />图片
				   <input type="radio" name="showstyle" value="文本"  />文本
				
				</td>
			</tr>
			<tr>
				<td align="right">布局风格 :</td>
				<td>
				  <input type="radio" name="layout" value="1" checked="checked" />行布局
				   <input type="radio" name="layout" value="2"  />列布局
				
				</td>
			</tr>
			<tr>
				<td align="right">宽度:</td>
				<td>
				    <input name="width" placeholder="显示宽度" 
					validate="{required:true,messages:{required:'请输入显示宽度'}}"
					value="${requestScope.indexcolumns.width}" class="input-txt"
					type="text" />
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<div class="ui-button">
						<button class="ui-button-text">
							<i class="icon-ok icon-white"></i>提交
						</button>
					</div>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
