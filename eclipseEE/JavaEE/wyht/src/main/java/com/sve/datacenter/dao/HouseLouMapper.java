package com.sve.datacenter.dao;

import java.util.List;

import com.sve.datacenter.model.District;
import com.sve.datacenter.model.HouseFan;
import com.sve.datacenter.model.HouseLou;
import com.sve.datacenter.model.Unit;

public interface HouseLouMapper {
	//¥������
	int louyuCount();
	// ����¥��id�鿴��Ӧ��¥��
	HouseLou selectFandid(int hlid);

	// �鿴��С�����������¥��
	List<HouseLou> selectDisid(int disid);

	int deleteByPrimaryKey(Integer hlid);

	int insertSelective(HouseLou record);

	HouseLou selectByPrimaryKey(Integer hlid);

	int updateByPrimaryKeySelective(HouseLou record);
	// ��ѯȫ�� -->
	List<HouseLou> selectA();
	// ģ����ѯ -->
	List<HouseLou> selectAll(HouseLou hl);
	//��ѯС����״̬Ϊ0��С�� -->
	List<District> selectByDis(int status);
	// ����С��id��ѯ¥��� -->
	List<HouseLou> selectly(int disid);

	List<Unit> selectut(Unit ut);

	List<HouseFan> selecthf(HouseFan hf);

	int delete_selecthouse(int hlid);

	int delete_unit(int hlid);

	int insert_unit(Unit u);

	int selecthfname(String floorname);
}