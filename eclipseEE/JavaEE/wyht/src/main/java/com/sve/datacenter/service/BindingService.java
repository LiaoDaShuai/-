package com.sve.datacenter.service;

import java.util.List;

import com.sve.datacenter.model.Binding;

public interface BindingService {
	List<Binding> selecfanownid(int oid);
	
	int selectOwerFPV(Binding binding);
	
	List<Binding> selectOwnerid(Binding binding);
	
	List<Binding> selectOwnerAllid(int ownerid);

	List<Binding> selectOwnerFanAllid(int ownerid);

	List<Binding> selectOwnerParkAllid(int ownerid);

	List<Binding> selectOwnerVehicAllid(int ownerid);

	int insert(Binding record);

	int insertSelective(Binding record);
}
