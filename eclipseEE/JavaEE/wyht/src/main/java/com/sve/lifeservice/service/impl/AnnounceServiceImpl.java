package com.sve.lifeservice.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sve.datacenter.model.District;
import com.sve.lifeservice.dao.AnnounceMapper;
import com.sve.lifeservice.model.Announce;
import com.sve.lifeservice.service.AnnounceService;


@Service  
@Transactional  
public class AnnounceServiceImpl  implements AnnounceService{
	
	@Autowired 
	public AnnounceMapper announceMapper;
	
	public int announceCount() {
		return announceMapper.announceCount();
	}

	public int updateCount(int annId) {
		return announceMapper.updateCount(annId);
	}

	public List<Announce> selectAnnounce() {
		return announceMapper.selectAnnounce();
	}

	public List<Announce> selectADyk() {
		return announceMapper.selectADyk();
	}

	public List<Announce> selectADorder(int disid) {
		return announceMapper.selectADorder(disid);
	}

	public List<District> selectGuanDis(int annid) {
		return announceMapper.selectGuanDis(annid);
	}

	public List<Announce> selectAD() {
		return announceMapper.selectAD();
	}

	public boolean insertAnnounce(Announce announce) {
		return announceMapper.insertSelective(announce);
	}

	public int updateAnnounce(Announce announce) {
		return announceMapper.updateByPrimaryKeySelective(announce);
	}

	public boolean deleteAnnounce(int id) {
		return announceMapper.deleteAnnounce(id);
	}

	public Announce selectAnnounceById(int id) {
		return announceMapper.selectAnnounceById(id);
	}

	public ArrayList<Announce> selectAnnounceByKey(String key) {
		return announceMapper.selectAnnounceByKey(key);
	}

}
