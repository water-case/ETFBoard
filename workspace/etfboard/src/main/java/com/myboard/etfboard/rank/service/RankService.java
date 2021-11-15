package com.myboard.etfboard.rank.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myboard.etfboard.rank.vo.RankVO;

public interface RankService {

	List<RankVO> GetMemberList() throws DataAccessException;

	void CalNowAsset(List<RankVO> memberList) throws Exception;
	
}
