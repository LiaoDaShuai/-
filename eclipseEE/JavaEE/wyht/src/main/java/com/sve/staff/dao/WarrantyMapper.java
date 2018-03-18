package com.sve.staff.dao;

import java.util.List;

import com.sve.datacenter.model.HouseFan;
import com.sve.staff.model.Warranty;

public interface WarrantyMapper {
	List<HouseFan> selectHNum(int ownerid);//����ҵ��id��ѯ���з���
	
	List<Warranty> selectAll(Warranty war);
	
    int deleteByPrimaryKey(Integer warId);

    int insertSelective(Warranty record);

    Warranty selectByPrimaryKey(Integer warId);

    int updateByPrimaryKeySelective(Warranty record);

}