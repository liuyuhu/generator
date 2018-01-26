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
    <title>业务表管理</title>
    <meta name="decorator" content="default"/>
    <link rel="stylesheet" href="${base}/static/bootstrap-3.3.7/css/bootstrap.css">
    <script src="${base}/static/jquery-1.8.3.js"></script>
    <script src="${base}/static/bootstrap-3.3.7/js/bootstrap.js"></script>
    <script src="${base}/static/jquery.validate.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {

        });
        function page(n, s) {
            if (n) $("#pageNo").val(n);
            if (s) $("#pageSize").val(s);
            $("#searchForm").submit();
            return false;
        }
    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li><a href="${base}/admin/gen/genScheme/">生成方案列表</a></li>
    <li><a href="${base}/admin/gen/genScheme/form">生成方案查看</a></li>
    <li class="active"><a href="${base}/admin/gen/genTable/">业务表列表</a></li>
    <li><a href="${base}/admin/gen/genTable/form">业务表添加</a></li>
</ul>
<form:form id="searchForm" modelAttribute="genTable" action="${base}/admin/gen/genTable/" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <%--<sys:tableSort id="orderBy" name="orderBy" value="${page.orderBy}" callback="page();"/>--%>
    <label>表名：</label><form:input path="nameLike" htmlEscape="false" maxlength="50" class="input-medium"/>
    <label>说明：</label><form:input path="comments" htmlEscape="false" maxlength="50" class="input-medium"/>
    <label>父表表名：</label><form:input path="parentTable" htmlEscape="false" maxlength="50" class="input-medium"/>
    &nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
</form:form>
<%--<sys:message content="${message}"/>--%>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th class="sort-column name">表名</th>
        <th>说明</th>
        <th class="sort-column class_name">类名</th>
        <th class="sort-column parent_table">父表</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.result}" var="genTable">
        <tr>
            <td><a href="${base}/admin/gen/genTable/form?id=${genTable.id}">${genTable.name}</a></td>
            <td>${genTable.comments}</td>
            <td>${genTable.className}</td>
            <td title="点击查询子表">
                <a href="javascript" onclick="$('#parentTable').val('${genTable.parentTable}');
                        $('#searchForm').submit();">${genTable.parentTable}
                </a>
            </td>
            <td>
                <a href="${base}/admin/gen/genTable/form?id=${genTable.id}">修改</a>
                <a href="${base}/admin/gen/genTable/delete?id=${genTable.id}"
                   onclick="return confirmx('确认要删除该业务表吗？', this.href)">删除</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<%--<div class="pagination">${page}</div>--%>
</body>
</html>
