package com.sve.toll.service;

import java.util.List;

import com.sve.toll.model.Predeposit;

public interface PredepositService {
	List<Predeposit> selectDetailOid(int oid);
	
	Integer selectgtMoney(int disid,int oid);
	
	List<Predeposit> selectDetails();
	
	List<Predeposit> selectAll();
	
    int deleteByPrimaryKey(Integer predId);

    int insertSelective(Predeposit record);

    Predeposit selectByPrimaryKey(Integer predId);

    int updateByPrimaryKeySelective(Predeposit record);
}
