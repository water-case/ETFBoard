package com.myboard.etfboard.rank.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myboard.etfboard.rank.vo.ItemVO;
import com.myboard.etfboard.rank.vo.RankVO;

public interface RankDAO {

	List<RankVO> GetMemberList() throws DataAccessException;

	List<ItemVO> GetItemList(String name) throws DataAccessException;

}
