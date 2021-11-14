package com.myboard.etfboard.rank.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository("rankDAO")
public class RankDAOImpl implements RankDAO{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List GetMemberList() throws DataAccessException {
		return sqlSession.selectList("mapper.member.getMemberList");
	}
	
	
}
