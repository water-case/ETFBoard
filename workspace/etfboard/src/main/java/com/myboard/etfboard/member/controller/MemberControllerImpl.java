package com.myboard.etfboard.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myboard.etfboard.board.vo.ReplyVO;
import com.myboard.etfboard.member.service.MemberService;
import com.myboard.etfboard.member.vo.MemberVO;



@Controller("memberController")
//@EnableAspectJAutoProxy
public class MemberControllerImpl implements MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberControllerImpl.class);
	@Autowired
	private MemberService memberService;
	@Autowired
	private MemberVO memberVO;
	
	// 회원가입
	@Override
	@RequestMapping(value="/member/join.do" ,method = RequestMethod.POST)
	public ModelAndView memberJoin(@ModelAttribute("member") MemberVO member, RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView();
		// id, email 중복조회(ajax로)
		// id와 이메일이 중복되지 않으면 db에 sql문을 실행한다
		int result = memberService.addMember(member);
		if(result == 1) {
			rAttr.addAttribute("result","joinSuccess");
			mav.setViewName("redirect:/member/login");
		}
		else {
			rAttr.addAttribute("result","joinFail");
			mav.setViewName("redirect:/member/join");
		}
		return mav;
	}
	
	// 로그인
	@Override
	@RequestMapping(value="/member/login.do" ,method = RequestMethod.POST)
	public ModelAndView memberLogin(@ModelAttribute("member") MemberVO member, RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView();
		memberVO = memberService.login(member);
		if(memberVO != null) {
			HttpSession session = request.getSession();
			session.setAttribute("memberId", memberVO.getId());
			session.setAttribute("memberName", memberVO.getName());
			session.setAttribute("isLogOn", true);
			session.setMaxInactiveInterval(24*60*60); // 세션 유지시간 하루
			mav.setViewName("redirect:/member/loginSuccess");
		}else {
			rAttr.addAttribute("result","loginFail");
			mav.setViewName("redirect:/member/login");
		}
		return mav;
	}
	// 로그인 성공
	@Override
	@RequestMapping(value="/member/loginSuccess", method=RequestMethod.GET)
	public String loginSuccess(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "/main";
	}
	// 로그아웃
	@Override
	@RequestMapping(value = "/member/logout.do", method =  RequestMethod.GET)
	public ModelAndView memberLogout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("memberId");
		session.removeAttribute("memberName");
		session.removeAttribute("isLogOn");
		
		ModelAndView mav = new ModelAndView();
		
		// 로그아웃하면 메인이 아니라 현재페이지로 가도록 만들기
		mav.setViewName("redirect:/");
		return mav;
	}
	// id 중복체크
	@RequestMapping(value = "/member/idCheck", method = RequestMethod.POST) 
	@ResponseBody 
	public Map<String, String> IdCheck(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		int result = memberService.IdCheck(id);
		if(result == 0) {
			map.put("check", "true"); 
		} else {
			map.put("check", "false"); 
		}
		return map;
	}
	// name 중복체크
	@RequestMapping(value = "/member/nameCheck", method = RequestMethod.POST) 
	@ResponseBody 
	public Map<String, String> NameCheck(@RequestParam("name") String name, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		int result = memberService.NameCheck(name);
		if(result == 0) {
			map.put("check", "true"); 
		} else {
			map.put("check", "false"); 
		}
		return map;
	}
	// email 중복체크
	@RequestMapping(value = "/member/emailCheck", method = RequestMethod.POST) 
	@ResponseBody 
	public Map<String, String> EmailCheck(@RequestParam("email") String email, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		int result = memberService.EmailCheck(email);
		if(result == 0) {
			map.put("check", "true"); 
		} else {
			map.put("check", "false"); 
		}
		return map;
	}
}
