package com.cos.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cos.domain.UserVO;

@Repository
public class UserDAOImpl implements UserDAO{

	@Inject
	private SqlSession session;
	private static final String namespace = "com.cos.domain.user";
	
	@Override
	public UserVO select(String userID) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UserVO check(UserVO user) throws Exception {
		UserVO result = session.selectOne(namespace+".check", user);
		return result;
	}

	@Override
	public void insert(UserVO user) throws Exception {
		session.insert(namespace+".insert",user);
	}

	@Override
	public void update(UserVO user) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(String userID) throws Exception {
		// TODO Auto-generated method stub
		
	}
 
}
