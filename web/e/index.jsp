<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="import.jsp" %>

<%
    ShangpinService shangpinSrv=BeansUtil.getBean("shangpinService", ShangpinService.class);
    JiaodiantuService  jdtSrv=BeansUtil.getBean("jiaodiantuService", JiaodiantuService.class);
    List<Jiaodiantu> listJiaodiantu=jdtSrv.getEntity("");
    if(listJiaodiantu!=null)
    	request.setAttribute("listJiaodiantu", listJiaodiantu);
    List<Shangpin> listShangpin=shangpinSrv.getTopEntity("",12);
    if(listShangpin!=null)
    	request.setAttribute("listShangpin", listShangpin);
    
%>


<!DOCTYPE HTML>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统首页</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
<link href="${pageContext.request.contextPath}/e/css/box.all.css"  rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/e/css/carousel.css" />

<script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js" type="text/javascript"></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/e/js/carousel.js'></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/e/js/carousel2.js'></script>
<script src="${pageContext.request.contextPath}/e/js/responsiveslides.min.js"></script>
    <script type="text/javascript">
        $(function () {

        	 $("#slider1").responsiveSlides({
			        maxwidth: 2500,
			        speed: 600
			 });
          

        });
    </script>

</head>
<body>

	<jsp:include page="head.jsp"></jsp:include>
	<div class="image-slider">
		<!-- Slideshow 1 -->
		<ul class="rslides" id="slider1">
		   <c:forEach var="temjdt" items="${requestScope.listJiaodiantu}">
		   
		       <li><a href="${temjdt.href}"><img src="${pageContext.request.contextPath}${temjdt.tupian}" alt=""></a></li>
		   </c:forEach>
			
		</ul>
		<!-- Slideshow 2 -->
	</div>
	
   <div class="fn-clear"></div>
	
		
	<div class="wrap round-block clearfix">
       
       <div class="fnleft" style="width:960px;">
	   
         <%=new IndexcolumnsBuilder(request).buildColumns() %>
      </div>
	   <div class="plat-notice-panel fnleft">
	         <div class="title">
	             <i class="fa fa-volume-up"></i>系统公告
	             <div class="more"><a href="${pageContext.request.contextPath}/e/noticelist.jsp"><i class="fa fa-chevron-right"></i></a></div>
	         </div>
	                <%
					   NoticeBuilder noticeBuilder=new NoticeBuilder();
					%>
					<%=noticeBuilder.build() %>
	     </div>
	</div>
	  
	<div  class="hotsong slider clearfix">
	   <div class="main-inner">
	     <div class="main-title">
	        <div class="title">会员卡</div>
	     </div>
	       <div class="main-slider tab-cont">
        <ul class="slider-wrapper" >
         
         <c:forEach items="${listShangpin}" var="temshangpin">
          <li>
            <a href="${pageContext.request.contextPath}/e/shangpininfo.jsp?id=${temshangpin.id}" >
              <img class="img" src="${pageContext.request.contextPath}${temshangpin.tupian }" alt="#">
              <span class="mask"></span>
              <i class="icon-play"></i>
            </a>
            <div class="info">
              <div class="title">
                <a href="#">${temshangpin.name} </a>
                <i class="icon-sprite"></i>
              </div>
              <a href="#" class="author">${temshangpin.hyjia}</a>
            </div>
          </li>
         </c:forEach>
         
        </ul>
        <div class="slider-btns">
          <span class=""><i></i></span>
          <span class=""><i></i></span>
          <span class="cur"><i></i></span>
        </div>
        </div>
	   </div>
	    <div class="main-operate">
	      <a href="javascript:;" class="slider-prev"><i class="icon-sprite"></i></a>
	      <a href="javascript:;" class="slider-next"><i class="icon-sprite"></i></a>
	    </div>
	</div>

	<div class="fn-clear"></div>
	
	<div class="wrap round-block ">
     
	   
         <%=new IndexcolumnsBuilder(request).buildImageColumns() %>

		
	 
	</div>
	<div class="fn-clear"></div>
	<jsp:include page="bottom.jsp"></jsp:include>



</body>
</html>