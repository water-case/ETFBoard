package com.myboard.etfboard.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myboard.etfboard.member.vo.MemberVO;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int insertMember(MemberVO memberVO) throws DataAccessException {
		int result = sqlSession.insert("mapper.member.insertMember", memberVO);
		return result;
	}
	
	@Override
	public MemberVO loginById(MemberVO memberVO) throws DataAccessException{
		MemberVO vo = sqlSession.selectOne("mapper.member.login",memberVO);
		return vo;
	}

	@Override
	public int getMoney(String name) throws DataAccessException {
		return sqlSession.selectOne("mapper.member.getEtfMoney", name);
	}

	@Override
	public int IdCheck(String id) throws DataAccessException {
		return sqlSession.selectOne("mapper.member.idCheck", id);
	}

	@Override
	public int NameCheck(String name) throws DataAccessException {
		return sqlSession.selectOne("mapper.member.nameCheck", name);
	}

	@Override
	public int EmailCheck(String email) throws DataAccessException {
		return sqlSession.selectOne("mapper.member.emailCheck", email);
	}

}
