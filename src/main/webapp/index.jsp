<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import="java.io.*,java.util.*,java.sql.*"%>  
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql"  prefix="sql" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home page</title>
     <style>
         h2{
             text-align: center;
         }
         table{
             margin: 20px auto;
            border-collapse: collapse;
         }
         tr,td,th{
            border: 1px solid #000;
            text-align: center;
         }
         tr{
             height: 40px;
         }
         td,th{
             width: 160px;
         }
     </style>
</head>
<body>

<sql:setDataSource var="mysql" scope="session" driver="com.mysql.jdbc.Driver" 
	url="jdbc:mysql://localhost/training"
	user="root" password="1234"
/>
 <sql:query dataSource="${mysql }" var="result">
 	Select * from employee;
 </sql:query>
	<%@include  file="header.jsp" %>
    <div class="app">
        <h2>List User</h2>
        <h4><%= request.getAttribute("msg") != null ? request.getAttribute("msg"): " "  %></h4>
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Country</th>
                <th>Actions</th>
            </tr>
            

            <c:forEach var="row" items="${result.rows}" >
            	<tr>
            	<td><c:out value="${row.id}" /></td>
            	<td><c:out value="${row.name}" /></td>
            	<td><c:out value="${row.email}" /></td>
            	<td><c:out value="${row.country}" /></td>
            	<td>
            		<a href="edit.jsp?id=<c:out value="${row.id}" />">edit</a>
            		<a href="delete.jsp?id=<c:out value="${row.id}" />">delete</a>
            	</td>
            	</tr>
            
            </c:forEach>
            

        </table>
    </div>
</body>
</html>