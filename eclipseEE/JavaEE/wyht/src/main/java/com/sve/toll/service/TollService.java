package com.sve.toll.service;

import java.util.List;

import com.sve.toll.model.Predeposit;
import com.sve.toll.model.Toll;

public interface TollService {
	List<Toll> selectShouyin(String keyword);
	
	// �鿴ȫ��С����Ӧ��Ƿ�����
	List<Toll> TollDisReportAll();

	// �鿴ĳ��С���µ�Ƿ�����
	List<Toll> TollDisIdReportAll(int disid);
	
	List<Toll> selectReprotPrice(int disid,int ztype);

	int updateFPVandOwer(Toll toll);

	List<Toll> selectWeiGaoAll(Toll toll);

	Toll tollQFSumAndCount();

	// �鿴�������������
	Toll tollSRSumAndCount();

	// �鿴���˷ѽ�������
	Toll tollTFSumAndCount();

	int tollupstatus(Integer tollid);

	List<Toll> tollhistoryOid(Integer oid);

	// ���ݷ�id��δ���˵�
	List<Toll> tollhistoryfanid(Integer fanid);

	// ���ݳ�λid��δ���˵�
	List<Toll> tollhistoryparkid(Integer parkid);

	// ���ݳ���id��δ���˵�
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