package com.sve.datacenter.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sve.datacenter.dao.UnitMapper;
import com.sve.datacenter.model.Unit;
import com.sve.datacenter.service.UnitService;

@Service
@Transactional
public class UnitServiceImpl implements UnitService {

	@Autowired
	private UnitMapper unitMapper;
	
	public UnitMapper getUnitMapper() {
		return unitMapper;
	}

	public int addfcount(int unitid) {
		return unitMapper.addfcount(unitid);
	}

	public void setUnitMapper(UnitMapper unitMapper) {
		this.unitMapper = unitMapper;
	}

	public int deleteByPrimaryKey(Integer unitid) {
		return unitMapper.deleteByPrimaryKey(unitid);
	}

	public int insertSelective(Unit record) {
		return unitMapper.insertSelective(record);
	}

	public Unit selectByPrimaryKey(Integer unitid) {
		return unitMapper.selectByPrimaryKey(unitid);
	}

	public int updateByPrimaryKeySelective(Unit record) {
		return unitMapper.updateByPrimaryKeySelective(record);
	}

	public List<Unit> selectUnit(Unit unit) {
		return unitMapper.selectUnit(unit);
	}

	public int addunits(Unit unit) {
		return unitMapper.addunits(unit);
	}

	public int subunits(Unit unit) {
		return unitMapper.subunits(unit);
	}

}
