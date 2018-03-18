package com.sve.staff.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sve.datacenter.model.HouseFan;
import com.sve.staff.dao.WarrantyMapper;
import com.sve.staff.model.Warranty;
import com.sve.staff.model.Wartype;
import com.sve.staff.service.WarrantyService;

@Service
@Transactional
public class WarrantyServiceimpl implements WarrantyService {

	@Autowired
	private WarrantyMapper warrantyMapper;
	
	public List<HouseFan> selectHNum(int ownerid) {
		return warrantyMapper.selectHNum(ownerid);
	}

	public List<Warranty> selectAll(Warranty war) {
		return warrantyMapper.selectAll(war);
	}
	
	public int deleteByPrimaryKey(Integer warId) {
		return warrantyMapper.deleteByPrimaryKey(warId);
	}

	public int insertSelective(Warranty record) {
		return warrantyMapper.insertSelective(record);
	}

	public Warranty selectByPrimaryKey(Integer warId) {
		return warrantyMapper.selectByPrimaryKey(warId);
	}

	public int updateByPrimaryKeySelective(Warranty record) {
		return warrantyMapper.updateByPrimaryKeySelective(record);
	}

}
