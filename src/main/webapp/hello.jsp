<%@ page import="java.sql.Timestamp" %><%--
  Created by IntelliJ IDEA.
  Project name(项目名称)：JSTL_sql_dateParam_label
  Author(作者）: mao
  Author QQ：1296193245
  GitHub：https://github.com/maomao124/
  Date(创建日期)： 2022/1/9
  Time(创建时间)： 14:14
  Description(描述)：
  JSTL <sql:dateParam> 标签用来提供日期和时间的动态值，通常与 <sql:update> 和 <sql:query> 标签结合使用。
JSP <sql:dateParam> 标签的语法如下：
<sql:dataParam value="value" type="DATE|TIME|TIMESTAMP"/>
其中：
value：设置的日期参数
type：设置日期数据种类，有 DATE（只有日期）、TIME（只有时间）、TIMESTAMP（日期和时间）
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%!int no = 1;%>
<%--
var：代表数据源的变量；
driver：注册的 JDBC 驱动；mysql8.0:com.mysql.jdbc.Driver
url://地址:端口号/数据库名
user：连接数据库时使用的用户名；
password：连接数据库时使用的密码；
dataSource：已经存在的数据源；
scope：设定参数 var 的有效范围，默认为 page
--%>
<sql:setDataSource var="student" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/student"
                   user="root" password="20010713"/>
<%
    Timestamp create = new Timestamp(System.currentTimeMillis());
%>

<%--
var：用来存储所影响行数的变量；
dataSource：连接的数据源；
scope：设定参数 var 的有效范围，默认为 page；
sql：更新的 SQL 语句，可以是 INSERT、UPDATE、DELETE 语句。
--%>
<sql:update dataSource="${student}" var="result">
    insert into dateparamtest values(<%=no%>,?);
    <sql:dateParam value="<%=create%>" type="TIMESTAMP"/>
</sql:update>
<%no++;%>
<%--
var：代表SQL查询的结果；
dataSource：连接的数据源；
maxRows：设置最多可存放的记录条数；
scope：设定参数 var 的有效范围，默认为 page；
sql：查询的 SQL 语句；
startRow：开始查询的行数。
--%>
<sql:query var="result" dataSource="${student}">
    SELECT * FROM dateparamtest;
</sql:query>

<table border="1">
    <tr>
        <th>no</th>
        <th>date</th>
    </tr>
    <c:forEach var="row" items="${result.rows}">
        <tr>
            <td><c:out value="${row.no}"/></td>
            <td><c:out value="${row.date}"/></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
