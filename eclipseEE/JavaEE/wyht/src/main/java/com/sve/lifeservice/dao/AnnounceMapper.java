package com.sve.lifeservice.dao;

import java.util.ArrayList;
import java.util.List;

import com.sve.datacenter.model.District;
import com.sve.lifeservice.model.Announce;

public interface AnnounceMapper {
	//С��������
	int announceCount();
	//�οͿɿ����Ĺ���
	List<Announce> selectADyk();
	//ҵ����¼��ɿ����Ĺ���
	List<Announce> selectADorder(int disid);
	//�����������
	int updateCount(int annId);
	
	List<District> selectGuanDis(int annid);// ��ѯ���������С��

	List<Announce> selectAnnounce();// ��ȫ��

	List<Announce> selectAD();// ��ȫ������ӦС��

	boolean insertSelective(Announce announce);// ��ӹ���

	int updateByPrimaryKeySelective(Announce announce);// �޸Ĺ���

	boolean deleteAnnounce(int id);// ɾ������

	Announce selectAnnounceById(int id);// ����id�鹫��

	ArrayList<Announce> selectAnnounceByKey(String key);// ���ݹ������鹫��
}
