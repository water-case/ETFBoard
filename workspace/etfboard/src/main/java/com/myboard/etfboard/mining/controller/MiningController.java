package com.myboard.etfboard.mining.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface MiningController {
	// 홈 이동
	public ModelAndView MiningHome(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
