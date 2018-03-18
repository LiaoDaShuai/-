package com.sve.staff.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sve.staff.model.Message;

public interface MessageMapper {
	//���û���ʾ����֪ͨ
	List<Message> selectTg(int mesOwerId);
	//���ظ���ͨ��
	List<Message> selectTgload(int mesOwerId);
	//����״̬
	int updateStatus(int mesId);
	//����������ѯ֪ͨ
	List<Message> selectAll(@Param("mohu") String mohu);
	
    int deleteByPrimaryKey(Integer mesId);

    int insertSelective(Message record);

    Message selectByPrimaryKey(Integer mesId);

    int updateByPrimaryKeySelective(Message record);
}