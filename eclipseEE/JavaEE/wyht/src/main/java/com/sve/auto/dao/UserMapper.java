package com.sve.auto.dao;

import java.util.List;

import com.sve.auto.model.User;

public interface UserMapper {
	int isUserphone(User user);
	//�鿴ȫ����ͨ����T
	List<User> selectUserLevelAll();
	//�鿴�û��������Ƿ���ȷ
	User findisUser(User user);
	//�����û����鿴��Ϣ
	User findUsername(String username);
	//�����û����鿴Ȩ��
	User selectUserPermName(String username);
	
    int deleteByPrimaryKey(Integer userId);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer userId);

    int updateByPrimaryKeySelective(User record);

}