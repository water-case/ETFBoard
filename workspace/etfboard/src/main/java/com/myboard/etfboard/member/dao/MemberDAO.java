package com.myboard.etfboard.member.dao;

import org.springframework.dao.DataAccessException;

import com.myboard.etfboard.member.vo.MemberVO;

public interface MemberDAO {
	 public int insertMember(MemberVO memberVO) throws DataAccessException ;
	 public MemberVO loginById(MemberVO memberVO) throws DataAccessException;
	 public int getMoney(String name)  throws DataAccessException;

}
