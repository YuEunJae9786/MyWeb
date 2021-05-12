<%@page import="com.myweb.user.model.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	UserVO vo = new UserVO();
	vo.setId("kkk123");
	vo.setName("길동");
	
	request.setAttribute("vo", vo);
	
	request.getRequestDispatcher("el_request_ok.jsp").forward(request, response);
%>
