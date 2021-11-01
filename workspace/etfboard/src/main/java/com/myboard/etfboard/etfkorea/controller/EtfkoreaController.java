package com.myboard.etfboard.etfkorea.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

public interface EtfkoreaController {
	
	// etf 조회
	public ModelAndView viewETFKOREA(HttpServletRequest request, HttpServletResponse response) throws Exception;
	// 모의투자 조회
	public ModelAndView viewMock(@RequestParam("name") String name, HttpServletRequest request, HttpServletResponse response) throws Exception;
	// 모의투자 종목 추가
	public ModelAndView MockAddItem(@RequestParam("name") String name, @RequestParam("itemcode") String itemcode, RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception;
	// 모의투자 종목 삭제
	public ModelAndView MockSubItem(@RequestParam("name") String name, @RequestParam("itemcode") String itemcode, RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception;
}
