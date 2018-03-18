package com.sve.toll.dao;

import java.util.List;

import com.sve.toll.model.Toll;

public interface TollMapper {
	List<Toll> selectShouyin(String keyword);
	//查看全部小区对应的欠费请况
	List<Toll> TollDisReportAll();
	//查看某个小区下的欠费情况
	List<Toll> TollDisIdReportAll(int disid);
	//查看小区和收费类型下的收费项目
	List<Toll> selectReprotPrice(int disid,int ztype);
	//高级查询全部
	List<Toll> selectWeiGaoAll(Toll toll);
	//查看总欠费金额和数量
	Toll tollQFSumAndCount();
	//查看总收入金额和数量
	Toll tollSRSumAndCount();
	//查看总退费金额和数量
	Toll tollTFSumAndCount();
	//修改状态为退费
	int tollupstatus(Integer tollid);
	//根据业主id查未缴账单
	List<Toll> tollhistoryOid(Integer oid);
	//根据房id查未缴账单
	List<Toll> tollhistoryfanid(Integer fanid);
	//根据车位id查未缴账单
	List<Toll> tollhistoryparkid(Integer parkid);
	//根据车辆id查未缴账单
	List<Toll> tollhistoryvehicid(Integer vehicid);
	//根据已缴id查看对应账单
	List<Toll> selectYijiaoid(Integer unpaid);
	//根据房id查未缴账单
	List<Toll> selectTollfanid(Integer fanid);
	//根据车位id查未缴账单
	List<Toll> selectTollparkid(Integer parkid);
	//根据车位id查未缴账单
	List<Toll> selectTollvehicid(Integer vehicid);
	//根据住户id查未缴账单
	List<Toll> selectTollowerid(Integer owerid);
	//查看全部已缴账单
	List<Toll> selectYiAll();
	//根据id查看未缴账单
	Toll selectWeiTollid(int tollid);
	//把账单设为已缴，并对应相应的已缴账单
	int updateTollStatus(int uanpaid,int tollid);
	
	//若绑定了业主，则把所对应账单上加上业主
	int updateFPVandOwer(Toll toll);
	
    int deleteByPrimaryKey(Integer tollid);

    int insertSelective(Toll record);

    Toll selectByPrimaryKey(Integer tollid);

    int updateByPrimaryKeySelective(Toll record);

}