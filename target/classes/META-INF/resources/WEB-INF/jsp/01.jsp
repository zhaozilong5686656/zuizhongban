<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: suzhoutanxun
  Date: 2022/7/25
  Time: 15:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查询数据库</title>
</head>
<body>
<center>
<table align="center" border="1" cellpadding="0" bgcolor = #00ffff>
    <thead>
    <tr bgcolor="blue" align="center">
        <td>编号</td>
        <td>日期</td>
        <td>experiencepeople</td>
        <td>0">lookatpeople</td>
        <td>sharem</td>
        <td>printm</td>
        <td>carvingm</td>
        <td>runtheday</td>
        <td>praise</td>
        <td>deviceaddress</td>
        <td>news</td>
        <td>state</td>
        <td>code</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${user}" var="s" varStatus="st">
        <tr align="center">
            <td>${s.id}</td>
            <td>${s.data}</td>
            <td>${s.experiencepeople}</td>
            <td>${s.lookatpeople}</td>
            <td>${s.sharem}</td>
            <td>${s.printm}</td>
            <td>${s.carvingm}</td>
            <td>${s.runtheday}</td>
            <td>${s.praise}</td>
            <td>${s.deviceaddress}</td>
            <td>${s.news}</td>
            <td>${s.state}</td>
            <td>${s.code}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div>
    当前第${PageInfo.pageNum}页,总共${PageInfo.pages}页,总共${PageInfo.total}条记录
</div>
    <ul id="nav" class="pageination">
        <li class="active"><a href="/con3?page=1">首页</a></li>
        <c:if test="${PageInfo.pageNum == 1}">
            <li a="/con3?page=1">&laquo;</li>
        </c:if>
        <c:if test="${PageInfo.pageNum != 1 }">
            <li><a href="/con3?page=${PageInfo.pageNum-1}">&laquo;</a></li>
        </c:if>

        <c:forEach items="${PageInfo.navigatepageNums }" var="page_Num">

            <c:if test="${page_Num == PageInfo.pageNum }">
                <li class="active"><a href="#">${page_Num}</a></li>
            </c:if>
            <c:if test="${page_Num != PageInfo.pageNum }">
                <li><a href="/con3?page=${page_Num}">${page_Num}</a></li>
            </c:if>

        </c:forEach>

        <c:if test="${PageInfo.pageNum == PageInfo.pages }">
            <li><a href="/con3?page=${PageInfo.pages}">&laquo;</a></li>
        </c:if>
        <c:if test="${PageInfo.pageNum != PageInfo.pages }">
            <li><a href="/con3?page=${PageInfo.pageNum+1}">&raquo;</a></li>
        </c:if>

        <li class="active"><a href="/con3?page=${PageInfo.pages}">尾页</a></li>
    </ul>
</center>

</body>
<style type="text/css">


    ul li {
        display: inline;
    }

    ul a {

        line-height: 40px;

        color: #99004f;

        text-decoration: none;

        padding: 20px 20px;
    }
    ul li{
        border: solid 2px #132612;
    }
    body{
        background-color: #3f8e3c;
    }
</style>
</html>
