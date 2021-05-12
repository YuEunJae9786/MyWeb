<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 페이지에 주소를 치고 진입하는 것을 막는 코드
	if(session.getAttribute("user_id") == null){
		response.sendRedirect("login.jsp");
	}
	
	request.setCharacterEncoding("UTF-8");

	String id = (String)session.getAttribute("user_id");
	String name = (String)session.getAttribute("user_name");
%>
    
<%@ include file="../include/header.jsp" %>

<section>
	<div align="center">
		<h2><%=id %>(<%=name %>)님 의 개인정보를 관리합니다</h2>
		
		<a href="logout.jsp">[로그아웃]</a>
		<a href="update.jsp">[정보수정]</a>
		<a href="delete.jsp">[회원탈퇴]</a>
	</div>
</section>
	
<%@ include file="../include/footer.jsp" %>