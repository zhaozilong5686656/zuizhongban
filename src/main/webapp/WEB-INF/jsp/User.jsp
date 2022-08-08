<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: suzhoutanxun
  Date: 2022/7/25
  Time: 14:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table align="center" border="1" cellpadding="0">
    <tr>
    <td>id</td>
    <td>name</td>
    <td>address</td>
    <td>age</td>
    <td>sex</td>
    <td>phone</td>
    </tr>
    <c:forEach items="${user}" var="u" varStatus="st">
        <tr>
            <td>${u.id}</td>
            <td>${u.name}</td>
            <td>${u.address}</td>
            <td>${u.age}</td>
            <td>${u.sex}</td>
            <td>${u.phone}</td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
