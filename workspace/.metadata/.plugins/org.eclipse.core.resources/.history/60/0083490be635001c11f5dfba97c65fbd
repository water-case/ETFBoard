package com.myboard.etfboard.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myboard.etfboard.board.service.BoardService;

@Controller("boardController")
public class BoardControllerImpl implements BoardController{
	@Autowired
	private BoardService boardService;
	
	@Override
	@RequestMapping(value="/board" ,method = RequestMethod.GET)
	public ModelAndView listTexts(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List boardList = boardService.listTexts();
		ModelAndView mav = new ModelAndView();
		mav.addObject("boardList", boardList);
		mav.setViewName("/board");
		return mav;
	}
	
}
