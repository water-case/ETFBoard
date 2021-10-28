package com.myboard.etfboard.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myboard.etfboard.board.vo.BoardVO;

public interface BoardController {
	// 조회
	public ModelAndView BoardFirstList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	// 페이지별 조회
	public ModelAndView BoardPageList(@RequestParam("page") int page, HttpServletRequest request, HttpServletResponse response) throws Exception;
	// 글쓰기 폼
	public ModelAndView BoardWrite(HttpServletRequest request, HttpServletResponse response) throws Exception;
	// 글쓰기
	public ModelAndView DoBoardWrite(@ModelAttribute("board") BoardVO board, RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// 글내용 조회
	public ModelAndView ViewBoardContents(@RequestParam("index") int boardIndex, HttpServletRequest request, HttpServletResponse response) throws Exception;
	// 글수정 폼
	public ModelAndView UpdateBoardContents(@RequestParam("index") int boardIndex, HttpServletRequest request, HttpServletResponse response) throws Exception;
	// 글수정
	public ModelAndView DoUpdateBoardContents(@ModelAttribute("board") BoardVO board, RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception;
	// 글삭제
	public ModelAndView DeleteBoardContents(@RequestParam("index") int boardIndex, RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception;
	// 추천
	
	// 댓글조회, 쓰기
	// 댓글수정
	// 댓글삭제
	
	// 대댓글조회
	// 대댓글쓰기
	// 대댓글수정
	// 대댓글삭제
}
