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
    <title>生成方案管理</title>
    <meta name="decorator" content="default"/>
    <link rel="stylesheet" href="${base}/static/bootstrap-3.3.7/css/bootstrap.css">
    <script src="${base}/static/jquery-1.8.3.js"></script>
    <script src="${base}/static/bootstrap-3.3.7/js/bootstrap.js"></script>
    <script src="${base}/static/jquery.validate.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {

        });
        function page(n, s) {
            $("#pageNo").val(n);
            $("#pageSize").val(s);
            $("#searchForm").submit();
            return false;
        }
    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li class="active"><a href="${base}/admin/gen/genScheme/">生成方案列表</a></li>
    <li><a href="${base}/admin/gen/genScheme/form">生成方案添加</a></li>
    <li><a href="${base}/admin/gen/genTable/">业务表列表</a></li>
    <li><a href="${base}/admin/gen/genTable/form">业务表查看</a></li>

</ul>
<form:form id="searchForm" modelAttribute="genScheme" action="${base}/admin/gen/genScheme/" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <label>方案名称 ：</label><form:input path="name" htmlEscape="false" maxlength="50" class="input-medium"/>
    &nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
</form:form>
<%--<sys:message content="${message}"/>--%>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>方案名称</th>
        <th>生成模块</th>
        <th>模块名</th>
        <th>功能名</th>
        <th>功能作者</th>
        <th colspan="2">操作</th>
    </thead>
    <tbody>
    <c:forEach items="${page.result}" var="genScheme">
        <tr>
            <td><a href="${base}/admin/gen/genScheme/form?id=${genScheme.id}">${genScheme.name}</a></td>
            <td>${genScheme.packageName}</td>
            <td>${genScheme.moduleName}${not empty genScheme.subModuleName?'.':''}${genScheme.subModuleName}</td>
            <td>${genScheme.functionName}</td>
            <td>${genScheme.functionAuthor}</td>
            <td><a href="${base}/admin/gen/genScheme/form?id=${genScheme.id}">修改</a></td>
            <td><a href="${base}/admin/gen/genScheme/delete?id=${genScheme.id}"
                   onclick="return confirmx('确认要删除该生成方案吗？', this.href)">删除</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<%--<div class="pagination">${page}</div>--%>
</body>
</html>
