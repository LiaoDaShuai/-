package com.sve.toll.service;

import java.util.List;

import com.sve.toll.model.Priceproject;

public interface PriceprojectService {
	List<Priceproject> selectPriceZhouAll();
	
	List<Priceproject> selectPriceGaoAll(Priceproject priceproject);
	
	int selectPrname(String pricename);
	
	int selectProname(Priceproject pro);//�༭ʱ�ų������ѯ�Ƿ���ڸ��շ���
	
	List<Priceproject> selectPriceTypeAll();
	//��ѯȫ���շ���Ŀ
	public List<Priceproject> SelectpriceAll();
	//��ѯȫ�����շ���Ŀ����Ӧ���շѱ�׼
	public List<Priceproject> SelectPriceChargAll();
	//�����շ���Ŀid�����շ���Ŀ���շѱ�׼
	public Priceproject SelectPriceChargId(int pid);
	//�����շ���Ŀid�����շ���Ŀ
	public Priceproject Selectpriceid(int priceid);
	//����շ���Ŀ
	public int Insertprice(Priceproject price);
	//�޸��շ���Ŀ
	public int Updateprice(Priceproject price);
	//ɾ���շ���Ŀ
	public int Deleteprice(int priceid);
}
