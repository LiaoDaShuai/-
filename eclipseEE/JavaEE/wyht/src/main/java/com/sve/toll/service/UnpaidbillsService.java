package com.sve.toll.service;

import java.util.List;

import com.sve.toll.model.Toll;
import com.sve.toll.model.Unpaidbills;

public interface UnpaidbillsService {
	
	List<Unpaidbills> selectTuiQt(int oid);
	
	List<Unpaidbills> selectUnpaidReport(Toll toll);
	
	List<Unpaidbills> selectUnpaidDisReport(Toll toll);

	Unpaidbills selectDayinunpaid(Integer unpaid);
	
	List<Unpaidbills> selectGaojiAll(Toll toll);
	
	int NoupdateUnpaid(Integer unpaid);
	
	List<Unpaidbills> selectDelAll(Toll toll);
	
	Unpaidbills selectYiTuiUnpaids(Integer unpaid);
	
	Unpaidbills selectTuiUnpaids(Integer unpaid);
	
	int Upunpidstatus(Integer unpaid);
	
	Unpaidbills selectUnpaids(Integer unpaid);
	
	List<Unpaidbills> selectUnpidTollAll(Toll toll);
	
	int dropUnpaid(Integer unpaid);
	
	List<Unpaidbills> selectAll();
	
    int deleteByPrimaryKey(Integer unpaid);

    int insertSelective(Unpaidbills record);

    Unpaidbills selectByPrimaryKey(Integer unpaid);

    int updateByPrimaryKeySelective(Unpaidbills record);
}
