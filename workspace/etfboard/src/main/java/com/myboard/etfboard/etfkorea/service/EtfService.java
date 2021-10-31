package com.myboard.etfboard.etfkorea.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

public interface EtfService {

	int getMoney(String name) throws DataAccessException;

	List getCheckList(String name) throws DataAccessException;
	
}
