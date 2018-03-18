package com.sve.toll.dao;

import java.util.List;

import com.sve.toll.model.Chargs;

public interface ChargsMapper {
	//针对定时车辆收费的
	List<Chargs>selectTaskvehicid(int priceid);
	//针对定时车位收费的
	List<Chargs> selectTaskparkid(int priceid);
	// 针对定时房屋收费的
	List<Chargs> selectTaskfanid(int priceid);
	
	List<Chargs> selectPidduiCharg(int priceid);//根据收费项目查看对应的押金型项目
	//根据项目id查看自定义公式和收费单位为止度除起始度的标准
	List<Chargs> selectProForid(int priceid);
	//获取收费标准与收费项目
	Chargs selectchargprice(int chargid);
	
	List<Chargs> selectProjectid(int proid);
	//查找对应公式id下有没有数据
	int selectFormulaid(int formulaid);
	
    int deleteByPrimaryKey(Integer chargid);

    int insertSelective(Chargs record);

    Chargs selectByPrimaryKey(Integer chargid);

    int updateByPrimaryKeySelective(Chargs record);

}