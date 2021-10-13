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
	<jsp:useBean id="em" class="controller.Employee" ></jsp:useBean>
	<jsp:setProperty name="em" property="*" />
	
	<sql:update dataSource="${mysql}" var="count">
	
		Insert into employee(name, email, country) values(?,?,?);
		<sql:param value="${param.name}"/>
		<sql:param value="${param.email}"/>
		<sql:param value="${param.country}"/>
		
	</sql:update>
	
	<c:if test="${count >0 }">
		<c:redirect url="index.jsp">
			<c:param name="msg_success" value="Thêm thành công"/>
		</c:redirect>
	</c:if>
	
</body>
</html>