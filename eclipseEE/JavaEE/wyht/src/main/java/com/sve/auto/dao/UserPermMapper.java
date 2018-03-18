package com.sve.auto.dao;

import java.util.List;

import com.sve.auto.model.UserPerm;

public interface UserPermMapper {
	int deleteUserId(int userId);
	
	int deleteUserPerm(UserPerm userPerm);
	
    int deleteByPrimaryKey(Integer upId);

    int insertSelective(UserPerm record);

    UserPerm selectByPrimaryKey(Integer upId);

    int updateByPrimaryKeySelective(UserPerm record);

}