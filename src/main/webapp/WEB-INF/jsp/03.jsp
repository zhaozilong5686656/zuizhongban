<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: suzhoutanxun
  Date: 2022/7/28
  Time: 11:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div id="he1">
    <form action="/con7">
        <p>请输入编号</p><input name="code" type="text">
        <p>请输入开始日期</p><input name="date1" type="date">
        <p>请输入结束日期</p><input name="date2" type="date">
        <input type="submit" value="查询"><br><br>
    </form>
    <h2 align="center"><a href="/con8">导出</a></h2>
</div>


<div>
<table align="center"border="1" <%--width="600" height="150"--%> cellspacing="3" <%--bgcolor="#6495ed"--%>>
    <thead>
    <tr  align="center"<%-- bgcolor="#f0f8ff"--%>>
        <td>编号</td>
        <td>日期</td>
        <td>体验人次</td>
        <td>查看人次</td>
        <td>分享人次</td>
        <td>打印</td>
        <td>雕刻</td>
        <td>点赞</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${user}" var="s" varStatus="st">
        <tr align="center" <%--bgcolor="#f0f8ff"--%>>
            <td>${s.id}</td>
            <td>${s.data}</td>
            <td>${s.experiencepeople}</td>
            <td>${s.lookatpeople}</td>
            <td>${s.sharem}</td>
            <td>${s.printm}</td>
            <td>${s.carvingm}</td>
            <td>${s.praise}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</div>
<div>
    <h1 align="center">当前第${PageInfo.pageNum}页,总共${PageInfo.pages}页,总共${PageInfo.total}条记录</h1>
</div>
<div id="sec">
<ul id="nav" class="pageination">
    <li class="active"><a href="/con7?page=1&code=<%=request.getParameter("code")%>&date1=<%=request.getParameter("date1")%>&date2=<%=request.getParameter("date2")%>">首页</a></li>
    <c:if test="${PageInfo.pageNum == 1}">
        <li a="/con3?page=1">&laquo;</li>
    </c:if>
    <c:if test="${PageInfo.pageNum != 1 }">
        <li><a href="/con7?page=${PageInfo.pageNum-1}&code=<%=request.getParameter("code")%>&date1=<%=request.getParameter("date1")%>&date2=<%=request.getParameter("date2")%>">&laquo;</a></li>

    </c:if>

    <c:forEach items="${PageInfo.navigatepageNums }" var="page_Num">

        <c:if test="${page_Num == PageInfo.pageNum }">
            <li class="active"><a href="#">${page_Num}</a></li>
        </c:if>
        <c:if test="${page_Num != PageInfo.pageNum }">
            <li><a href="/con7?page=${page_Num}&code=<%=request.getParameter("code")%>&date1=<%=request.getParameter("date1")%>&date2=<%=request.getParameter("date2")%>">${page_Num}</a></li>
        </c:if>

    </c:forEach>

    <c:if test="${PageInfo.pageNum == PageInfo.pages }">
        <li><a href="/con7?page=${PageInfo.pages}&code=<%=request.getParameter("code")%>&date1=<%=request.getParameter("date1")%>&date2=<%=request.getParameter("date2")%>">&laquo;</a></li>
    </c:if>
    <c:if test="${PageInfo.pageNum != PageInfo.pages }">
        <li><a href="/con7?page=${PageInfo.pageNum+1}&code=<%=request.getParameter("code")%>&date1=<%=request.getParameter("date1")%>&date2=<%=request.getParameter("date2")%>">&raquo;</a></li>
    </c:if>

    <li class="active"><a href="/con7?page=${PageInfo.pages}&code=<%=request.getParameter("code")%>&date1=<%=request.getParameter("date1")%>&date2=<%=request.getParameter("date2")%>">尾页</a></li>
</ul>
</div>
</body>
<style type="text/css">
    table{
        border-collapse: collapse;
    }
    input{
        width: 10%;
        padding: 12px 10px;
        margin: 8px;
        background-color: #94ed64;
        border-radius: 10px;  /*轮廓*/
        float: left;
    }
    p{
        float: left;
        /*color: #10892c;*/
    }
    #he1{
        display: flex;
        justify-content: center;
        align-items: center;
    }
    #sec{
        display: flex;
        justify-content: center;
        align-items: center;
    }
    ul li {
        display: inline;
    }

    ul a {

        line-height: 30px;

        color: #99004f;

        text-decoration: none;

        padding: 10px 10px;
    }
    ul li{
        border: solid 2px #132612;
    }
    /*body{
        background-color: #3f8e3c;
    }*/
</style>

</html>
