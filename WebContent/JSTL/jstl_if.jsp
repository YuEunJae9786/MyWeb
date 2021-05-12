<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 추가로 종속된 태그아 없으면 /> 마감처리합니다. -->
	<c:set var="num" value="1" />
	<!-- 변수출력 -->
	<c:out value="${num }" />
	
	<hr/>
	
	<!-- test는 조건이 들어갑니다 -->
	<c:if test="true">
		<p>무조건 실행되는 문장^^</p>
	</c:if>
	
	<% if(true) { %>
		<p>무조건 실행되는 문장^^</p>
	<% } %>
	
	<hr/>
	
	<c:if test="${num eq 1 }">
		<p>num은 1이네요~</p>
	</c:if>
	
	<hr/>
	
	<h2>파라미터값을 el jstl로 받기</h2>
	<c:if test="${param.name eq '홍길동' }">
		홍길동 입니다.
	</c:if>
	
	<c:if test="${param.name == '이순신' }">
		이순신 입니다.
	</c:if>
	
	<% if(request.getParameter("name").equals("이순신")) { %>
		이순신 입니다.
	<% } %>	
	
	<hr/>
	
	<!-- age파라미터값이 20이상이면 성인입니다. 20미만이면 미성년자 입니다 -->
	<c:if test="${param.age >= 20 }">
		성인 입니다.
	</c:if>
	<c:if test="${param.age < 20 }">
		미성년자 입니다.
	</c:if>
	
</body>
</html>