<%--
  Created by IntelliJ IDEA.
  User: lyh
  Date: 2018/1/25
  Time: 9:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<c:set var="base" value="${basePath}"/>

<html>
<head>
    <title>生成方案管理</title>
    <meta name="decorator" content="default"/>
    <link rel="stylesheet" href="${base}/static/bootstrap-3.3.7/css/bootstrap.css">
    <script src="${base}/static/jquery-1.8.3.js"></script>
    <script src="${base}/static/bootstrap-3.3.7/js/bootstrap.js"></script>
    <script src="${base}/static/jquery.validate.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#name").focus();
            $("#inputForm").validate({
                submitHandler: function (form) {
                    //loading('正在提交，请稍等...');
                    form.submit();
                },
                errorContainer: "#messageBox",
                errorPlacement: function (error, element) {
                    $("#messageBox").text("输入有误，请先更正。");
                    if (element.is(":checkbox") || element.is(":radio") || element.parent().is(".input-append")) {
                        error.appendTo(element.parent().parent());
                    } else {
                        error.insertAfter(element);
                    }
                }
            });
        });
    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li><a href="${base}/admin/gen/genScheme/">生成方案列表</a></li>
    <li class="active">
        <a href="${base}/admin/gen/genScheme/form?id=${genScheme.id}">生成方案${not empty genScheme.id?'修改':'添加'}查看</a>
    </li>
    <li><a href="${base}/admin/gen/genTable/">业务表列表</a></li>
    <li><a href="${base}/admin/gen/genTable/form">业务表查看</a></li>
</ul>
<br/>
<form:form id="inputForm" modelAttribute="genScheme" action="${base}/admin/gen/genScheme/save" method="post"
           class="form-horizontal">
    <form:hidden path="id"/><form:hidden path="flag"/>
    <%--<sys:message content="${message}"/>--%>
    <div class="control-group">
        <label class="control-label">方案名称:</label>
        <div class="controls">
            <form:input path="name" htmlEscape="false" maxlength="200" class="required"/>
            <span class="help-inline"></span>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">模板分类:</label>
        <div class="controls">
            <form:select path="category" class="required input-xlarge">
                <form:options items="${config.categoryList}" itemLabel="label" itemValue="value" htmlEscape="false"/>
            </form:select>
            <span class="help-inline">
					生成结构：{包名}/{模块名}/{分层(dao,entity,service,controller)}/{子模块名}/{java类}
				</span>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">生成包路径:</label>
        <div class="controls">
            <form:input path="packageName" htmlEscape="false" maxlength="500" class="required input-xlarge"/>
            <span class="help-inline">建议模块包：com.generator</span>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">生成模块名:</label>
        <div class="controls">
            <form:input path="moduleName" htmlEscape="false" maxlength="500" class="required input-xlarge"/>
            <span class="help-inline">可理解为子系统名，例如 sys</span>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">生成子模块名:</label>
        <div class="controls">
            <form:input path="subModuleName" htmlEscape="false" maxlength="500" class="input-xlarge"/>
            <span class="help-inline">可选，分层下的文件夹，例如 </span>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">生成功能描述:</label>
        <div class="controls">
            <form:input path="functionName" htmlEscape="false" maxlength="500" class="required input-xlarge"/>
            <span class="help-inline">将设置到类描述</span>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">生成功能名:</label>
        <div class="controls">
            <form:input path="functionNameSimple" htmlEscape="false" maxlength="500" class="required input-xlarge"/>
            <span class="help-inline">用作功能提示，如：保存“某某”成功</span>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">生成功能作者:</label>
        <div class="controls">
            <form:input path="functionAuthor" htmlEscape="false" maxlength="500" class="required input-xlarge"/>
            <span class="help-inline">功能开发者</span>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">业务表名:</label>
        <div class="controls">
            <form:select path="genTable.id" class="required input-xlarge">
                <form:options items="${tableList}" itemLabel="nameAndComments" itemValue="id" htmlEscape="false"/>
            </form:select>
            <span class="help-inline">生成的数据表，一对多情况下请选择主表。</span>
        </div>
    </div>
    <%--<div class="control-group hide">
        <label class="control-label">备注:</label>
            <div class="controls">
                <form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="200" class="input-xxlarge"/>
            </div>
    </div>--%>
    <div class="control-group">
        <label class="control-label">生成选项:</label>
        <div class="controls">
            <form:checkbox path="replaceFile" label="是否替换现有文件"/>
        </div>
    </div>
    <div class="form-actions">
        <input id="btnSubmit" class="btn btn-primary" type="submit" value="保存方案" onclick="$('#flag').val('0');"/>&nbsp;
        <input id="btnSubmit" class="btn btn-danger" type="submit" value="保存并生成代码" onclick="$('#flag').val('1');"/>&nbsp;
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>
