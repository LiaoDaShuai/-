package com.sve.toll.dao;

import java.util.List;

import com.sve.toll.model.Predeposit;

public interface PredepositMapper {
	List<Predeposit> selectDetailOid(int oid);
	
	Integer selectgtMoney(int disid,int oid);
	
	List<Predeposit> selectDetails();//��ȫ���������
	
	List<Predeposit> selectAll();//��ȫ�����û����ڵ���Ԥ����
	
    int deleteByPrimaryKey(Integer predId);

    int insertSelective(Predeposit record);

    Predeposit selectByPrimaryKey(Integer predId);

    int updateByPrimaryKeySelective(Predeposit record);

}