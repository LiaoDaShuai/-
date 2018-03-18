package com.sve.toll.dao;

import java.util.List;

import com.sve.toll.model.Toll;
import com.sve.toll.model.Unpaidbills;

public interface UnpaidbillsMapper {
	//推送个相应住户的
	List<Unpaidbills> selectTuiQt(int oid);
	//用于已缴金额报表
	List<Unpaidbills> selectUnpaidReport(Toll toll);
	//用于根据id查询已缴金额报表信息
	List<Unpaidbills> selectUnpaidDisReport(Toll toll);
	
	Unpaidbills selectDayinunpaid(Integer unpaid);//打印
	
	List<Unpaidbills> selectGaojiAll(Toll toll);
	
	int NoupdateUnpaid(Integer unpaid);
	//查看刪除記錄
	List<Unpaidbills> selectDelAll(Toll toll);
	//查看状态为已退费的帐单且对应unpaid2的
	Unpaidbills selectYiTuiUnpaids(Integer unpaid);
	//查看状态为已缴的的账单信息
	Unpaidbills selectTuiUnpaids(Integer unpaid);
	//修改已缴账单为已退
	int Upunpidstatus(Integer unpaid);
	//查询详情
	Unpaidbills selectUnpaids(Integer unpaid);
	//查询缴费明细
	List<Unpaidbills> selectUnpidTollAll(Toll toll);
	//删除，把isdrop改成1而已
	int dropUnpaid(Integer unpaid);
	//查询所有已缴账单
	List<Unpaidbills> selectAll();
	
    int deleteByPrimaryKey(Integer unpaid);

    int insertSelective(Unpaidbills record);

    Unpaidbills selectByPrimaryKey(Integer unpaid);

    int updateByPrimaryKeySelective(Unpaidbills record);
}