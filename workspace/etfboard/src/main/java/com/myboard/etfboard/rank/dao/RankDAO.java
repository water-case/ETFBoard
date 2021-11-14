package com.myboard.etfboard.rank.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

public interface RankDAO {

	List GetMemberList() throws DataAccessException;

}
