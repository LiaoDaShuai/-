package com.sve.auto.service;

import java.util.List;

import com.sve.auto.model.Permission;
import com.sve.auto.model.User;

public interface UserService {
	int isUserphone(User user);
	
	List<User> selectUserLevelAll();
	// 查看用户与密码是否正确
	User findisUser(User user);
	
	User findUsername(String username);
	//根据用户名查看权限
	User selectUserPermName(String username);
		
	int deleteByPrimaryKey(Integer userId);

	int insertSelective(User record);

	User selectByPrimaryKey(Integer userId);

	int updateByPrimaryKeySelective(User record);

}