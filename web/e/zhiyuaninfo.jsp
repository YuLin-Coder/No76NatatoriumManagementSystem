<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@  include file="import.jsp" %>
<%
    ZhiyuanService zhiyuanSrv = BeansUtil.getBean("zhiyuanService", ZhiyuanService.class);
    String id = request.getParameter("id");
    if (id != null) {
        Zhiyuan zhiyuan = zhiyuanSrv.load("where id=" + id);
        if (zhiyuan != null)
            request.setAttribute("zhiyuan", zhiyuan);
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>员工</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webui/bootstrap/css/font-awesome.css"
          type="text/css"></link>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/leaveword.css" type="text/css"></link>
    <script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {

        });
    </script>
</head>
<body>
<jsp:include page="head.jsp"></jsp:include>
<input type="hidden" id="commentresurl" value="/e/zhiyuaninfo.jsp?id=<%=id%>"/>
<div class="wrap round-block">
    <div class="line-title">
        当前位置：<a href="${pageContext.request.contextPath}/e/index.jsp">首页</a>
        &gt;&gt; 教练信息
    </div>
    <div class="show-details">
        <div class="picture-box">
            <img id="imgTupian" src="${pageContext.request.contextPath}${requestScope.zhiyuan.photo}"/>
            <div class="operation">
                <div class="ticket-price">
                    <span data-url="${pageContext.request.contextPath}/e/zhiyuanqtadd.jsp?id=${requestScope.zhiyuan.id}"
                          class="btn btn-primary required-login"><i class="fa fa-plus"></i>添加</span>
                </div>
            </div>
        </div>
        <div class="text-box">
            <div class="title">
                ${requestScope.zhiyuan.name}
            </div>
            <div class="sub-title">

            </div>
            <div>
                <ul>
                    <li>
                        <strong>工号:</strong>
                        ${requestScope.zhiyuan.accountname}
                    </li>

                    <li>
                        <strong>姓名:</strong>
                        ${requestScope.zhiyuan.name}
                    </li>
                    <li>
                        <strong>性别:</strong>
                        ${requestScope.zhiyuan.sex}
                    </li>
                    <li>
                        <strong>联系人:</strong>
                        ${requestScope.zhiyuan.lianxiren}
                    </li>
                    <li>
                        <strong>籍贯:</strong>
                        ${requestScope.zhiyuan.jiguan}
                    </li>
                    <li>
                        <strong>民族:</strong>
                        ${requestScope.zhiyuan.nation}
                    </li>

                    <li>
                        <strong>职务:</strong>
                        ${requestScope.zhiyuan.zhiwu}
                    </li>
                    <li>
                        <strong>电话:</strong>
                        ${requestScope.zhiyuan.mobile}
                    </li>
                    <li>
                        <strong>qq:</strong>
                        ${requestScope.zhiyuan.qq}
                    </li>

                </ul>
            </div>
            <div>
            </div>
        </div>
    </div>
    <!--end text-box-->
</div>
<!--end show details-->
<div class="wrap info">
    <div class="brief-title">介绍</div>
    <div class="brief-content">
        ${requestScope.zhiyuan.des}
    </div>
    <jsp:include page="comment.jsp">
        <jsp:param value="zhiyuan" name="commenttype"/>
    </jsp:include>
</div>
<div class="fn-clear"></div>
<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>
