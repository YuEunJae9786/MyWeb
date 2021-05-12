<%@page import="com.myweb.user.model.UserDAO"%>
<%@page import="com.myweb.user.model.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String address = request.getParameter("address");
	
	// 1. 회원아이디 중복검사
	UserDAO dao = UserDAO.getInstance();
	
	if(dao.checkId(id) == 0){ // 중복.
%>
	<script>
		alert("아이디가 중복 되었습니다");
		history.go(-1); // 뒤로가기
	</script>
<%
	} else{
		// 2. 회원가입
		if(dao.join(new UserVO(id, pw, name, email, address, null)) == 1){
%>
	<script>
		alert("회원 가입을 축하합니다!")
		location.href="login.jsp";
	</script>
<%
		} else{
%>
	<script>
		alert("네트워크 오류 입니다. 관리자에게 문의하세요");
		location.href="join.jsp";
	</script>
<%			
		}
	}
%>