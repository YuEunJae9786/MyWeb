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

// 1. Filter인터페이스를 상속받고 doFilter 오버라이딩 합니다
// 2. 필터등록 ( @WebFilter 어노테이션 방법 or web.xml 에 등록 )
//@WebFilter("/*") // 모든 요청 전부
//@WebFilter("*.board") // board로 끝나는 모든 요청
//@WebFilter("/board/write.board") // 정확히 해당요청으로 들어올때만 실행
@WebFilter({"/board/write.board", "/board/regist.board"}) // 글쓰기 화면이나, 글 등록시에만 실행
public class BoardFilter implements Filter{

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		request.setCharacterEncoding("UTF-8");
		
		// 필터를 이용해서 인가된 사용자만 글 등록을 하도록 처리.
		// ServletRequest는 HttpServletRequest의 부모타입.
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse res = (HttpServletResponse)response;
		
		HttpSession session = req.getSession();
		
		String user_id = (String)session.getAttribute("user_id");
		
		if(user_id == null) {
//			res.sendRedirect("list.board");
			// Out객체를 이용해서, 브라우저 측으로 스크립트형식을 만들어서 전달..
			
			res.setContentType("text/html"); // 문서의 형식지정
			res.setCharacterEncoding("UTF-8");
			
			PrintWriter out = res.getWriter(); // 출력의 방향-> 브라우저
			out.println("<script>");
			out.println("alert('권한이 없습니다')");
			out.println("location.href='/MyWeb/board/list.board'");
			out.println("</script>");
			
			return; // 필터함수의 종료(컨트롤러 실행x)
		}
		
		chain.doFilter(request, response); // 서블릿이나 or 연결되어 있는 다른 필터를 실행시킴
	}
}
