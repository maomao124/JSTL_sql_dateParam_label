<%--
  Created by IntelliJ IDEA.
  Project name(项目名称)：JSTL_sql_dateParam_label
  Author(作者）: mao
  Author QQ：1296193245
  GitHub：https://github.com/maomao124/
  Date(创建日期)： 2022/1/9
  Time(创建时间)： 14:44
  Description(描述)： 无
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:if test="${sessionScope.student==null}" >
    <sql:setDataSource var="student" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/student"
                       user="root" password="20010713" scope="session"/>
</c:if>
<%--
var：用来存储所影响行数的变量；
dataSource：连接的数据源；
scope：设定参数 var 的有效范围，默认为 page；
sql：更新的 SQL 语句，可以是 INSERT、UPDATE、DELETE 语句。
--%>
<sql:update dataSource="${student}" var="result">
    delete from dateparamtest;
</sql:update>
已执行
</body>
</html>
