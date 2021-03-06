package com.myboard.etfboard.member.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myboard.etfboard.member.vo.MemberVO;

public interface MemberService {
	public int addMember(MemberVO memberVO) throws DataAccessException;
	public MemberVO login(MemberVO memberVO) throws DataAccessException;
	public int IdCheck(String id) throws DataAccessException;
	public int NameCheck(String name) throws DataAccessException;
	public int EmailCheck(String email) throws DataAccessException;
}
