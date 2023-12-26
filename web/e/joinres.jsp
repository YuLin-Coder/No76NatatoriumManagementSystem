<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="import.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>项目</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>
<script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js" type="text/javascript"></script>
<script type="text/javascript">
       $(function(){
    	   
    	   $("#btnJoin").click(function(){
    		   
    		   var temaccountname= $("#hidCurrenthy").val();
    		   var gotourl=$("#gotourl").val();
    		   if(temaccountname==""){
                   
                   window.location.href="login.jsp?goto="+gotourl;
                   return false;
                  
               }
                
    		   
    		   
    	   });
    	   
    	   
       });
</script>



</head>
<body>
	<jsp:include page="head.jsp"></jsp:include>
	<div class="wrap round-block">
		<div class="line-title">
			当前位置：<a href="${pageContext.request.contextPath}/e/index.jsp">首页</a>
			&gt;&gt;报名结果
		</div>
	    <div class="info">

            <div class="brief-title">报名结果提示</div>
            <div class="brief-content">
            
				<div  style="font-size: 26px; color: red; font-weight: 400;">
					<i class="fa fa-check"></i>你已成功参加了${activity.title}项目
				</div>
			</div>

			

		</div>
	</div>
	<div class="fn-clear"></div>
	
	
</body>
</html>
