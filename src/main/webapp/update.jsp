<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql"  prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	
	<sql:update dataSource="${mysql}" var="count">
	
		Update employee set name= ?, email= ?, country= ? where id= ?;
		<sql:param value="${param.name}"/>
		<sql:param value="${param.email}"/>
		<sql:param value="${param.country}"/>
		<sql:param value="${param.id}"/>
	</sql:update>
	
	<c:if test="${count >0 }">
		<c:redirect url="index.jsp">
			<c:param name="msg_success" value="Sửa thành công"/>
		</c:redirect>
	</c:if>
	
</body>
</html>