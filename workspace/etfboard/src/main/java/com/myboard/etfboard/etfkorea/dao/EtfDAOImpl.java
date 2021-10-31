package com.myboard.etfboard.etfkorea.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("etfDAO")
public class EtfDAOImpl implements EtfDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List getCheckList(String name) {
		return sqlSession.selectList("mapper.mock.getCheckList", name);
	}
	
}