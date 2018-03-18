package com.sve.staff.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sve.staff.model.Message;

public interface MessageMapper {
	//向用户显示五条通知
	List<Message> selectTg(int mesOwerId);
	//加载更多通告
	List<Message> selectTgload(int mesOwerId);
	//更改状态
	int updateStatus(int mesId);
	//根据条件查询通知
	List<Message> selectAll(@Param("mohu") String mohu);
	
    int deleteByPrimaryKey(Integer mesId);

    int insertSelective(Message record);

    Message selectByPrimaryKey(Integer mesId);

    int updateByPrimaryKeySelective(Message record);
}