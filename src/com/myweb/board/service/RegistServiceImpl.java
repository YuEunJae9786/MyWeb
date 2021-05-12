package com.myweb.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myweb.board.model.BoardDAO;

public class RegistServiceImpl implements IBoardService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		// Controller에서 처리할 내용을 service클래스가 분담...
		
		String writer = request.getParameter("writer");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		System.out.println(writer);
		System.out.println(title);
		System.out.println(content);
		
		BoardDAO dao = BoardDAO.getInstance();
		dao.regist(writer, title, content);
	}
}
