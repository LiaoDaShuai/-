package com.sve.toll.dao;

import java.util.List;

import com.sve.toll.model.Toll;

public interface TollMapper {
	List<Toll> selectShouyin(String keyword);
	//�鿴ȫ��С����Ӧ��Ƿ�����
	List<Toll> TollDisReportAll();
	//�鿴ĳ��С���µ�Ƿ�����
	List<Toll> TollDisIdReportAll(int disid);
	//�鿴С�����շ������µ��շ���Ŀ
	List<Toll> selectReprotPrice(int disid,int ztype);
	//�߼���ѯȫ��
	List<Toll> selectWeiGaoAll(Toll toll);
	//�鿴��Ƿ�ѽ�������
	Toll tollQFSumAndCount();
	//�鿴�������������
	Toll tollSRSumAndCount();
	//�鿴���˷ѽ�������
	Toll tollTFSumAndCount();
	//�޸�״̬Ϊ�˷�
	int tollupstatus(Integer tollid);
	//����ҵ��id��δ���˵�
	List<Toll> tollhistoryOid(Integer oid);
	//���ݷ�id��δ���˵�
	List<Toll> tollhistoryfanid(Integer fanid);
	//���ݳ�λid��δ���˵�
	List<Toll> tollhistoryparkid(Integer parkid);
	//���ݳ���id��δ���˵�
	List<Toll> tollhistoryvehicid(Integer vehicid);
	//�����ѽ�id�鿴��Ӧ�˵�
	List<Toll> selectYijiaoid(Integer unpaid);
	//���ݷ�id��δ���˵�
	List<Toll> selectTollfanid(Integer fanid);
	//���ݳ�λid��δ���˵�
	List<Toll> selectTollparkid(Integer parkid);
	//���ݳ�λid��δ���˵�
	List<Toll> selectTollvehicid(Integer vehicid);
	//����ס��id��δ���˵�
	List<Toll> selectTollowerid(Integer owerid);
	//�鿴ȫ���ѽ��˵�
	List<Toll> selectYiAll();
	//����id�鿴δ���˵�
	Toll selectWeiTollid(int tollid);
	//���˵���Ϊ�ѽɣ�����Ӧ��Ӧ���ѽ��˵�
	int updateTollStatus(int uanpaid,int tollid);
	
	//������ҵ�����������Ӧ�˵��ϼ���ҵ��
	int updateFPVandOwer(Toll toll);
	
    int deleteByPrimaryKey(Integer tollid);

    int insertSelective(Toll record);

    Toll selectByPrimaryKey(Integer tollid);

    int updateByPrimaryKeySelective(Toll record);

}