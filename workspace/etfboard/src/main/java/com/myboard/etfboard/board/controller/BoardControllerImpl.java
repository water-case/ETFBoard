package com.myboard.etfboard.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myboard.etfboard.board.service.BoardService;

@Controller("boardController")
public class BoardControllerImpl implements BoardController{
	@Autowired
	private BoardService boardService;
	
	@Override
	@RequestMapping(value="/board" ,method = RequestMethod.GET)
	public ModelAndView BoardFirstList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		// 첫 페이지 글 목록 전송
		List boardList = boardService.FirstList();
		mav.addObject("boardList", boardList);
		mav.addObject("nowPage", 1);
		mav.addObject("startPageIndex", 0);
		// 전체 글 개수 조회
		int totalIndexCount = boardService.GetIndexCount();
		mav.addObject("totalIndexCount", 1+(totalIndexCount-1)/15);
		mav.setViewName("/board");
		return mav;
	}
	
	// 요청한 페이지대로 조회
	@Override
	@RequestMapping(value="/board/page*" ,method = RequestMethod.GET)
	public ModelAndView BoardPageList(@RequestParam("page") int page, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		// 페이지별 글 목록 전송
		List boardList = boardService.PageList(page);
		mav.addObject("boardList", boardList);
		mav.addObject("nowPage", page);
		mav.addObject("startPageIndex", (page-1)/5);
		// 전체 글 개수 조회후 Page 바인딩
		int totalIndexCount = boardService.GetIndexCount();
		mav.addObject("totalIndexCount", 1+(totalIndexCount-1)/15);
		mav.setViewName("/board");
		return mav;
	}
	
}
