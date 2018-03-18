package com.sve.toll.service;

import java.util.List;

import com.sve.toll.model.Chargs;

public interface ChargsService {
	List<Chargs>selectTaskvehicid(int priceid);
	//针对定时车位收费的
	List<Chargs> selectTaskparkid(int priceid);
	// 针对定时房屋收费的
	List<Chargs> selectTaskfanid(int priceid);
	
	List<Chargs> selectPidduiCharg(int priceid);
	
	List<Chargs> selectProForid(int priceid);
	
	public Chargs selectChargPrice(int chargid);
	
	public List<Chargs> selectChargsProject(int proid);
	
	public int selectFormulaid(int formulaid);
	
	public int InsertChargs(Chargs chargs);
	
	public Chargs SelectChargId(int chargid);
	
	public int UpdateChargs(Chargs chargs);
	
	public int DeleteChargs(int chargid);
}
