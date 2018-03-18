package com.sve.toll.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sve.toll.dao.TemporaryMapper;
import com.sve.toll.model.Temporary;
import com.sve.toll.service.TemporaryService;

@Service
@Transactional
public class TemporaryServiceImpl implements TemporaryService{
	@Autowired 
	private TemporaryMapper temporaryMapper;
	
	public Temporary selectByTem(Integer temid) {
		return temporaryMapper.selectByTem(temid);
	}

	public int deleteByPrimaryKey(Integer temid) {
		return temporaryMapper.deleteByPrimaryKey(temid);
	}

	public int insertSelective(Temporary record) {
		return temporaryMapper.insertSelective(record);
	}

	public Temporary selectByPrimaryKey(Integer temid) {
		return temporaryMapper.selectByPrimaryKey(temid);
	}

	public int updateByPrimaryKeySelective(Temporary record) {
		return temporaryMapper.updateByPrimaryKeySelective(record);
	}
	
}
