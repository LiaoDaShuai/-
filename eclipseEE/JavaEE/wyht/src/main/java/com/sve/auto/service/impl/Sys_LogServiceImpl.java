package com.sve.auto.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sve.auto.dao.Sys_LogMapper;
import com.sve.auto.model.Sys_Log;
import com.sve.auto.service.Sys_LogService;
@Service
@Transactional
public class Sys_LogServiceImpl implements Sys_LogService {
	@Autowired
	private Sys_LogMapper sys_logMapper;

	public int deleteByPrimaryKey(Integer sysId) {
		return sys_logMapper.deleteByPrimaryKey(sysId);
	}

	public int insertSelective(Sys_Log record) {
		return sys_logMapper.insertSelective(record);
	}

	public Sys_Log selectByPrimaryKey(Integer sysId) {
		return sys_logMapper.selectByPrimaryKey(sysId);
	}

	public int updateByPrimaryKeySelective(Sys_Log record) {
		return sys_logMapper.updateByPrimaryKeySelective(record);
	}
	
}