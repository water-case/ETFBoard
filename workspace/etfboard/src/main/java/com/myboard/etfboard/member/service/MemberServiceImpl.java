package com.myboard.etfboard.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myboard.etfboard.member.dao.MemberDAO;
import com.myboard.etfboard.member.vo.MemberVO;


@Service("memberService")
@Transactional(propagation = Propagation.REQUIRED)
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDAO;

	@Override
	public int addMember(MemberVO member) throws DataAccessException {
		return memberDAO.insertMember(member);
	}
	
	@Override
	public MemberVO login(MemberVO memberVO) throws DataAccessException {
		return memberDAO.loginById(memberVO);
	}

	@Override
	public int IdCheck(String id) throws DataAccessException {
		return memberDAO.IdCheck(id);
	}

	@Override
	public int NameCheck(String name) throws DataAccessException {
		return memberDAO.NameCheck(name);
	}

	@Override
	public int EmailCheck(String email) throws DataAccessException {
		return memberDAO.EmailCheck(email);
	}

}
