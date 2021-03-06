package com.myboard.etfboard.main.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("mainController")
public class MainControllerImpl implements MainController{
	
	@Override
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String viewMain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "/main";
	}

	@Override
	@RequestMapping(value="/member/login", method=RequestMethod.GET)
	public String viewLogin(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "/member/login";
	}
	
	@Override
	@RequestMapping(value="/member/join", method=RequestMethod.GET)
	public String viewJoin(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "/member/join";
	}
}
