package com.sve.toll.dao;

import java.util.List;

import com.sve.toll.model.Tablemanager;

public interface TablemanagerMapper {
	//���ɷ��˸�����״̬
	int updateTabStatus(int tabid);
	//�鿴���û���Ӧ�շѱ�׼��������
	List<Tablemanager> selectChargidEndnum(Tablemanager tablemanager);
	//�༭�õ�
	List<Tablemanager> selectTabHouCharg();
	//�鿴�Ƿ�ͬ������ţ�ͬ���շѱ�׼�Դ���¼�롣
	int selectTongMonths(Tablemanager tablemanager);
	//�߼�ģ����ѯ
	List<Tablemanager> selectTabHouChargGaoji(Tablemanager tablemanager);
	
	List<Tablemanager> selectAll();
	
    int deleteByPrimaryKey(Integer tabid);

    int insert(Tablemanager record);

    int insertSelective(Tablemanager record);

    Tablemanager selectByPrimaryKey(Integer tabid);

    int updateByPrimaryKeySelective(Tablemanager record);

    int updateByPrimaryKey(Tablemanager record);
}