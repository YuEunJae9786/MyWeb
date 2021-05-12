<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>아래값을 yyyy-mm-dd일 형식으로 변경해서 출력</h2>

	<c:set var="TIME_A" value="2020/05/03" />
	<fmt:parseDate var="v01" value="${TIME_A }" pattern="yyyy/MM/dd" />
	<fmt:formatDate var="a" value="${v01 }" pattern="yyyy-MM-dd일" />
	${a }<br/>

	<c:set var="TIME_B" value="2020-05-03 21:30:32" />
	<fmt:parseDate var="v02" value="${TIME_B }" pattern="yyyy-MM-dd HH:mm:ss" />
	<fmt:formatDate var="b" value="${v02 }" pattern="yyyy-MM-dd일" />
	${b }<br/>
	
	<c:set var="TIME_C" value="<%=new Date() %>" />
	<fmt:formatDate var="c" value="${TIME_C }" pattern="yyyy-MM-dd일" />
	${c }
	
</body>
</html>