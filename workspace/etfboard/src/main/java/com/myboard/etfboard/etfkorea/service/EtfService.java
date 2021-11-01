package com.myboard.etfboard.etfkorea.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myboard.etfboard.etfkorea.vo.MockVO;

public interface EtfService {

	int getMoney(String name) throws DataAccessException;

	List<MockVO> getCheckList(String name) throws DataAccessException;

	int addItem(MockVO mockVO) throws DataAccessException;

	int subItem(MockVO mockVO) throws DataAccessException;
	
}
