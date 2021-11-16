package com.myboard.etfboard.etfkorea.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myboard.etfboard.etfkorea.service.EtfService;
import com.myboard.etfboard.etfkorea.vo.EtfVO;
import com.myboard.etfboard.etfkorea.vo.MockVO;

@Controller("etfkoreaController")
public class EtfkoreaControllerImpl implements EtfkoreaController{
	@Autowired
	private EtfService etfService;
	
	// etf 조회
	@Override
	@RequestMapping(value="/etfkorea", method=RequestMethod.GET)
	public ModelAndView viewETFKOREA(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 크롤링
		String address = "https://finance.naver.com/api/sise/etfItemList.nhn?etfType=0&targetColumn=market_sum&sortOrder=desc";
		Document doc = Jsoup.connect(address).get();
		
		// json 데이터를 분해하기
		JSONParser jsonParse = new JSONParser();
		JSONObject jsonObj = (JSONObject) jsonParse.parse(doc.text());
		JSONObject jsonObj2 = (JSONObject) jsonObj.get("result");
		JSONArray etfArray = (JSONArray) jsonObj2.get("etfItemList");
		
		List<EtfVO> etfList = new ArrayList<EtfVO>();
		for(int i=0; i<etfArray.size(); i++) {
			JSONObject etfObject = (JSONObject) etfArray.get(i);
			
			String tapCode = String.valueOf(etfObject.get("etfTabCode"));
			int marketSum = Integer.parseInt(String.valueOf(etfObject.get("marketSum")));	// 시가총액
			
			if(marketSum >= 500 && !tapCode.equals("3") && !tapCode.equals("7")) {
				String itemcode = String.valueOf(etfObject.get("itemcode"));	// 종목코드
				String itemname = String.valueOf(etfObject.get("itemname"));				// 종목이름
				int nowVal = Integer.parseInt(String.valueOf(etfObject.get("nowVal")));		// 현재가
				int changeVal = Integer.parseInt(String.valueOf(etfObject.get("changeVal")));	// 전일비
				double changeRate = Double.parseDouble(String.valueOf(etfObject.get("changeRate")));// 등락률
				
				String str_nav = String.valueOf(etfObject.get("nav"));
				int nav = str_nav.equals("null") ? 0 : Integer.parseInt(str_nav.substring(0,str_nav.length()-2)); // nav
				
				int quant = Integer.parseInt(String.valueOf(etfObject.get("quant")));		// 거래량
				
				EtfVO etfVO = new EtfVO(itemcode, itemname, nowVal, changeVal, changeRate, nav, quant, marketSum);
				etfList.add(etfVO);
			}
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/etfkorea");
		mav.addObject("etfList", etfList);
		return mav;
	}
	
	// 모의투자조회
	@Override
	@RequestMapping(value="/etfsimulator", method=RequestMethod.GET)
	public ModelAndView viewMock(@RequestParam("name") String name, HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("mockName");
		session.setAttribute("mockName", name);
		session.setMaxInactiveInterval(24*60*60); // 세션 유지시간 하루
		
		ModelAndView mav = new ModelAndView();

		// 잔고조회
		int money = etfService.getMoney(name);
		mav.addObject("money", money);
		// 매수한 etf 조회
		List<MockVO> checkList = etfService.getCheckList(name);
		int totalBuyMoney = 0;
		
		// 종목명, 현재가 크롤링
		for(int i=0; i<checkList.size();i++) {
			String address = "https://polling.finance.naver.com/api/realtime?query=SERVICE_ITEM:"+checkList.get(i).getItemcode();
			Document doc = Jsoup.connect(address).get();
			
			// json 데이터를 분해하기
			JSONParser jsonParse = new JSONParser();
			JSONObject jsonObj = (JSONObject) jsonParse.parse(doc.text());
			JSONObject _result = (JSONObject) jsonObj.get("result");
			JSONArray _areasArray = (JSONArray) _result.get("areas");
			JSONObject _areas = (JSONObject) _areasArray.get(0);
			JSONArray _datasArray = (JSONArray) _areas.get("datas");
			JSONObject _datas = (JSONObject) _datasArray.get(0);
			
			checkList.get(i).setItemName(String.valueOf(_datas.get("nm")));
			checkList.get(i).setNowPrice(String.valueOf(_datas.get("nv")));
			checkList.get(i).setSavePrice(String.valueOf(_datas.get("sv")));
			
			// 투자 자산 계산
			totalBuyMoney += checkList.get(i).getBuymoney();
		}
		mav.addObject("totalBuyMoney", totalBuyMoney);
		mav.addObject("checkList", checkList);
		mav.setViewName("/etfsimulator");
		return mav;
	}
	
	// 종목 추가
	@Override
	@RequestMapping(value="/etfsimulator/add", method=RequestMethod.GET)
	public ModelAndView MockAddItem(@RequestParam("name") String name, @RequestParam("itemcode") String itemcode, RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		MockVO mockVO = new MockVO(name, itemcode);
		
		// 존재하는 종목이면 add
		int result = etfService.addItem(mockVO);
		rAttr.addAttribute("name",name);
		mav.setViewName("redirect:/etfsimulator");
		return mav;
	}
	
	// 종목 삭제
	@Override
	@RequestMapping(value="/etfsimulator/sub", method=RequestMethod.GET)
	public ModelAndView MockSubItem(@RequestParam("name") String name, @RequestParam("itemcode") String itemcode, RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		MockVO mockVO = new MockVO(name, itemcode);
		
		// 존재하는 종목이면 add
		int result = etfService.subItem(mockVO);
		rAttr.addAttribute("name",name);
		mav.setViewName("redirect:/etfsimulator");
		return mav;
	}
	
	// 매수
	@RequestMapping(value="/etfsimulator/buy", method=RequestMethod.GET)
	public ModelAndView MockBuy(@RequestParam("name") String name, @RequestParam("itemcode") String itemcode, @RequestParam("buyNum") String buyNum, RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 현재가 크롤링
		String address = "https://polling.finance.naver.com/api/realtime?query=SERVICE_ITEM:"+itemcode;
		Document doc = Jsoup.connect(address).get();
		
		JSONParser jsonParse = new JSONParser();
		JSONObject jsonObj = (JSONObject) jsonParse.parse(doc.text());
		JSONObject _result = (JSONObject) jsonObj.get("result");
		JSONArray _areasArray = (JSONArray) _result.get("areas");
		JSONObject _areas = (JSONObject) _areasArray.get(0);
		JSONArray _datasArray = (JSONArray) _areas.get("datas");
		JSONObject _datas = (JSONObject) _datasArray.get(0);
		
		String nowPrice = String.valueOf(_datas.get("nv"));
		
		ModelAndView mav = new ModelAndView();
		MockVO mockVO = new MockVO(name, itemcode, nowPrice, buyNum);
		int result = etfService.buyItem(mockVO);
		
		rAttr.addAttribute("name",name);
		mav.setViewName("redirect:/etfsimulator");
		return mav;
	}
	
	// 매도
	@RequestMapping(value="/etfsimulator/sell", method=RequestMethod.GET)
	public ModelAndView MockSell(@RequestParam("name") String name, @RequestParam("itemcode") String itemcode, @RequestParam("sellNum") String sellNum, RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 현재가 크롤링
		String address = "https://polling.finance.naver.com/api/realtime?query=SERVICE_ITEM:"+itemcode;
		Document doc = Jsoup.connect(address).get();
		
		JSONParser jsonParse = new JSONParser();
		JSONObject jsonObj = (JSONObject) jsonParse.parse(doc.text());
		JSONObject _result = (JSONObject) jsonObj.get("result");
		JSONArray _areasArray = (JSONArray) _result.get("areas");
		JSONObject _areas = (JSONObject) _areasArray.get(0);
		JSONArray _datasArray = (JSONArray) _areas.get("datas");
		JSONObject _datas = (JSONObject) _datasArray.get(0);
		
		String nowPrice = String.valueOf(_datas.get("nv"));
		
		ModelAndView mav = new ModelAndView();
		MockVO mockVO = new MockVO(name, itemcode, nowPrice, sellNum);
		int result = etfService.sellItem(mockVO);
		
		rAttr.addAttribute("name",name);
		mav.setViewName("redirect:/etfsimulator");
		return mav;
	}
	
	// 환전 폼
	@RequestMapping(value="/exchange", method = RequestMethod.GET)
	public ModelAndView ExchangeForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/exchange");
		return mav;
	}
}