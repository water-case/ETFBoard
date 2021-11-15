package com.myboard.etfboard.mining.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller("miningController")
public class MiningControllerImpl implements MiningController{

	@Override
	@RequestMapping(value="/mining" ,method = RequestMethod.GET)
	public ModelAndView MiningHome(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/mining");
		return mav;
	}
	
}
