<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/header.jsp"%>

<section>
	<div align="center">
		<h2>MVC1방식 회원가입</h2>
		<hr/>
		<form action="join_ok.jsp" method="post" name="regForm">
			<table>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id" placeholder="4글자 이상"></td>
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
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="email" name="email"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="address"></td>
				</tr>
			</table>
			
			<input type="button" value="가입" onclick="check()">
			<input type="button" value="로그인" onclick="location.href='login.jsp'">
			
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

<%@ include file="../include/footer.jsp"%>