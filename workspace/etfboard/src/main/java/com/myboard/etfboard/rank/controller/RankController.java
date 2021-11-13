package com.myboard.etfboard.rank.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface RankController {
	public ModelAndView viewRank(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
