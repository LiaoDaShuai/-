package com.sve.datacenter.service;

import java.util.List;

import com.sve.datacenter.model.Unit;

public interface UnitService {
	int addfcount(int unitid);
	
	int deleteByPrimaryKey(Integer unitid);

    int insertSelective(Unit record);

    Unit selectByPrimaryKey(Integer unitid);

    int updateByPrimaryKeySelective(Unit record);

    List<Unit> selectUnit(Unit unit);
    
    int addunits(Unit unit);
    
    int subunits(Unit unit);
}
