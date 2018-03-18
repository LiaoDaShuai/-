package com.sve.toll.dao;

import java.util.List;

import com.sve.toll.model.Toll;
import com.sve.toll.model.Unpaidbills;

public interface UnpaidbillsMapper {
	//���͸���Ӧס����
	List<Unpaidbills> selectTuiQt(int oid);
	//�����ѽɽ���
	List<Unpaidbills> selectUnpaidReport(Toll toll);
	//���ڸ���id��ѯ�ѽɽ�����Ϣ
	List<Unpaidbills> selectUnpaidDisReport(Toll toll);
	
	Unpaidbills selectDayinunpaid(Integer unpaid);//��ӡ
	
	List<Unpaidbills> selectGaojiAll(Toll toll);
	
	int NoupdateUnpaid(Integer unpaid);
	//�鿴�h��ӛ�
	List<Unpaidbills> selectDelAll(Toll toll);
	//�鿴״̬Ϊ���˷ѵ��ʵ��Ҷ�Ӧunpaid2��
	Unpaidbills selectYiTuiUnpaids(Integer unpaid);
	//�鿴״̬Ϊ�ѽɵĵ��˵���Ϣ
	Unpaidbills selectTuiUnpaids(Integer unpaid);
	//�޸��ѽ��˵�Ϊ����
	int Upunpidstatus(Integer unpaid);
	//��ѯ����
	Unpaidbills selectUnpaids(Integer unpaid);
	//��ѯ�ɷ���ϸ
	List<Unpaidbills> selectUnpidTollAll(Toll toll);
	//ɾ������isdrop�ĳ�1����
	int dropUnpaid(Integer unpaid);
	//��ѯ�����ѽ��˵�
	List<Unpaidbills> selectAll();
	
    int deleteByPrimaryKey(Integer unpaid);

    int insertSelective(Unpaidbills record);

    Unpaidbills selectByPrimaryKey(Integer unpaid);

    int updateByPrimaryKeySelective(Unpaidbills record);
}