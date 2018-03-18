package com.sve.lifeservice.service;

import java.util.List;

import com.sve.datacenter.model.District;
import com.sve.lifeservice.model.Announce;

public interface AnnounceService {
	int announceCount();
	
	int updateCount(int annId);
	// 游客可看到的公告
	List<Announce> selectADyk();
	// 业主登录后可看到的公告
	List<Announce> selectADorder(int disid);

	List<District> selectGuanDis(int annid);

	List<Announce> selectAD();
	
	List<Announce> selectAnnounce();// 查全部

	public boolean insertAnnounce(Announce announce);

	public int updateAnnounce(Announce announce);

	public boolean deleteAnnounce(int id);

	public Announce selectAnnounceById(int id);

	public List<Announce> selectAnnounceByKey(String key);
}
