package com.sve.lifeservice.dao;

import java.util.ArrayList;
import java.util.List;

import com.sve.datacenter.model.District;
import com.sve.lifeservice.model.Announce;

public interface AnnounceMapper {
	//小区公告数
	int announceCount();
	//游客可看到的公告
	List<Announce> selectADyk();
	//业主登录后可看到的公告
	List<Announce> selectADorder(int disid);
	//增加浏览次数
	int updateCount(int annId);
	
	List<District> selectGuanDis(int annid);// 查询公告关联的小区

	List<Announce> selectAnnounce();// 查全部

	List<Announce> selectAD();// 查全部和相应小区

	boolean insertSelective(Announce announce);// 添加公告

	int updateByPrimaryKeySelective(Announce announce);// 修改公告

	boolean deleteAnnounce(int id);// 删除公告

	Announce selectAnnounceById(int id);// 根据id查公告

	ArrayList<Announce> selectAnnounceByKey(String key);// 根据公告名查公告
}
