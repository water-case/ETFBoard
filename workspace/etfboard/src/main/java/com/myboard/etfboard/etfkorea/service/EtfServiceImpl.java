package com.myboard.etfboard.etfkorea.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.myboard.etfboard.etfkorea.dao.EtfDAO;
import com.myboard.etfboard.member.dao.MemberDAO;

@Service("etfService")
public class EtfServiceImpl implements EtfService{
	@Autowired
	private EtfDAO etfDAO;
	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public int getMoney(String name) throws DataAccessException {
		return memberDAO.getMoney(name);
	}

	@Override
	public List getCheckList(String name) throws DataAccessException {
		return etfDAO.getCheckList(name);
	}
	
}
