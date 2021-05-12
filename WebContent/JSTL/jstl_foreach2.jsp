<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%
	List<Integer> list = new ArrayList<>();
	list.add(1);
	list.add(2);
	list.add(3);
	list.add(4);
	list.add(5);
	
	//request에 setAttr로 저장
	request.setAttribute("list", list);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<c:forEach var="i" items="${list }">
		${i }
	</c:forEach>
	

</body>
</html>