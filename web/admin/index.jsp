<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="law.jsp" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>首页</title>  
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/pintuer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/admin.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js"></script>
    <script type="text/javascript">
		$(function(){
		  $(".leftnav h2").click(function(){
              $(this).closest(".leftnav").find("ul").hide();
              $(this).next().slideToggle(200);
              $(this).toggleClass("on");
		  })
		  $(".leftnav ul li a").click(function(){
			    $("#a_leader_txt").text($(this).text());
		  		$(".leftnav ul li a").removeClass("on");
				$(this).addClass("on");
		  })
		});
</script>  
</head>
<body style="background-color:#f2f9fd;">
<div class="header bg-main">
  <div class="logo margin-big-left fadein-top">
    <h1><img src="images/y.jpg" class="radius-circle rotate-hover" height="50" alt="" />游泳管理系统后台管理中心</h1>
  </div>
  <div class="head-l">
     
     <div class="user-name">
         <a href="${pageContext.request.contextPath}/admin/accountinfo.jsp" target="main"> ${sessionScope.users.username}-${sessionScope.users.realname}</a>
     </div>
     <a class="button button-little bg-green" href="${pageContext.request.contextPath}/e/index.jsp" target="_blank">
     
     <span class="icon-home"></span> 前台首页</a> &nbsp;&nbsp;
     &nbsp;&nbsp;
    <a class="button button-little bg-red" href="${pageContext.request.contextPath}/admin/login.jsp">
    <span class="icon-power-off"></span> 退出登录</a>
  </div>
  <div >
    
  </div>
  
</div>
<div class="leftnav">
  <div class="leftnav-title"><strong><span class="icon-list"></span>菜单列表</strong></div>
  <h2><span class="icon-music"></span>网站资讯管理</h2>
  <ul style="display:block">

      <li><a href="${pageContext.request.contextPath}/admin/kechengmanager.do?actiontype=get" target="main"><span class="icon-caret-right"></span>培训课程管理</a></li>

     <li><a href="${pageContext.request.contextPath}/admin/xinximanager.do?actiontype=get" target="main"><span class="icon-caret-right"></span>网站资讯管理</a></li>
     <li><a href="${pageContext.request.contextPath}/admin/xinximanager.do?actiontype=load" target="main"><span class="icon-caret-right"></span>发布资讯</a></li>
     <li><a href="${pageContext.request.contextPath}/admin/lanmumanager.do?actiontype=get" target="main"><span class="icon-caret-right"></span>栏目管理</a></li>
     <li><a href="${pageContext.request.contextPath}/admin/noticemanager.do?actiontype=get" target="main"><span class="icon-caret-right"></span>系统公告管理</a></li>
  </ul>   
  <h2><span class="icon-pencil-square-o"></span>商品管理</h2>
  <ul>
    <li><a href="${pageContext.request.contextPath}/admin/shangpinmanager.do?actiontype=get" target="main"><span class="icon-caret-right"></span>商品管理</a></li>
    <li><a href="${pageContext.request.contextPath}/admin/shangpinmanager.do?actiontype=load" target="main"><span class="icon-caret-right"></span>发布商品</a></li>
    <li><a href="${pageContext.request.contextPath}/admin/spcategorymanager.do?actiontype=get&forwardurl=/admin/spcategorytreemanager.jsp" target="main"><span class="icon-caret-right"></span>商品类别管理</a></li>
    <li><a href="${pageContext.request.contextPath}/admin/dingdanmanager.do?actiontype=get" target="main"><span class="icon-caret-right"></span>订单管理</a></li>
      <li><a href="${pageContext.request.contextPath}/admin/duixiangmanager.do?actiontype=get" target="main"><span class="icon-caret-right"></span>培训对象</a></li>

      <li><a href="${pageContext.request.contextPath}/admin/xiaoshoutongjitext.jsp" target="main"><span class="icon-caret-right"></span>销售统计</a></li>
          
  </ul>  
  
   <h2><span class="icon-user"></span>用户管理</h2>
  <ul>
    <li><a href="${pageContext.request.contextPath}/admin/huiyuanmanager.do?actiontype=get" target="main"><span class="icon-caret-right"></span>会员管理</a></li>
    <li><a href="${pageContext.request.contextPath}/admin/usersmanager.do?actiontype=get" target="main"><span class="icon-caret-right"></span>后台用户管理</a></li>
    <li><a href="${pageContext.request.contextPath}/admin/modifypw.jsp" target="main"><span class="icon-caret-right"></span>修改密码</a></li>
   
  </ul>  
  
   <h2><span class="icon-codepen"></span>系统设置</h2>
  <ul>
    <li><a href="${pageContext.request.contextPath}/admin/jiaodiantumanager.do?actiontype=get" target="main"><span class="icon-caret-right"></span>首页轮播图管理</a></li>
    <li><a href="${pageContext.request.contextPath}/admin/sitenavmanager.do?actiontype=get" target="main"><span class="icon-caret-right"></span>网站导航设置</a></li>
    <li><a href="${pageContext.request.contextPath}/admin/indexcolumnsmanager.do?actiontype=get" target="main"><span class="icon-caret-right"></span>首页栏目设置</a></li>
    <li><a href="${pageContext.request.contextPath}/admin/sysconfigmanager.do?actiontype=get" target="main"><span class="icon-caret-right"></span>系统介绍设置</a></li>
   
  </ul>  
  
  
</div>

<ul class="bread">
  <li><a href="${pageContext.request.contextPath}/admin/accountinfo.jsp" target="main" class="icon-home">首页</a></li>
  <li><a href="##" id="a_leader_txt">网站信息</a></li>
  <li><b>当前语言：</b><span style="color:red;">中文</span>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</ul>
<div class="admin">
  <iframe scrolling="auto" rameborder="0" src="${pageContext.request.contextPath}/admin/usersmanager.do?actiontype=get" name="main" width="100%" height="100%"></iframe>
</div>
<div style="text-align:center;">

</div>
</body>
</html>