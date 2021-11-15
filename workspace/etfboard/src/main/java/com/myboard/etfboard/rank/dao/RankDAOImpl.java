package com.myboard.etfboard.rank.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myboard.etfboard.rank.vo.ItemVO;
import com.myboard.etfboard.rank.vo.RankVO;

@Repository("rankDAO")
public class RankDAOImpl implements RankDAO{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<RankVO> GetMemberList() throws DataAccessException {
		return sqlSession.selectList("mapper.rank.getRankList");
	}

	@Override
	public List<ItemVO> GetItemList(String name) throws DataAccessException {
		return sqlSession.selectList("mapper.rank.getItemList", name);
	}
	
}
