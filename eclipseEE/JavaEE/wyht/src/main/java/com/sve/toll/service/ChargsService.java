package com.sve.toll.service;

import java.util.List;

import com.sve.toll.model.Chargs;

public interface ChargsService {
	List<Chargs>selectTaskvehicid(int priceid);
	//��Զ�ʱ��λ�շѵ�
	List<Chargs> selectTaskparkid(int priceid);
	// ��Զ�ʱ�����շѵ�
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
