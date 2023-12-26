<%@page import="com.daowen.util.*"%>
<%@page import="com.daowen.entity.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%

       String forwardurl=request.getParameter("forwardurl");
       if(forwardurl!=null)
         request.setAttribute("forwardurl", forwardurl);
 %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会员登录</title>

      <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js"></script>
    
    <script  type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery.validate.min.js"></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.validateex.js" ></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.metadata.js" ></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/messages_cn.js" ></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>
  
   
<script type="text/javascript">
 
           $(function(){
	            $.metadata.setType("attr","validate");
	            $("#form1").validate();
	      });  
 
 </script>


</head>
<body>

<div class="login-head-nav">

       <div class="wapper clearfix">

           <div class="fn-left">
               <div class="login-system-name">
                   <a href="${pageContext.request.contextPath}/e/index.jsp">游泳管理系统登录</a>
               </div>
           </div>


       </div>

</div>
	<div class="wrapper970">
<div class="login-body clearfix">

      <div class="left-area">

         <img src="${pageContext.request.contextPath}/e/images/loginleft.jpg">
      </div>
      <div class="right-area">

         <div  class="login-form-panel">

          <form name="form1" id="form1" method="post" action="${pageContext.request.contextPath}/admin/huiyuanmanager.do">
			<input type="hidden" name="actiontype" value="login" />
			<input type="hidden"  name="forwardurl" value="${forwardurl}"/>
			<input type="hidden"  name="errorurl" value="/e/login.jsp"/>
			<input type="hidden" name="usertype"  value="0" />
                      
             <div class="login-form-title">

                               用户登录 ${errormsg}
             </div>
            
             <div class="input-pack">
                <span class="title-addon">
                    <i class="fa fa-user"></i>
                </span> <input  type="text" placeholder="账户名" value="${accountname}" name="accountname" />
             </div>

             <div class="input-pack">
                <span class="title-addon">
                    <i class="fa fa-lock"></i>
                </span>
                 <input  type="password" placeholder="密码" value="${password}" name="password" />
             </div>


             <button class="register-btn">登录</button>

             <div class="agree-protocol">
                 <div class="fn-right">
                        <a href="${pageContext.request.contextPath}/e/register.jsp">在线注册</a>
                 </div>

             </div>
            </form>
         </div>
         

      </div>
      
  </div>
</div>

</body>
</html>