package com.sve.datacenter.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sve.datacenter.dao.BindingMapper;
import com.sve.datacenter.model.Binding;
import com.sve.datacenter.service.BindingService;

@Service
@Transactional
public class BindingServiceImpl implements BindingService {

	@Autowired
	private BindingMapper bindingMapper;
		
	public List<Binding> selecfanownid(int oid) {
		return bindingMapper.selecfanownid(oid);
	}
	public int selectOwerFPV(Binding binding) {
		return bindingMapper.selectOwerFPV(binding);
	}
	public List<Binding> selectOwnerAllid(int ownerid) {
		return bindingMapper.selectOwnerAllid(ownerid);
	}
	public List<Binding> selectOwnerid(Binding binding) {
		return bindingMapper.selectOwnerid(binding);
	}
	public List<Binding> selectOwnerFanAllid(int ownerid) {
		return bindingMapper.selectOwnerFanAllid(ownerid);
	}
	public List<Binding> selectOwnerParkAllid(int ownerid) {
		return bindingMapper.selectOwnerParkAllid(ownerid);
	}
	public List<Binding> selectOwnerVehicAllid(int ownerid) {
		return bindingMapper.selectOwnerVehicAllid(ownerid);
	}
	public int insert(Binding record) {
		return bindingMapper.insert(record);
	}
	public int insertSelective(Binding record) {
		return bindingMapper.insertSelective(record);
	}

}
