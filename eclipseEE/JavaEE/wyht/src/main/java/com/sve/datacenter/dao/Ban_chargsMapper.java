package com.sve.datacenter.dao;

import java.util.List;

import com.sve.datacenter.model.Ban_chargs;

public interface Ban_chargsMapper {
	int selectisBc(Ban_chargs bc);
	//���ȫ���Ľ����~����Ϣ
	List<Ban_chargs> selectBcAll();
	//���ݶ����������Ϣ
	List<Ban_chargs> selectBcPriceid(Ban_chargs bc);
	
    int deleteByPrimaryKey(Integer bcid);

    int insertSelective(Ban_chargs record);

    Ban_chargs selectByPrimaryKey(Integer bcid);

    int updateByPrimaryKeySelective(Ban_chargs record);

}