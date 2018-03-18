package com.sve.auto.service;

import com.sve.auto.model.UserPerm;

public interface UserPermService {
	int deleteUserId(int userId);
	
	int deleteUserPerm(UserPerm userPerm);
	
	int deleteByPrimaryKey(Integer upId);

	int insertSelective(UserPerm record);

	UserPerm selectByPrimaryKey(Integer upId);

	int updateByPrimaryKeySelective(UserPerm record);

}
