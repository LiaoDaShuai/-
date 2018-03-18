package com.sve.lifeservice.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sve.lifeservice.dao.AnnDisMapper;
import com.sve.lifeservice.model.AnnDis;
import com.sve.lifeservice.service.AnnDisService;

@Service
@Transactional
public class AnnDisServiceImpl implements AnnDisService{
	@Autowired
	private AnnDisMapper annDisMapper;

	public int insert(AnnDis record) {
		return annDisMapper.insert(record);
	}

	public int insertSelective(AnnDis record) {
		return annDisMapper.insertSelective(record);
	}

	public int deldis(AnnDis annDis) {
		return annDisMapper.deldis(annDis);
	}
	
	
	
}
