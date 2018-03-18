package com.sve.toll.dao;

import java.util.List;

import com.sve.toll.model.Priceproject;

public interface PriceprojectMapper {
	List<Priceproject> selectPriceZhouAll();//查看全部周期
	
	List<Priceproject> selectPriceGaoAll(Priceproject priceproject);
	
	int selectPrname(String pricename);//查看是否存在该收费名
	
	List<Priceproject> selectPriceTypeAll();//查看全部押金性收费项目
	
	int selectProname(Priceproject pro);//编辑时排除本身查询是否存在该收费名
	
	List<Priceproject> selectPriceAll();//查看全部收费项目
	
	List<Priceproject> selectPrice_ChargAll();//查看全部的收费项目及对应的收费标准
	
	Priceproject selectPrice_ChargId(int pid);//根据收费项目id搜索收费标准
	
    int deleteByPrimaryKey(Integer priceid);

    int insertSelective(Priceproject record);

    Priceproject selectByPrimaryKey(Integer priceid);

    int updateByPrimaryKeySelective(Priceproject record);

}