package com.sve.toll.dao;

import java.util.List;

import com.sve.toll.model.Chargs;

public interface ChargsMapper {
	//��Զ�ʱ�����շѵ�
	List<Chargs>selectTaskvehicid(int priceid);
	//��Զ�ʱ��λ�շѵ�
	List<Chargs> selectTaskparkid(int priceid);
	// ��Զ�ʱ�����շѵ�
	List<Chargs> selectTaskfanid(int priceid);
	
	List<Chargs> selectPidduiCharg(int priceid);//�����շ���Ŀ�鿴��Ӧ��Ѻ������Ŀ
	//������Ŀid�鿴�Զ��幫ʽ���շѵ�λΪֹ�ȳ���ʼ�ȵı�׼
	List<Chargs> selectProForid(int priceid);
	//��ȡ�շѱ�׼���շ���Ŀ
	Chargs selectchargprice(int chargid);
	
	List<Chargs> selectProjectid(int proid);
	//���Ҷ�Ӧ��ʽid����û������
	int selectFormulaid(int formulaid);
	
    int deleteByPrimaryKey(Integer chargid);

    int insertSelective(Chargs record);

    Chargs selectByPrimaryKey(Integer chargid);

    int updateByPrimaryKeySelective(Chargs record);

}