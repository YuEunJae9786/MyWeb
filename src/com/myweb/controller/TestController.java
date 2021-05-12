package com.myweb.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet("/TestController")
// 1. 서블릿을 확장자 패턴으로 변경
@WebServlet("*.test") // 확장자패턴
public class TestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public TestController() {
        super();
    }

    // 2. get, post요청을 doAction메서드 하나로 연결
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uri = request.getRequestURI(); // URI값
		String path = request.getContextPath(); // 컨텍스트 경로
		
		String command = uri.substring(path.length()); // 요청 분기
		
		System.out.println(command);
		
		if(command.contentEquals("/controller/join.test")) {
			// ....가입요청처리....
		} else if(command.contentEquals("/controller/login.test")) {
			// ....로그인처리...
		}
	}

}
