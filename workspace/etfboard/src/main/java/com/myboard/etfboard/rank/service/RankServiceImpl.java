package com.myboard.etfboard.rank.service;

import java.util.Collections;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.myboard.etfboard.rank.dao.RankDAO;
import com.myboard.etfboard.rank.vo.ItemVO;
import com.myboard.etfboard.rank.vo.RankVO;

@Service("rankService")
public class RankServiceImpl implements RankService{
	@Autowired
	private RankDAO rankDAO;

	@Override
	public List<RankVO> GetMemberList() throws DataAccessException {
		return rankDAO.GetMemberList();
	}

	@Override
	public void CalNowAsset(List<RankVO> memberList) throws Exception {
		// 회원수만큼 for문
		for(int i=0; i<memberList.size();i++) {
			// 개인별 종목정보 받아오기
			List<ItemVO> itemList = rankDAO.GetItemList(memberList.get(i).getName());
			
			// 로직 효율을 위한 임시변수들
			RankVO member = memberList.get(i);
			int result = member.getMoney();
			String[] top3 = new String[3];
			int[] top3val = new int[3];
			
			// 종목갯수만큼 for문
			for(int j=0; j<itemList.size(); j++) {
				// 종목현재가 받아올 url 세팅
				String address = "https://polling.finance.naver.com/api/realtime?query=SERVICE_ITEM:"+itemList.get(j).getItemcode();
				Document doc = Jsoup.connect(address).get();
				
				// json 데이터를 분해하기
				JSONParser jsonParse = new JSONParser();
				JSONObject jsonObj = (JSONObject) jsonParse.parse(doc.text());
				JSONObject _result = (JSONObject) jsonObj.get("result");
				JSONArray _areasArray = (JSONArray) _result.get("areas");
				JSONObject _areas = (JSONObject) _areasArray.get(0);
				JSONArray _datasArray = (JSONArray) _areas.get("datas");
				JSONObject _datas = (JSONObject) _datasArray.get(0);
				
				String name = String.valueOf(_datas.get("nm")); 				// 종목명
				int price = Integer.parseInt(String.valueOf(_datas.get("nv"))); // 종목현재가
				// 주식자산+=종목현재가*보유개수
				int result_ = price*itemList.get(j).getHavenum();
				result += result_;
				
				if(result_ > top3val[0]) {
					// if top1 보다 크면 top1에 종목명 주입, top1->top2, top2->top3
					top3[2] = top3[1];
					top3val[2] = top3val[1];
					top3[1] = top3[0];
					top3val[1] = top3val[0];
					
					top3[0] = name;
					top3val[0] = result_;
				} else if(result_ > top3val[1]) {
					// else if top2 보다 크면 top2에 종목명 주입, top2->top3
					top3[2] = top3[1];
					top3val[2] = top3val[1];
					
					top3[1] = name;
					top3val[1] = result_;
					
				} else if(result_ > top3val[2]) {
					// else if top3 보다 크면 top3에 종목명 주입
					top3[2] = name;
					top3val[2] = result_;
				}
			}
			// 로직 효율을 위해 임시변수에 저장한 값들 전송
			member.setMoney(result);
			member.setTop3(top3);
			member.setTop3val(top3val);
		}
		// 자산순으로 리스트 내림차순 정렬
		Collections.sort(memberList);
	}
}