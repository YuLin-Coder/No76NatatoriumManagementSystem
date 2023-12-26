<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.text.*" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="web" uri="/WEB-INF/webcontrol.tld" %>
<%@ include file="law.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>员工</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js"></script>
    <link href="${pageContext.request.contextPath}/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css"/>
    <script src="${pageContext.request.contextPath}/webui/artDialog/jquery.artDialog.source.js"
            type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/webui/artDialog/iframeTools.source.js"
            type="text/javascript"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/webui/jquery/jquery.validate.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery.validateex.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery.metadata.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/messages_cn.js"></script>
    <link href="${pageContext.request.contextPath}/webui/easydropdown/themes/easydropdown.css" rel="stylesheet"
          type="text/css"/>
    <script src="${pageContext.request.contextPath}/webui/easydropdown/jquery.easydropdown.js"
            type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/uploadifyv3.1/uploadify.css" rel="stylesheet" type="text/css"/>
    <script src="${pageContext.request.contextPath}/uploadifyv3.1/jquery.uploadify-3.1.js"
            type="text/javascript"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery-form/jquery.form.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/editor/kindeditor-min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/editor/lang/zh_CN.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webui/jqueryui/themes/base/jquery.ui.all.css"
          type="text/css"></link>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jqueryui/ui/jquery-ui.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/webui/jqueryui/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>
    <script src="${pageContext.request.contextPath}/webui/jqueryui/ui/jquery-ui-timepicker-addon.js"
            type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript">
        function initControl() {

            editor = KindEditor.create('textarea[name="des"]', {
                uploadJson: '../plusin/upload_json.jsp',
                fileManagerJson: '../plusin/file_manager_json.jsp',
                resizeType: 1,
                allowFileManager: true
            });
            $('#btnulPhoto').uploadify({
                'formData': {'folder': '${pageContext.request.contextPath}/Upload'},
                'buttonText': '选择图片',
                'buttonClass': 'browser',
                'removeCompleted': true,
                'swf': '${pageContext.request.contextPath}/uploadifyv3.1/uploadify.swf',
                'fileTypeExts': "*.jpg;*.gif;*.png;",
                'auto': true,
                'removeTimeout': 0,
                'debug': false,
                'height': 15,
                'width': 90,
                'uploader': '${pageContext.request.contextPath}/admin/uploadmanager.do',
                'fileSizelimit': '2048KB',
                'queueSizelimit': '5',
                'onUploadSuccess': function (file, data, response) {
                    $("#filelist").show();
                    $("#imgPhoto").attr("src", "${pageContext.request.contextPath}/upload/temp/" + file.name);
                    $("#hidPhoto").val("/upload/temp/" + file.name);
                }
            });
            var imgphotosrc = "${requestScope.zhiyuan.photo}";
            if (imgphotosrc == "") {
                var url = "${pageContext.request.contextPath}/upload/nopic.jpg";
                $("#imgPhoto").attr("src", url);
                $("#hidPhoto").val("/upload/nopic.jpg");
            } else {
                $("#imgPhoto").attr("src", "${pageContext.request.contextPath}" + imgphotosrc);
                $("#hidPhoto").val(imgphotosrc);
            }
        }

        $(function () {
            initControl();
            $.metadata.setType("attr", "validate");
            $("#zhiyuanForm").validate();
        });
    </script>
</head>
<body>
<div class="search-title">
    <h2>新建员工</h2>
    <div class="description"></div>
</div>
<form name="zhiyuanform" method="post"
      action="${pageContext.request.contextPath}/admin/zhiyuanmanager.do"
      id="zhiyuanForm">
    <table class="grid" cellspacing="1" width="100%">
        <input type="hidden" name="id" value="${id}"/>
        <input type="hidden" name="actiontype" value="${actiontype}"/>
        <input type="hidden" name="seedid" value="${seedid}"/>
        <input type="hidden" name="errorurl" value="/admin/zhiyuanadd.jsp"/>
        <input type="hidden" name="forwardurl"
               value="/admin/zhiyuanmanager.do?actiontype=get&forwardurl=/admin/zhiyuanmanager.jsp"/>
        <tr>
            <td colspan="4">${errormsg}</td>
        </tr>
        <tr>
            <td align="right">工号:</td>
            <td><input name="accountname" placeholder="账户名"
                       validate="{required:true,messages:{required:'请输入账户名'}}"
                       value="${requestScope.zhiyuan.accountname}" class="input-txt"
                       type="text" id="txtAccountname"/>

            </td>
            <td colspan="2" rowspan="6"><img id="imgPhoto" width="200px" height="200px"
                                             src="${pageContext.request.contextPath}${requestScope.zhiyuan.photo}"/>
                <div>
                    <input type="file" name="upload" id="btnulPhoto"/>
                </div>
                <input type="hidden" id="hidPhoto" name="photo"
                       value="${requestScope.zhiyuan.photo}"/></td>
        </tr>

        <tr>
            <td align="right">姓名:</td>
            <td><input name="name" placeholder="姓名"
                       validate="{required:true,messages:{required:'请输入姓名'}}"
                       value="${requestScope.zhiyuan.name}" class="input-txt" type="text"
                       id="txtName"/></td>
        </tr>
        <tr>
            <td align="right">性别:</td>
            <td><select name="sex" class="dropdown" id="ddlSex" ltype="select">
                <option value="男">男</option>
                <option value="女">女</option>
            </select></td>
        </tr>
        <tr>
            <td align="right">身份证号:</td>
            <td><input name="lianxiren" placeholder="联系人"
                       validate="{required:true,idcardno:true,messages:{required:'请输入身份证号',idcardno:'请输入正确身份证号'}}"
                       value="${requestScope.zhiyuan.lianxiren}" class="input-txt"
                       type="text" id="txtLianxiren"/></td>
        </tr>
        <tr>
            <td align="right">籍贯:</td>
            <td><input name="jiguan" placeholder="籍贯"
                       validate="{required:true,messages:{required:'请输入籍贯'}}"
                       value="${requestScope.zhiyuan.jiguan}" class="input-txt"
                       type="text" id="txtJiguan"/></td>
        </tr>
        <tr>
            <td align="right">民族:</td>
            <td><input name="nation" placeholder="名族"
                       validate="{required:true,messages:{required:'请输入名族'}}"
                       value="${requestScope.zhiyuan.nation}" class="input-txt"
                       type="text" id="txtNation"/></td>
        </tr>
        <tr>
            <td align="right">部门:</td>
            <td><web:dropdownlist cssclass="dropdown" name="bumen" id="bumen"
                                  value="${requestScope.zhiyuan.bumen}"
                                  datasource="${bumen_datasource}" textfieldname="bumenming"
                                  valuefieldname="bumenming">
            </web:dropdownlist></td>

            <td align="right">职务:</td>
            <td><web:dropdownlist name="zhiwu" cssclass="dropdown" id="zhiwu"
                                  value="${requestScope.zhiyuan.zhiwu}"
                                  datasource="${zhiwu_datasource}" textfieldname="zhiwuming"
                                  valuefieldname="zhiwuming">
            </web:dropdownlist>
            </td>
        </tr>
        <tr>
            <td align="right">电话:</td>
            <td><input name="mobile" placeholder="电话"
                       validate="{required:true,messages:{required:'请输入电话'}}"
                       value="${requestScope.zhiyuan.mobile}" class="input-txt"
                       type="text" id="txtMobile"/></td>

            <td align="right">薪资:</td>
            <td><input name="qq" placeholder="薪资"
                       validate="{required:true,digits:true,messages:{required:'请输入薪资',digits:'请输入正确薪资'}}"
                       value="${requestScope.zhiyuan.qq}" class="input-txt" type="text"
                       id="txtQq"/></td>
        </tr>

        <tr>
            <td align="right">备注:</td>
            <td colspan="3"><textarea name="des" id="txtDes"
                                      style="width:98%;height:200px;">${requestScope.zhiyuan.des}</textarea>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <div class="ui-button">
                    <button class="ui-button-text">
                        <i class="icon-ok icon-white"></i>提交
                    </button>
                </div>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
