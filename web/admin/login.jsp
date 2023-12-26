<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>用户登录</title>  
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/pintuer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/admin.css">
     <script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js"></script>

    <script src="${pageContext.request.contextPath}/webui/jquery/jquery.validate.min.js" type="text/javascript"></script>

    <script src="${pageContext.request.contextPath}/webui/jquery/jquery.metadata.js" type="text/javascript"></script>
     <script type="text/javascript"> 
  
      
       if(top.window!=window)
    	   top.location.href="login.jsp";
      
      $(function(){
      
    	  $("#btnReloadImage,#imgvc").on("click",function () {

              $("#imgvc").prop("src", "../plusin/image.jsp?time="+new Date().getMilliseconds());

          });
           $("#loginForm").submit(function(){
              
               if($("[name=username]").val()==""){
                  alert("用户名不能为空");
                  return false;
               }
               if($("[name=password]").val()==""){
                   alert("密码不能为空");
                   return false;
                }
               return true;
           
           });
          
      
      });
  
  </script>
				
    
</head>
<body>
<div class="bg"></div>
<div class="container">
    <div class="line bouncein">
        <div class="xs6 xm4 xs3-move xm4-move">
            <div style="height:150px;"></div>
            <div class="media media-y margin-big-bottom">           
            </div>         
            <form action="${pageContext.request.contextPath}/admin/login.do" method="post">
              <input type="hidden" name="actiontype" value="login" />
            <input name="usertype" value="0" type="hidden"/>
           <input type="hidden" name="forwardurl"   value="/admin/index.jsp"/>
            <div class="panel loginbox">
                <div class="text-center margin-big padding-big-top">
                   <h1>游泳管理系统后台登录</h1>
                </div>
                <div class="panel-body" style="padding:30px; padding-bottom:10px; padding-top:10px;">
                    <div class="form-group">
                        <div class="field field-icon-right">
                            <input type="text" class="input input-big" name="username" value="${username }" placeholder="用户名"  />
                            <span class="icon icon-user margin-small"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="field field-icon-right">
                            <input type="password" class="input input-big" name="password" value="${password}" placeholder="密码"  />
                            <span class="icon icon-key margin-small"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="field">
                            <input type="text" class="input input-big" name="validcode" value="${validcode }" placeholder="验证码" />
                           <img  id="imgvc" src="../plusin/image.jsp"  alt="" width="100" height="32" class="passcode" style="height:43px;cursor:pointer;" >  
                                                   
                        </div>
                    </div>
                </div>
                <div style="padding:30px;"><input type="submit" class="button button-block bg-main text-big input-big" value="登录"></div>
                <div style="padding:40px 30px;">
                            ${errmsg}
                </div>
            </div>
            </form>          
        </div>
    </div>
</div>

</body>
</html>