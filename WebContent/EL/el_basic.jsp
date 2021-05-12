<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>EL태그는 표현식을 대신해서 사용합니다.</h2>

	<%= 1 + 2 %>	
	<%= 1 > 2 %>
	<hr/>
	
	${1 + 2 }<br/>
	${1 > 2 }<br/>
	<hr/>
	
	${1 == 2 }<br/>
	${1 eq 2 }<br/>
	<hr/>
	
	${1 < 2 && 1 > 2 }<br/>
	${1 < 2 and 1 > 2}<br/>
	<hr/>	
	
	${1 < 2 || 1 > 2 }<br/>
	${1 < 2 or 1 > 2 }<br/>
	<hr/>
	
	${ !false }<br/>
	${ not false}<br/>
	<hr/>
	
	${1 == 2 ? '같음' : '다름' }<br/>
	
</body>
</html>