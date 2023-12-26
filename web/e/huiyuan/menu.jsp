<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script  type="text/javascript">
     
   $(function(){

      $("#side-menu .menu-group li").removeClass("current");
     
      var seedid='<%=request.getParameter("seedid")%>';
      
      if(seedid!="null")
         $("#"+seedid).addClass("current");
      else
        $("#m1").addClass("current");
      
   })

</script>
<div id="side-menu">




    
	<div class="menu-group">
		<h2><i class="fa fa-cog"></i>与我相关</h2>
		<ul>
		
		   
			 <li id="301" >
				<a  href="${pageContext.request.contextPath}/admin/dingdanmanager.do?actiontype=get&xiadanren=${sessionScope.huiyuan.accountname}&seedid=301&forwardurl=/e/huiyuan/dingdanmanager.jsp">我的订单</a>
			</li>
			
			 <li id="302" >
				<a  href="${pageContext.request.contextPath}/admin/kcdingdanmanager.do?actiontype=get&hyaccount=${sessionScope.huiyuan.accountname}&seedid=302&forwardurl=/e/huiyuan/kcdingdanmanager.jsp">我的培训课程</a>
			</li>

		    <li id="403" >
				<a  href="${pageContext.request.contextPath}/admin/shoucangmanager.do?actiontype=get&scren=${huiyuan.accountname}&seedid=403&forwardurl=/e/huiyuan/shoucangmanager.jsp">我的收藏夹</a>
			</li>
			
			
			
		</ul>
	</div>
	
		
<div class="menu-group">
		<h2><i class="fa fa-cog"></i>安全中心 </h2>
		<ul>
			<li id="203">
				<a href="${pageContext.request.contextPath}/e/huiyuan/modifypw.jsp?seedid=203" target="_self">登录密码修改</a>
			</li>
			<li id="204">
				<a href="${pageContext.request.contextPath}/e/huiyuan/modifypaypw.jsp?seedid=204" target="_self">支付密码修改</a>
			</li>
			
		    <li id="201">
				<a href="${pageContext.request.contextPath}/admin/secquestionmanager.do?seedid=201&actiontype=load&forwardurl=/e/huiyuan/secquestionadd.jsp" target="_self">录入密保问题</a>
			</li>
			
			<li id="202">
				<a href="${pageContext.request.contextPath}/admin/secquestionmanager.do?seedid=202&accountname=${huiyuan.accountname }&actiontype=get&forwardurl=/e/huiyuan/secquestionmanager.jsp" target="_self">我的密保问题</a>
			</li>
			
		</ul>
	</div>
	
	<div class="menu-group">
		<h2>
			<i class="fa fa-info"></i>账户信息
		</h2>
		<ul>
			<li id="101" class="current">
				<a  href="${pageContext.request.contextPath }/e/huiyuan/accountinfo.jsp?seedid=101">账户信息</a>
			</li>
			<li id="104" >
				<a  href="${pageContext.request.contextPath }/admin/receaddressmanager.do?actiontype=get&hyaccount=${sessionScope.huiyuan.accountname}&forwardurl=/e/huiyuan/receaddressmanager.jsp&seedid=104">收货地址</a>
			</li>
			<li id="102">
				<a href="${pageContext.request.contextPath }/e/huiyuan/yue.jsp?seedid=102" target="_self">账户余额</a>
			</li>
			<li id="103">
				<a href="${pageContext.request.contextPath }/e/huiyuan/modifyinfo.jsp?seedid=103" target="_self">信息修改</a>
			</li>
         
		</ul>
	</div>




</div>