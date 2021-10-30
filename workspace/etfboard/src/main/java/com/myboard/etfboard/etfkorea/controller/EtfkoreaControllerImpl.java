package com.myboard.etfboard.etfkorea.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myboard.etfboard.etfkorea.vo.EtfVO;

@Controller("etfkoreaController")
public class EtfkoreaControllerImpl implements EtfkoreaController{

	// etf 조회
	@Override
	@RequestMapping(value="/etfkorea", method=RequestMethod.GET)
	public ModelAndView viewETFKOREA(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 크롤링
		String address = "https://finance.naver.com/api/sise/etfItemList.nhn?etfType=0&targetColumn=market_sum&sortOrder=desc&_callback=window.__jindo2_callback._4777";
		Document doc = Jsoup.connect(address).get();
		// json 데이터로 파싱
		String str = doc.text();
		String cut = str.substring(0, str.length()-2).substring(64);
		
		// json 데이터를 분해하기
		JSONParser jsonParse = new JSONParser();
		JSONObject jsonObj = (JSONObject) jsonParse.parse(cut);
		JSONArray etfArray = (JSONArray) jsonObj.get("etfItemList");
		
		List<EtfVO> etfList = new ArrayList<EtfVO>();
		for(int i=0; i<etfArray.size(); i++) {
			JSONObject etfObject = (JSONObject) etfArray.get(i);
			
			String tapCode = String.valueOf(etfObject.get("etfTabCode"));
			int marketSum = Integer.parseInt(String.valueOf(etfObject.get("marketSum")));	// 시가총액
			
			if(marketSum >= 500 && !tapCode.equals("3") && !tapCode.equals("7")) {
				int itemcode = Integer.parseInt(String.valueOf(etfObject.get("itemcode")));	// 종목코드
				String itemname = String.valueOf(etfObject.get("itemname"));				// 종목이름
				int nowVal = Integer.parseInt(String.valueOf(etfObject.get("nowVal")));		// 현재가
				double changeVal = Double.parseDouble(String.valueOf(etfObject.get("changeVal")));	// 전일비
				double changeRate = Double.parseDouble(String.valueOf(etfObject.get("changeRate")));// 등락률
				
				String str_nav = String.valueOf(etfObject.get("nav"));
				int nav = str_nav.equals("null") ? 0 : Integer.parseInt(str_nav.substring(0,str_nav.length()-2)); // nav
				
				int quant = Integer.parseInt(String.valueOf(etfObject.get("quant")));		// 거래량
				
				EtfVO etfVO = new EtfVO(itemcode, itemname, nowVal, changeVal, changeRate, nav, quant, marketSum);
				etfList.add(etfVO);
			}
		}
		
		//Collections.sort(etfList, Collections.reverseOrder()); // 시총기준 내림차순 정렬
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/etfkorea");
		mav.addObject("etfList", etfList);
		return mav;
	}
	
}