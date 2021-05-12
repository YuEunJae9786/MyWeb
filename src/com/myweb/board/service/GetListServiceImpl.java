package com.myweb.board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myweb.board.model.BoardDAO;
import com.myweb.board.model.BoardVO;
import com.myweb.util.PageVO;

public class GetListServiceImpl implements IBoardService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		// 1. 화면전환 시에 조회하는 페이지번호 and 화면에 그려질 데이터개수 2개를 전달받음
		// 첫 페이지 경우
		int pageNum = 1;
		int amount = 10;
		
		// 페이지번호를 클릭하는 경우
		if(request.getParameter("pageNum") != null && request.getParameter("amount") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
			amount = Integer.parseInt(request.getParameter("amount"));
		}
		
		
		// DAO생성
		BoardDAO dao = BoardDAO.getInstance();
		
		// 2. pageVO생성
		List<BoardVO> list = dao.getList(pageNum, amount);
		int total = dao.getTotal(); // 전체게시글수
		PageVO pageVO = new PageVO(pageNum, amount, total);
		
		// 3. 페이지네이션을 화면에 전달
		request.setAttribute("pageVO", pageVO);
		
		// 화면에 가지고 나갈 list를 request에 저장 !!
		request.setAttribute("list", list);
	}
}
