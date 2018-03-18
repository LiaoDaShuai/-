package com.sve.auto.service;

import java.util.List;

import com.sve.auto.model.Permission;
import com.sve.auto.model.User;

public interface UserService {
	int isUserphone(User user);
	
	List<User> selectUserLevelAll();
	// �鿴�û��������Ƿ���ȷ
	User findisUser(User user);
	
	User findUsername(String username);
	//�����û����鿴Ȩ��
	User selectUserPermName(String username);
		
	int deleteByPrimaryKey(Integer userId);

	int insertSelective(User record);

	User selectByPrimaryKey(Integer userId);

	int updateByPrimaryKeySelective(User record);

}