package com.sve.staff.service;

import java.util.List;

import com.sve.staff.model.Message;

public interface MessageService {
	//向用户显示五条通知
	List<Message> selectTg(int mesOwerId);
	//加载更多通告
	List<Message> selectTgload(int mesOwerId);
	
	int updateStatus(int mesId);
	
	List<Message> selectAll(String mohu);
	
    int deleteByPrimaryKey(Integer mesId);

    int insertSelective(Message record);

    Message selectByPrimaryKey(Integer mesId);

    int updateByPrimaryKeySelective(Message record);
}
