package com.sve.staff.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sve.staff.dao.MessageMapper;
import com.sve.staff.model.Message;
import com.sve.staff.service.MessageService;

@Service
@Transactional
public class MessageServiceimpl implements MessageService {

	@Autowired
	MessageMapper messageMapper;

	public List<Message> selectTg(int mesOwerId) {
		return messageMapper.selectTg(mesOwerId);
	}

	public List<Message> selectTgload(int mesOwerId) {
		return messageMapper.selectTgload(mesOwerId);
	}

	public int updateStatus(int mesId) {
		return messageMapper.updateStatus(mesId);
	}

	public List<Message> selectAll(String mohu) {
		return messageMapper.selectAll(mohu);
	}

	public int deleteByPrimaryKey(Integer mesId) {
		return messageMapper.deleteByPrimaryKey(mesId);
	}

	public int insertSelective(Message record) {
		return messageMapper.insertSelective(record);
	}

	public Message selectByPrimaryKey(Integer mesId) {
		return messageMapper.selectByPrimaryKey(mesId);
	}

	public int updateByPrimaryKeySelective(Message record) {
		return messageMapper.updateByPrimaryKeySelective(record);
	}


}
