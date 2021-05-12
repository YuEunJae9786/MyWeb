<%@page import="com.myweb.user.model.UserVO"%>
<%@page import="com.myweb.user.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
	이 페이지에 진입할 때 회원에 대한 정보를 조회
	1. 아이디는 세션에서 구해서 getInfo메서드를 호출하고 getInfo메서드는 아이디 기반으로
	회원정보를 조회해서 가지고 옵니다.
	
	2. 화면에 미리값이 보여지도록 처리
	*/
	if(session.getAttribute("user_id") == null){
		response.sendRedirect("login.jsp");
	}
	
	UserVO vo = UserDAO.getInstance().getInfo((String)session.getAttribute("user_id"));
%>
<%@ include file="../include/header.jsp" %>
<section>
	<div align="center">
		<h2>MVC1방식 회원정보수정</h2>
		<hr/>
		<form action="update_ok.jsp" method="post" name="regForm">
			<table>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id" value="<%=vo.getId() %>" readonly></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="pw"></td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td><input type="password" name="pwCheck"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" value="<%=vo.getName() %>"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="email" name="email" value="<%=vo.getEmail() %>"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="address" value="<%=vo.getAddress() %>"></td>
				</tr>
			</table>
			
			<input type="button" value="수정" onclick="check()">
			<input type="button" value="마이페이지" onclick="location.href='mypage.jsp'">
			
		</form>
	</div>
</section>

<script>
	// 이 화면에서 사용할 js코드는 가장 아래쪽에 작성 합니다.
	function check(){
		// 폼값의 검증 js 코드
		// form태그는 문서의 하위 자식 태그형태로 document.form태그이름.input태그이름
		// console.log(document.regForm.id.value);
		
		if(document.regForm.id.value.length < 4){
			alert("아이디는 4글자 이상입니다");
			document.regForm.id.focus(); // 포커스 함수는 해당위치에 마우스포커싱
			return; // 함수 종료
		} else if(document.regForm.pw.value.length < 4){
			alert("비밀번호는 4글자 이상입니다")
			document.regForm.pw.focus();
			return;
		} else if(document.regForm.pw.value != document.regForm.pwCheck.value){
			alert("비밀번호 확인란을 확인하세요")
			document.regForm.pwCheck.focus();
			return;
		} else if(document.regForm.name.value == ""){
			alert("이름은 필수 사항입니다");
			document.regForm.name.focus();
			return;
		} else{
			document.regForm.submit(); // 해당 폼태그의 서브밋
		}
	}
</script>

<%@ include file="../include/footer.jsp" %>