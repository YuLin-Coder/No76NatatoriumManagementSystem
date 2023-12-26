

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="import.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <%
  
            String id=request.getParameter("id");
            XinxiService xinxiSrv=BeansUtil.getBean("xinxiService", XinxiService.class);
            if(id!=null){
            
                Xinxi xinxi=xinxiSrv.load(new Integer(id));
                
                if(xinxi!=null){
                    xinxi.setClickcount(xinxi.getClickcount()+1);
                    xinxiSrv.update(xinxi);
                	request.setAttribute("xinxi",xinxi);
                }
                
            }
  
   %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统首页</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/register.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/leaveword.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>
 <script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js" type="text/javascript"></script>

 
    <script type="text/javascript">
    
            $(function(){
               
                 $("#btnAgree").click(function(){
		                  
		                  var temaccountname= $("#hidCurrenthy").val();
		                  var temreurl=$("#reUrl").val();
		                  if(temaccountname==""){
		                          
	                         window.location.href="login.jsp?reurl="+temreurl;
	                         return;
	                        
	                      }
	                     
	                      $.ajax({
		                     
		                        url:encodeURI('${pageContext.request.contextPath}/admin/xinximanager.do?actiontype=agree&id=${xinxi.id}'),
					            method:'get',
					            
					            success:function(data){
					               
					            	 $("#btnAgree [name=count]").html(data);
					            },
					            error:function(xmhttprequest,status,excetpion){
					                alert("系统错误，错误编码"+status);
					            }
		                  });
	                      
                  });
                  
                   $("#btnAgainst").click(function(){
		                  
		                  var temaccountname= $("#hidCurrenthy").val();
		                  var temreurl=$("#reUrl").val();
		                  if(temaccountname==""){
		                          
	                         window.location.href="login.jsp?reurl="+temreurl;
	                         return;
	                        
	                      }
	                     
	                      $.ajax({
		                     
		                        url:encodeURI('${pageContext.request.contextPath}/admin/xinximanager.do?actiontype=against&id=${xinxi.id}'),
					            method:'get',
					            
					            success:function(data){
					            	$("#btnAgainst [name=count]").html(data);
					            },
					            error:function(xmhttprequest,status,excetpion){
					                alert("系统错误，错误编码"+status);
					            }
		                  });
	                      
                  });
                   
                  $(".require-login").click(function(){
             	    	
           	    	 
           	    	  var temaccountname= $("#scren").val(); 
           	    	  var forwardurl=$("#commentresurl").val();
           	    	  if(temaccountname==""){
                             
                             window.location.href="${pageContext.request.contextPath}/e/login.jsp?forwardurl="+forwardurl;
                             return false;
                            
                        }
           	    	  
           	    	   return true;
           	      
           	      
           	      });
                   
                 
            });
    
    
    </script>
    
    
    
   

    

</head>
<body>

	<jsp:include page="head.jsp"></jsp:include>
	
	
	
		<input type="hidden" id="commentresurl" value="/e/xinxiinfo.jsp?id=<%=id%>">
	<input type="hidden" id="reUrl" name="reurl" value="/e/xinxiinfo.jsp?id=<%=id%>"/>

	<div class="fn-clear"></div>

	
	 <div  class="wrap news-info round-block">
	           <div class="title">${requestScope.xinxi.title}</div>
	           <div class="con-des">
	              <span><i class="fa fa-clock-o"></i><fmt:formatDate value="${requestScope.xinxi.pubtime}" pattern="yyyy-MM-dd hh:mm:ss"/></span>
	         
			<span id="btnAgree" class="btn btn-default"><i
				class="fa fa-thumbs-up"></i> 赞<span name="count">${xinxi.agreecount}</span></span>

			<span id="btnAgainst" class="btn btn-default"><i
				class="fa fa-thumbs-down"></i> 踩<span name="count">${xinxi.againstcount}</span></span>
            <form method="post" style="display:inline" action="${pageContext.request.contextPath}/admin/shoucangmanager.do">
                                         <input type="hidden" name="bookid" value="<%=id%>"/>
                                          <input type="hidden" name="bookname" value="${xinxi.title}"/>
                                          <input type="hidden" name="tupian" value="${xinxi.tupian2}"/>
                                         <input type="hidden" name="actiontype" value="save"/>
                                         <input type="hidden" id="scren" name="scren" value="${huiyuan.accountname}"/>
                                         <input type="hidden" name="forwardurl" value="/e/xinxiinfo.jsp?id=<%=id%>"/>
                                          <input type="hidden" name="errorurl" value="/e/xinxiinfo.jsp?id=<%=id%>"/>
                                           <input type="hidden" name="href" value="/e/xinxiinfo.jsp?id=${xinxi.id }"/>
                                         <input type="hidden" name="xtype" value="xinxi"/>
		                     <button  id="btnShoucang" class="btn btn-default require-login"><i class="fa fa-plus"></i>关注</button>
		                     ${sctip}
                       </form>
		</div>
		<div class="brief-content">
		              ${xinxi.dcontent}
		      </div>
		      
		      <jsp:include page="comment.jsp">
		                   <jsp:param value="xinxi" name="commenttype"/>
		      </jsp:include>
	
	
	</div>
		

	
	
	<div class="fn-clear"></div>


	<jsp:include page="bottom.jsp"></jsp:include>



</body>
</html>