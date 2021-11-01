package com.myboard.etfboard.etfkorea.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myboard.etfboard.etfkorea.vo.MockVO;

@Repository("etfDAO")
public class EtfDAOImpl implements EtfDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<MockVO> getCheckList(String name)  throws DataAccessException {
		return sqlSession.selectList("mapper.mock.getCheckList", name);
	}

	@Override
	public int addItem(MockVO mockVO) throws DataAccessException {
		return sqlSession.insert("mapper.mock.addItem", mockVO);
	}

	@Override
	public int subItem(MockVO mockVO) throws DataAccessException {
		return sqlSession.delete("mapper.mock.subItem", mockVO);
	}

	@Override
	public int buyItem(MockVO mockVO) throws DataAccessException {
		sqlSession.update("mapper.member.buyItem", mockVO);
		return sqlSession.update("mapper.mock.buyItem", mockVO);
	}

	@Override
	public int sellItem(MockVO mockVO) throws DataAccessException {
		sqlSession.update("mapper.member.sellItem", mockVO);
		return sqlSession.update("mapper.mock.sellItem", mockVO);
	}
	
}
