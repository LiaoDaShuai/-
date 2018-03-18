package com.sve.toll.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sve.toll.dao.PredepositMapper;
import com.sve.toll.model.Predeposit;
import com.sve.toll.service.PredepositService;

@Transactional
@Service
public class PredepositServiceImpl implements PredepositService{

	@Autowired
	private PredepositMapper predepositMapper;
	
	
	public List<Predeposit> selectDetailOid(int oid) {
		return predepositMapper.selectDetailOid(oid);
	}

	
	public Integer selectgtMoney(int disid, int oid) {
		return predepositMapper.selectgtMoney(disid, oid);
	}

	
	public List<Predeposit> selectDetails() {
		return predepositMapper.selectDetails();
	}

	
	public List<Predeposit> selectAll() {
		return predepositMapper.selectAll();
	}

	
	public int deleteByPrimaryKey(Integer predId) {
		return predepositMapper.deleteByPrimaryKey(predId);
	}

	
	public int insertSelective(Predeposit record) {
		return predepositMapper.insertSelective(record);
	}

	
	public Predeposit selectByPrimaryKey(Integer predId) {
		return predepositMapper.selectByPrimaryKey(predId);
	}

	
	public int updateByPrimaryKeySelective(Predeposit record) {
		return predepositMapper.updateByPrimaryKeySelective(record);
	}
	
}
