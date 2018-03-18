package com.sve.toll.service;

import java.util.List;

import com.sve.toll.model.Predeposit;
import com.sve.toll.model.Toll;

public interface TollService {
	List<Toll> selectShouyin(String keyword);
	
	// 查看全部小区对应的欠费请况
	List<Toll> TollDisReportAll();

	// 查看某个小区下的欠费情况
	List<Toll> TollDisIdReportAll(int disid);
	
	List<Toll> selectReprotPrice(int disid,int ztype);

	int updateFPVandOwer(Toll toll);

	List<Toll> selectWeiGaoAll(Toll toll);

	Toll tollQFSumAndCount();

	// 查看总收入金额和数量
	Toll tollSRSumAndCount();

	// 查看总退费金额和数量
	Toll tollTFSumAndCount();

	int tollupstatus(Integer tollid);

	List<Toll> tollhistoryOid(Integer oid);

	// 根据房id查未缴账单
	List<Toll> tollhistoryfanid(Integer fanid);

	// 根据车位id查未缴账单
	List<Toll> tollhistoryparkid(Integer parkid);

	// 根据车辆id查未缴账单
	List<Toll> tollhistoryvehicid(Integer vehicid);

	List<Toll> selectYijiaoid(Integer unpaid);

	List<Toll> selectTollfanid(Integer fanid);

	List<Toll> selectTollparkid(Integer parkid);

	List<Toll> selectTollvehicid(Integer vehicid);

	List<Toll> selectTollowerid(Integer owerid);

	List<Toll> selectYiAll();

	Toll selectWeiTollid(int tollid);

	int updateTollStatus(int uanpaid, int tollid);

	int deleteByPrimaryKey(Integer tollid);

	int insertSelective(Toll record);

	Toll selectByPrimaryKey(Integer tollid);

	int updateByPrimaryKeySelective(Toll record);

}