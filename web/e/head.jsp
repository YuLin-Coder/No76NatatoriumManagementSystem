
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="import.jsp" %>
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


<div class="white-paper clearfix">

	<div style="margin-bottom:10px;" class="wrap">

		<div class="row">
			<div class="col-lg-5">
				<div  style="font-size: 22px; color:#337ab7; font-weight: bold; width: 400px; line-height: 30px; font-family: tahoma, arial, Microsoft YaHei, Hiragino Sans GB; padding: 15px 10px;">

				</div>
			</div>
			<div class="col-lg-*">
				<div >

					<form id="searchForm"  action="${pageContext.request.contextPath}/admin/sitesearch.do" method="post" >
						<input   type="hidden" name="actiontype" value="find" />
						<input   type="hidden" name="searchtype" value="2" />
						<div class="search-box">
							<div class="search-text">

							</div>
							<div class="keyword">
								<input type="text" placeholder="请输入信息" id="title" value="${title }" name="title">
							</div>
							<div class="so">
								<input type="submit" class="sobtn" id="btnSearch" value="搜索" name="btnSearch">
							</div>
							<div class="error-container">

							</div>
						</div>

					</form>

				</div>

			</div>
		</div>

	</div>
</div>

<div class="header clearfix">
 
   <div class="wrap">
      
       <div class="logo">
          <div class="site-name">
			  游泳馆管理系统
          </div>
       </div>
       
       <div class="top-nav">
		    <%=new SitenavBuilder(request).build() %>
		</div>
      
   </div>

</div>


 
 
  
     
  