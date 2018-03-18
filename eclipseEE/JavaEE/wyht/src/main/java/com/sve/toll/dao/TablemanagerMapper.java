package com.sve.toll.dao;

import java.util.List;

import com.sve.toll.model.Tablemanager;

public interface TablemanagerMapper {
	//若缴费了更改其状态
	int updateTabStatus(int tabid);
	//查看该用户对应收费标准的最后度数
	List<Tablemanager> selectChargidEndnum(Tablemanager tablemanager);
	//编辑用的
	List<Tablemanager> selectTabHouCharg();
	//查看是否同个房间号，同个收费标准以存在录入。
	int selectTongMonths(Tablemanager tablemanager);
	//高级模糊查询
	List<Tablemanager> selectTabHouChargGaoji(Tablemanager tablemanager);
	
	List<Tablemanager> selectAll();
	
    int deleteByPrimaryKey(Integer tabid);

    int insert(Tablemanager record);

    int insertSelective(Tablemanager record);

    Tablemanager selectByPrimaryKey(Integer tabid);

    int updateByPrimaryKeySelective(Tablemanager record);

    int updateByPrimaryKey(Tablemanager record);
}