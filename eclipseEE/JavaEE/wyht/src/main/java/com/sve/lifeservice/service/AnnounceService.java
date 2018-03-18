package com.sve.lifeservice.service;

import java.util.List;

import com.sve.datacenter.model.District;
import com.sve.lifeservice.model.Announce;

public interface AnnounceService {
	int announceCount();
	
	int updateCount(int annId);
	// �οͿɿ����Ĺ���
	List<Announce> selectADyk();
	// ҵ����¼��ɿ����Ĺ���
	List<Announce> selectADorder(int disid);

	List<District> selectGuanDis(int annid);

	List<Announce> selectAD();
	
	List<Announce> selectAnnounce();// ��ȫ��

	public boolean insertAnnounce(Announce announce);

	public int updateAnnounce(Announce announce);

	public boolean deleteAnnounce(int id);

	public Announce selectAnnounceById(int id);

	public List<Announce> selectAnnounceByKey(String key);
}
