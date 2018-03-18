package com.sve.toll.service;

import java.util.List;

import com.sve.toll.model.Priceproject;

public interface PriceprojectService {
	List<Priceproject> selectPriceZhouAll();
	
	List<Priceproject> selectPriceGaoAll(Priceproject priceproject);
	
	int selectPrname(String pricename);
	
	int selectProname(Priceproject pro);//编辑时排除本身查询是否存在该收费名
	
	List<Priceproject> selectPriceTypeAll();
	//查询全部收费项目
	public List<Priceproject> SelectpriceAll();
	//查询全部的收费项目及对应的收费标准
	public List<Priceproject> SelectPriceChargAll();
	//根据收费项目id查找收费项目及收费标准
	public Priceproject SelectPriceChargId(int pid);
	//根据收费项目id查找收费项目
	public Priceproject Selectpriceid(int priceid);
	//添加收费项目
	public int Insertprice(Priceproject price);
	//修改收费项目
	public int Updateprice(Priceproject price);
	//删除收费项目
	public int Deleteprice(int priceid);
}
