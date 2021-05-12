<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 세션 삭제
	session.invalidate();

	// 홈화면으로 리다이렉트
	response.sendRedirect("/MyWeb"); // request.getContext()
%>