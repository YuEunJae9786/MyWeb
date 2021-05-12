<%@page import="com.myweb.user.model.UserDAO"%>
<%@page import="com.myweb.user.model.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
	1. 로그인페이지에서 넘어오는 id, pw를 받습니다.
	2. DAO에 login(id, pw)메서드를 생성
	3. login메서드 안에서 id,pw기준으로 로그인검증을 시도합니다.
		로그인결과가 있다면 UserVO에 회원의 아이디와 이름을 저장하고 UserVO를 반환 받습니다.
	
	4. login_ok에서는 UserVO값이 null이 아니면(로그인 성공), 세션에 아이디, 이름을 저장하세요.
		mypage.jsp로 리다이렉트
		
		UserVO값이 null이라면 실패를 의미하므로 script로 "아이디 비밀번호 확인하세요" 출력한 후에
		다시 로그인페이지로 이동
	*/
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	UserVO vo = UserDAO.getInstance().login(id, pw);
	
	if(vo != null){
		session.setAttribute("user_id", vo.getId());
		session.setAttribute("user_name", vo.getName());
		
		response.sendRedirect("mypage.jsp");
	} else{
%>
	<script>
		alert("아이디와 비밀번호를 확인하세요")
		history.go(-1);
	</script>
<%		
	}
%>