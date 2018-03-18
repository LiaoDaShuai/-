package com.sve.auto.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sve.auto.dao.UserMapper;
import com.sve.auto.model.User;
import com.sve.auto.service.UserService;
@Service
@Transactional
public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper userMapper;

	public int isUserphone(User user) {
		return userMapper.isUserphone(user);
	}

	public List<User> selectUserLevelAll() {
		return userMapper.selectUserLevelAll();
	}

	public User findisUser(User user) {
		return userMapper.findisUser(user);
	}

	public User selectUserPermName(String username) {
		return userMapper.selectUserPermName(username);
	}

	public User findUsername(String username) {
		return userMapper.findUsername(username);
	}

	public int deleteByPrimaryKey(Integer userId) {
		return userMapper.deleteByPrimaryKey(userId);
	}

	public int insertSelective(User record) {
		return userMapper.insertSelective(record);
	}

	public User selectByPrimaryKey(Integer userId) {
		return userMapper.selectByPrimaryKey(userId);
	}

	public int updateByPrimaryKeySelective(User record) {
		return userMapper.updateByPrimaryKeySelective(record);
	}
	
}