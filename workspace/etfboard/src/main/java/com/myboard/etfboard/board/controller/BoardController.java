package com.myboard.etfboard.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface BoardController {
	// 조회
	public ModelAndView BoardFirstList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	// 페이지별 조회
	public ModelAndView BoardPageList(@RequestParam("page") int page, HttpServletRequest request, HttpServletResponse response) throws Exception;
	// 글쓰기
	// 글수정
	// 글삭제

	
	// 글내용, 댓글조회
	// 댓글쓰기
	// 댓글수정
	// 댓글삭제
	
	// 대댓글조회
	// 대댓글쓰기
	// 대댓글수정
	// 대댓글삭제
}
