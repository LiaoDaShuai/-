package com.sve.datacenter.dao;

import java.util.List;

import com.sve.datacenter.model.Unit;

public interface UnitMapper {
	
	int addfcount(int unitid);
	
	Unit selecthlid(int hlid);
	
    int deleteByPrimaryKey(Integer unitid);

    int insertSelective(Unit record);

    Unit selectByPrimaryKey(Integer unitid);

    int updateByPrimaryKeySelective(Unit record);

    List<Unit> selectUnit(Unit unit);
    
    int addunits(Unit unit);
    
    int subunits(Unit unit);
}