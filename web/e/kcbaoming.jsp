<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  include file="import.jsp"%>
<%
KechengService kechengSrv=BeansUtil.getBean("kechengService",KechengService.class);
            String id=request.getParameter("id");
            if(id!=null){
                Kecheng kecheng=kechengSrv.load("where id="+id);
                if(kecheng!=null)
                   request.setAttribute("kecheng",kecheng);
            }
   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>培训课程</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/webui/bootstrap/css/font-awesome.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/leaveword.css" type="text/css"></link>
<script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
</head>
<body>
	<jsp:include page="head.jsp"></jsp:include>
	<input type="hidden" id="commentresurl" value="/e/kechenginfo.jsp?id=<%=id%>" />
	<div class="wrap round-block">
		<div class="line-title">
			当前位置：
			<a href="${pageContext.request.contextPath}/e/index.jsp">首页</a>
			&gt;&gt;
			<a href="${pageContext.request.contextPath}/e/kechenglist.jsp">培训课程</a>
		</div>
		<div class="show-details">
			<div class="picture-box">
				<img id="imgTupian" src="${requestScope.kecheng.tupian}" />
				<div class="operation">
					<div class="ticket-price">图片</div>
				</div>
			</div>
			<div class="text-box">
				<div class="title">${requestScope.kecheng.title}</div>
				<div class="sub-title"></div>
				<div>
					<ul>
						
						<li>
							<strong>课时:</strong>
							${requestScope.kecheng.keshi}小时
						</li>
						<li>
							<strong>上课时间:</strong>
							${requestScope.kecheng.skshijian}
						</li>
						<li>
							<strong>收费标准(元）:</strong>
							${requestScope.kecheng.fee}元
						</li>
						<li>
							<strong>上线时间:</strong>
							${requestScope.kecheng.createtime}
						</li>
						
						<li>
							<strong>教师名:</strong>
							${requestScope.kecheng.tno}-${requestScope.kecheng.tname}
						</li>
						
					</ul>
				</div>
				<div></div>
			</div>
		</div>
		<!--end text-box-->
	</div>
	<!--end show details-->
	<div class="wrap info">
		<div class="brief-title">课程报名</div>
		<div class="brief-content">
		   
		  <c:if test="${huiyuan!=null}">   
			<form name="dingdanform" method="post"
				action="${pageContext.request.contextPath}/admin/kcdingdanmanager.do"
				id="dingdanForm">
				<table class="grid" cellspacing="1" width="100%">
					<input type="hidden" name="id" value="${id}" />
					<input type="hidden" name="actiontype" value="save" />
					<input type="hidden" name="seedid" value="${seedid}" />
					<input name="hyaccount" placeholder="报名人"
							validate="{required:true,messages:{required:'请输入报名人'}}"
							value="${huiyuan.accountname}" class="input-txt"
							type="hidden" id="txtHyaccount" />
							<input name="hyname" placeholder="姓名"
							validate="{required:true,messages:{required:'请输入姓名'}}"
							value="${huiyuan.name}" class="input-txt"
							type="hidden" id="txtHyname" />
					<input name="kcid" placeholder="课程编号"
							validate="{required:true,messages:{required:'请输入课程编号'}}"
							value="${kecheng.id}" class="input-txt"
							type="hidden" />
					<input name="kcname" placeholder="课程名称"
							validate="{required:true,messages:{required:'请输入课程名称'}}"
							value="${kecheng.title}" class="input-txt"
							type="hidden"  />
					<input name="jlaccount" placeholder="教练工号"
							validate="{required:true,messages:{required:'请输入教练工号'}}"
							value="${kecheng.tno}" class="input-txt"
							type="hidden"  />
					<input name="jlname" placeholder="教练名称"
							validate="{required:true,messages:{required:'请输入教练名称'}}"
							value="${kecheng.tname}" class="input-txt"
							type="hidden"  />
					<input type="hidden" name="errorurl"
						value="/e/huiyuan/kcbaoming.jsp?id=<%=id %>" />
					
					<input type="hidden" name="forwardurl"
						value="/admin/kcdingdanmanager.do?actiontype=get&hyaccount=${sessionScope.huiyuan.accountname}&forwardurl=/e/huiyuan/kcdingdanmanager.jsp" />
					<tr>
						<td colspan="4">${errormsg}</td>
					</tr>

				
					
					<tr>
						<td align="right">人数:（人）</td>
						<td><input name="renshu" style="width:80px;" placeholder="人数"
							validate="{required:true,digits:true,messages:{required:'请输入人数',digits:'请输入正确的人数'}}"
							value="1" class="input-txt"
							type="text" id="txtRenshu" /></td>
					</tr>
					
					<tr>
						<td align="right">元/人:</td>
						<td>
						
						${kecheng.fee} 元 /人
						<input name="fee" placeholder="元/人"
							validate="{required:true,messages:{required:'请输入元/人'}}"
							value="${kecheng.fee}" class="input-txt" type="hidden"/></td>
					</tr>
				
					<tr>
						<td align="right">联系电话:</td>
						<td><input name="mobile" placeholder="联系电话"
							validate="{required:true,mobile:true,messages:{required:'请输入联系电话',mobile:'请输入正确的联系电话'}}"
							value="${huiyuan.mobile}" class="input-txt"
							type="text" id="txtMobile" /></td>
					</tr>
					
				
					<tr>
						<td colspan="4">
							
								<button class="btn btn-default">
									<i class="fa fa-check"></i>在线报名
								</button>
							
						</td>
					</tr>
				</table>
			</form>
			
			</c:if>
			<c:if test="${huiyuan==null}">
			     <div style="padding-left:200px;padding-top:100px;font-size:18px;font-weight:600;">请<a style="color:blue;" href="${pageContext.request.contextPath}/e/login.jsp">登录</a>后再报名</div>
			</c:if>
		
		</div>
		
	</div>
	<div class="fn-clear"></div>
	<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>
