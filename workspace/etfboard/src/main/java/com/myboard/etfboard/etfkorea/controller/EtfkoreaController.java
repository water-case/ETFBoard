package com.myboard.etfboard.etfkorea.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface EtfkoreaController {
	
	// etf 조회
	public ModelAndView viewETFKOREA(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}
