package com.myboard.etfboard.main.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface MainController {
	public String viewMain(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String viewLogin(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String viewJoin(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
