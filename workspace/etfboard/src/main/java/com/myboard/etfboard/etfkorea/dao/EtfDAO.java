package com.myboard.etfboard.etfkorea.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myboard.etfboard.etfkorea.vo.MockVO;

public interface EtfDAO {

	List<MockVO> getCheckList(String name) throws DataAccessException;

	int addItem(MockVO mockVO) throws DataAccessException;

	int subItem(MockVO mockVO) throws DataAccessException;

	int buyItem(MockVO mockVO) throws DataAccessException;

	int sellItem(MockVO mockVO) throws DataAccessException;
	
}
