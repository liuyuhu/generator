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

        });
        function page(n, s) {
            $("#pageNo").val(n);
            $("#pageSize").val(s);
            $("#searchForm").submit();
            return false;
        }

        function deleteConfirm(href) {
            var flag = confirm('确认要删除该代码模板吗？');
            if (flag) {
                window.location.href = href;
            } else {
            }
        }

    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li><a href="${base}/admin/gen/genScheme/">生成方案列表</a></li>
    <li><a href="${base}/admin/gen/genScheme/form">生成方案查看</a></li>
    <li><a href="${base}/admin/gen/genTable/">业务表列表</a></li>
    <li><a href="${base}/admin/gen/genTable/form">业务表查看</a></li>
    <li class="active"><a href="${base}/admin/gen/genTemplate/">代码模板列表</a></li>
    <li><a href="${base}/admin/gen/genTemplate/form">代码模板添加</a></li>
</ul>
<form:form id="searchForm" modelAttribute="genTemplate" action="${base}/admin/gen/genTemplate/" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <label>分类 ：</label><form:select path="category" class="input-medium">
</form:select>
    <label>名称 ：</label><form:input path="name" htmlEscape="false" maxlength="50" class="input-medium"/>
    &nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
</form:form>
<div id="messageBoxError" class="alert alert-error">
    <button data-dismiss="alert" class="close">×</button>
    代码模板管理，已废弃！模板管理改为XML配置方式，见 /src/main/java/com/thinkgem/jeesite/modules/gen/template 文件夹
</div>
<%--<sys:message content="${message}"/>--%>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>名称</th>
        <th>分类</th>
        <th>备注</th>
        <th>操作</th>
    </thead>
    <tbody>
    <c:forEach items="${page.result}" var="genTemplate">
        <tr>
            <td><a href="${base}/admin/gen/genTemplate/form?id=${genTemplate.id}">${genTemplate.name}</a></td>
            <td>
                <a href="${base}/admin/gen/genTemplate/form?id=${genTemplate.id}">修改</a>
                <a href="${base}/admin/gen/genTemplate/delete?id=${genTemplate.id}"
                   onclick="return deleteConfirm(this.href)">删除</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<%--<div class="pagination">${page}</div>--%>
</body>
</html>
