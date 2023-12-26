
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="law.jsp" %>
 <script type="text/javascript">
  
    $(function(){
      
      $(".exit").click(function(){
          
            var pageurl_pagescope= $("#pageurl_pagescope").val();
            
            $.ajax({
		                     
		              url:encodeURI('${pageContext.request.contextPath}/admin/huiyuanmanager.do?actiontype=exit'),
					   method:'get',
					   success:function(){
					      window.location.reload();
					  },
					  error:function(xmhttprequest,status,excetpion){
					     $.alert("系统错误，错误编码"+status);
					  }
		     })

      });
      
      $("#searchForm").submit(function(){
    		 var temtitle= $("#title").val();
    		  if(temtitle==""){
    			  
    			  alert("请输入搜索信息");
    			  return false;
    		  }
    		  
    		  
    	  });
      
      $(".main-nav .menus li a").removeClass("current");
	      var headid='<%=request.getParameter("headid")%>';
	      if (headid != '') {
	           
	     	 $("#"+headid).addClass("current");
	 	 }
    
      
      
    })

</script>
 
<%
      Huiyuan temhy=(Huiyuan)request.getSession().getAttribute("huiyuan");
      if(temhy!=null)
         request.setAttribute("huiyuan", temhy);
      
      String title=request.getParameter("title");
      if(title!=null)
    	  request.setAttribute("title", title);
      
     
   
     

 %>

<div class="tab-header">

  <div class="wrap">
			<div class="pull-left">
				<div class="pull-left">
				 <c:if test="${sessionScope.huiyuan!=null}">
				       嗨，欢迎<a href="${pageContext.request.contextPath }/e/huiyuan/accountinfo.jsp">${sessionScope.huiyuan.accountname}</a>
				       <span class="exit">退出</span>
				  </c:if>
				</div>
				<a href="#">帮助中心</a>
			</div>
			<div class="pull-right">
			   <c:if test="${sessionScope.huiyuan==null }">
				<a href="${pageContext.request.contextPath}/e/login.jsp"><span class="cr">登录</span></a>
			   </c:if>
				<a href="${pageContext.request.contextPath}/e/register.jsp">注册</a>
			   
				<a href="${pageContext.request.contextPath}/admin/login.jsp">系统后台</a>
			</div>
		</div>

</div>
     
  