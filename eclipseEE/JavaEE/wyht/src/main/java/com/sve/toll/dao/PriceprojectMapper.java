package com.sve.toll.dao;

import java.util.List;

import com.sve.toll.model.Priceproject;

public interface PriceprojectMapper {
	List<Priceproject> selectPriceZhouAll();//�鿴ȫ������
	
	List<Priceproject> selectPriceGaoAll(Priceproject priceproject);
	
	int selectPrname(String pricename);//�鿴�Ƿ���ڸ��շ���
	
	List<Priceproject> selectPriceTypeAll();//�鿴ȫ��Ѻ�����շ���Ŀ
	
	int selectProname(Priceproject pro);//�༭ʱ�ų������ѯ�Ƿ���ڸ��շ���
	
	List<Priceproject> selectPriceAll();//�鿴ȫ���շ���Ŀ
	
	List<Priceproject> selectPrice_ChargAll();//�鿴ȫ�����շ���Ŀ����Ӧ���շѱ�׼
	
	Priceproject selectPrice_ChargId(int pid);//�����շ���Ŀid�����շѱ�׼
	
    int deleteByPrimaryKey(Integer priceid);

    int insertSelective(Priceproject record);

    Priceproject selectByPrimaryKey(Integer priceid);

    int updateByPrimaryKeySelective(Priceproject record);

}