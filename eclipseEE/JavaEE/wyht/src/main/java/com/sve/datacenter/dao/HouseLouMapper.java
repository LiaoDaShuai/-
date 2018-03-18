package com.sve.datacenter.dao;

import java.util.List;

import com.sve.datacenter.model.District;
import com.sve.datacenter.model.HouseFan;
import com.sve.datacenter.model.HouseLou;
import com.sve.datacenter.model.Unit;

public interface HouseLouMapper {
	//楼宇总数
	int louyuCount();
	// 根据楼房id查看对应的楼房
	HouseLou selectFandid(int hlid);

	// 查看该小区下面的所有楼房
	List<HouseLou> selectDisid(int disid);

	int deleteByPrimaryKey(Integer hlid);

	int insertSelective(HouseLou record);

	HouseLou selectByPrimaryKey(Integer hlid);

	int updateByPrimaryKeySelective(HouseLou record);
	// 查询全部 -->
	List<HouseLou> selectA();
	// 模糊查询 -->
	List<HouseLou> selectAll(HouseLou hl);
	//查询小区表状态为0的小区 -->
	List<District> selectByDis(int status);
	// 根据小区id查询楼宇表 -->
	List<HouseLou> selectly(int disid);

	List<Unit> selectut(Unit ut);

	List<HouseFan> selecthf(HouseFan hf);

	int delete_selecthouse(int hlid);

	int delete_unit(int hlid);

	int insert_unit(Unit u);

	int selecthfname(String floorname);
}