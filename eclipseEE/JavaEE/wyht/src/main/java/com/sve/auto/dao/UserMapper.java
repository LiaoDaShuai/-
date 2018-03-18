package com.sve.auto.dao;

import java.util.List;

import com.sve.auto.model.User;

public interface UserMapper {
	int isUserphone(User user);
	//查看全部普通管理員
	List<User> selectUserLevelAll();
	//查看用户与密码是否正确
	User findisUser(User user);
	//根据用户名查看信息
	User findUsername(String username);
	//根据用户名查看权限
	User selectUserPermName(String username);
	
    int deleteByPrimaryKey(Integer userId);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer userId);

    int updateByPrimaryKeySelective(User record);

}