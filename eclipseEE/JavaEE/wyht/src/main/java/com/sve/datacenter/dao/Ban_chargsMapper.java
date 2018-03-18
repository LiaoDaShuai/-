package com.sve.datacenter.dao;

import java.util.List;

import com.sve.datacenter.model.Ban_chargs;

public interface Ban_chargsMapper {
	int selectisBc(Ban_chargs bc);
	//查出全部的綁定賬單信息
	List<Ban_chargs> selectBcAll();
	//根据对象查详情信息
	List<Ban_chargs> selectBcPriceid(Ban_chargs bc);
	
    int deleteByPrimaryKey(Integer bcid);

    int insertSelective(Ban_chargs record);

    Ban_chargs selectByPrimaryKey(Integer bcid);

    int updateByPrimaryKeySelective(Ban_chargs record);

}