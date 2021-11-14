package com.myboard.etfboard.rank.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

public interface RankService {

	List GetMemberList() throws DataAccessException;
	
}
