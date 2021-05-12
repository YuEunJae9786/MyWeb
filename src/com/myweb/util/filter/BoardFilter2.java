package com.myweb.util.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

// 수정, 삭제에 대한 필터 (작성자와 세션값이 동일할 때만 실행되도록 처리)
@WebFilter({"/board/modify.board", "/board/update.board", "/board/delete.board"})
public class BoardFilter2 implements Filter{

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		request.setCharacterEncoding("UTF-8");
		
		/*
		 * 1. 등록화면에서 작성자를 id or 닉네임값으로 고정
		 * 2. 각 요청에서 id가 parameter로 전달되는지 확인
		 * 3. modify, update, delete요청에서 writer를 파라미터값으로 전달. 비교..
		 * 4. 화면에서 버튼을 안보이도록 처리
		 */
		
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse res = (HttpServletResponse)response;
		
		// 화면에서 전달되는 writer
		String writer = req.getParameter("writer");
		
		// 로그인된 사용자 세션에 user_id
		HttpSession session = req.getSession();
		String user_id = (String)session.getAttribute("user_id");
		
		if(user_id == null) { // 로그인이 안된경우
			res.sendRedirect("/MyWeb/user/login.jsp");
			return;
		} else if(writer == null || !user_id.equals(writer)) { // 잘못접근한 경우 or 로그인한 사용자가 일치하지 않는 경우

			res.setContentType("text/html");
			res.setCharacterEncoding("UTF-8");
			
			PrintWriter out = res.getWriter();
			out.println("<script>");
			out.println("alert('권한이 없습니다')");
			out.println("location.href='/MyWeb/board/list.board'");
			out.println("</script>");
			
			return;
		} 
		
		chain.doFilter(request, response);
	}
	
}
