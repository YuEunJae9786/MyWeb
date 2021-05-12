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
	
	UserVO vo = new UserVO(id, pw, name, email, address, null);
	
	if(UserDAO.getInstance().update(vo) == 1){ // 성공
		session.setAttribute("user_name", vo.getName()); // 성공인 경우에 세션수정
%>
	<script>
		alert("회원정보가 정상 수정 되었습니다");
		location.href="mypage.jsp";
	</script>
<%
	} else { // 실패
%>
	<script>
		alert("회원정보 수정에 실패했습니다")
		location.href="mypage.jsp";
	</script>
<%		
	}
%>