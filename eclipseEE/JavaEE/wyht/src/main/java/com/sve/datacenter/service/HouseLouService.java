package com.sve.datacenter.service;

import java.util.List;

import com.sve.datacenter.model.District;
import com.sve.datacenter.model.HouseFan;
import com.sve.datacenter.model.HouseLou;
import com.sve.datacenter.model.Unit;

public interface HouseLouService {
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

	List<HouseLou> selectA();

	List<HouseLou> selectAll(HouseLou hl);

	List<District> selectByDis(int status);

	List<HouseLou> selectly(int disid);

	List<Unit> selectut(Unit ut);

	List<HouseFan> selecthf(HouseFan hf);

	int delete_selecthouse(int hlid);

	int delete_unit(int hlid);

	int insert_unit(Unit u);

	int selecthfname(String floorname);
}
