package com.sve.datacenter.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sve.datacenter.dao.DistrictMapper;
import com.sve.datacenter.model.District;
import com.sve.datacenter.service.DistrictService;

@Service 
@Transactional
public class DistrictServiceImpl implements DistrictService{

	@Autowired
	private DistrictMapper districtMapper;

	public District selectFandid(Integer disid) {
		return districtMapper.selectFandid(disid);
	}

	public List<District> selectYiAll() {
		return districtMapper.selectYiAll();
	}

	public int deleteByPrimaryKey(Integer disid) {
		return districtMapper.deleteByPrimaryKey(disid);
	}

	public int insertSelective(District record) {
		return districtMapper.insertSelective(record);
	}

	public District selectByPrimaryKey(Integer disid) {
		return districtMapper.selectByPrimaryKey(disid);
	}

	public int updateByPrimaryKeySelective(District record) {
		return districtMapper.updateByPrimaryKeySelective(record);
	}

	public List<District> selectAll(District dis) {
		return districtMapper.selectAll(dis);
	}

	public int update_status(District di) {
		return districtMapper.update_status(di);
	}

	public int selectdname(String dname) {
		return districtMapper.selectdname(dname);
	}

	public int disCount() {
		return districtMapper.disCount();
	}
	
}
