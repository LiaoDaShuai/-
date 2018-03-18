package com.sve.toll.dao;

import java.util.List;

import com.sve.toll.model.Predeposit;

public interface PredepositMapper {
	List<Predeposit> selectDetailOid(int oid);
	
	Integer selectgtMoney(int disid,int oid);
	
	List<Predeposit> selectDetails();//查全部存款详情
	
	List<Predeposit> selectAll();//查全部的用户对于的总预存款额
	
    int deleteByPrimaryKey(Integer predId);

    int insertSelective(Predeposit record);

    Predeposit selectByPrimaryKey(Integer predId);

    int updateByPrimaryKeySelective(Predeposit record);

}