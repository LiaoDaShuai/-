package com.sve.datacenter.dao;

import java.util.List;

import com.sve.datacenter.model.District;

public interface DistrictMapper {
	//����ӵ�С��
	int disCount();
	
	District selectFandid(Integer disid);
	
	List<District> selectYiAll(); //������������
	
    int deleteByPrimaryKey(Integer disid);

    int insertSelective(District record);

    District selectByPrimaryKey(Integer disid);

    int updateByPrimaryKeySelective(District record);
    // ��ѯȫ��
    List<District> selectAll(District dis);
    // �޸�С��״̬ -->
    int update_status(District di);
    //��ѯС�������Ƿ���� -->
    int selectdname(String dname);
}