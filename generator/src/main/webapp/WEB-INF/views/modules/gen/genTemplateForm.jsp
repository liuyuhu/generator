<%--
  Created by IntelliJ IDEA.
  User: lyh
  Date: 2018/1/25
  Time: 9:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<c:set var="base" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>代码模板管理</title>
    <meta name="decorator" content="default"/>
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
    <li><a href="${base}/admin/gen/genScheme/form">生成方案查看</a></li>
    <li><a href="${base}/admin/gen/genTable/">业务表列表</a></li>
    <li><a href="${base}/admin/gen/genTable/form">业务表查看</a></li>
    <li><a href="${base}/admin/gen/genTemplate/">代码模板列表</a></li>
    <li class="active">
        <a href="${base}/admin/gen/genTemplate/form?id=${genTemplate.id}">代码模板
            ${not empty genTemplate.id?'修改':'添加'}查看
        </a>
    </li>
</ul>
<br/>
<form:form id="inputForm" modelAttribute="genTemplate" action="${base}/admin/gen/genTemplate/save" method="post"
           class="form-horizontal">
    <form:hidden path="id"/>
    <%--<sys:message content="${message}"/>--%>
    <div class="control-group">
        <label class="control-label">名称:</label>
        <div class="controls">
            <form:input path="name" htmlEscape="false" maxlength="200" class="required"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">归属分类:</label>
        <div class="controls"><%--
				<form:select path="category" class="required">
					<form:option value=""></form:option>
					<form:options items="${fns:getDictList('gen_category')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select> --%>
            <%--<form:checkboxes items="${fns:getDictList('gen_category')}" path="categoryList" itemLabel="label"
                             itemValue="value" htmlEscape="false"/>--%>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">生成路径:</label>
        <div class="controls">
            <form:input path="filePath" htmlEscape="false" maxlength="500" class="required input-xxlarge"/>
            <br/>
            <span class="help-inline">
					示例如下：<br/>
					java：src/main/java/\${packageName}/\${moduleName}/entity/\${subModuleName}<br/>
					view：src/main/webapp/WEB-INF/views/\${lastPackageName}/${moduleName}/\${subModuleName}<br/>
					mapper:/src/main/resources/mappings/\${dbType}/\${lastPackageName}/\${moduleName}/\${subModuleName}
				</span>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">生成文件名:</label>
        <div class="controls">
            <form:input path="fileName" htmlEscape="false" maxlength="500" class="required input-xlarge"/>
            <br/>
            <span class="help-inline">
					示例如下：<br/>
					java：\${ClassName}Entity.jsp<br/>
					view：\${className}List.jsp
				</span>
        </div>
    </div>
    <div class="form-actions">
        <input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>
