package com.myboard.etfboard.rank.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myboard.etfboard.rank.service.RankService;
import com.myboard.etfboard.rank.vo.RankVO;

@Controller("rankController")
public class RankControllerImpl implements RankController{
	@Autowired
	private RankService rankService;

	@Override
	@RequestMapping(value="/rank" ,method = RequestMethod.GET)
	public ModelAndView viewRank(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		// 회원정보 리스트 받아오기
		List<RankVO> memberList = rankService.GetMemberList();
		// 회원 정보 리스트 기반 현재자산 계산, 주력종목 top3 추출, 자산별 정렬
		rankService.CalNowAsset(memberList);
		
		mav.addObject("memberList", memberList);
		mav.setViewName("/rank");
		return mav;
	}
	
}
