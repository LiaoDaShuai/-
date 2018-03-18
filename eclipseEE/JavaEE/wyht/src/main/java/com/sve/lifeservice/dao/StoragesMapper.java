package com.sve.lifeservice.dao;

import java.util.List;

import com.sve.lifeservice.model.Storages;

public interface StoragesMapper {
	//��ѯ��ȡ�Ŀ������
	int storagesCount();
	
    int deleteByPrimaryKey(Integer storId);

    int insertSelective(Storages record);

    Storages selectByPrimaryKey(Integer storId);

    int updateByPrimaryKeySelective(Storages record);

    List<Storages> selectA(int storExpId);//����ѯȫ��
    
    List<Storages> selectAll(Storages sto);//ģ����ѯȫ��
    
    int delete_selectStorage(int expId);//���ݿ�ݱ�Ų�ѯ�����Ƿ�������
    
    int delete_Storage(int expId);//���ݿ�ݱ��ɾ������
    
    int delete_selectStorage2(int couId);//���ݿ��Ա��Ų�ѯ�����Ƿ�������
    
    int delete_Storage2(int couId);//���ݿ��Ա���ɾ������
    
    List<Storages> selectByPhone4(Storages sto);//�����ֻ���4λ��ѯ���Ŀ����Ϣ
    
    int updateStorage(int storId);//�޸Ŀ��״̬
    
    int selectStorNum(String num);//��ѯ��ݵ����Ƿ��Ѵ���
}