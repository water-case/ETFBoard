package com.myboard.etfboard.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myboard.etfboard.member.vo.MemberVO;

public interface MemberController {
	// 회원가입
	public ModelAndView memberJoin(@ModelAttribute("member") MemberVO memberVO, RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// 로그인
	public ModelAndView memberLogin(@ModelAttribute("member") MemberVO member, RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String loginSuccess(HttpServletRequest request, HttpServletResponse response) throws Exception;
	// 로그아웃
	public ModelAndView memberLogout(HttpServletRequest request, HttpServletResponse response) throws Exception;

}