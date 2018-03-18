package com.sve.auto.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sve.auto.dao.UserPermMapper;
import com.sve.auto.model.UserPerm;
import com.sve.auto.service.UserPermService;

@Service
@Transactional
public class UserPermServiceImpl implements UserPermService{
	@Autowired
	private UserPermMapper userPermMapper;

	public int deleteUserId(int userId) {
		return userPermMapper.deleteUserId(userId);
	}

	public int deleteUserPerm(UserPerm userPerm) {
		return userPermMapper.deleteUserPerm(userPerm);
	}

	public int deleteByPrimaryKey(Integer upId) {
		return userPermMapper.deleteByPrimaryKey(upId);
	}

	public int insertSelective(UserPerm record) {
		return userPermMapper.insertSelective(record);
	}

	public UserPerm selectByPrimaryKey(Integer upId) {
		return userPermMapper.selectByPrimaryKey(upId);
	}

	public int updateByPrimaryKeySelective(UserPerm record) {
		return userPermMapper.updateByPrimaryKeySelective(record);
	}

}
