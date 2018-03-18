package com.sve.datacenter.service;

import java.io.InputStream;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.sve.datacenter.model.District;
import com.sve.datacenter.model.Owners;

public interface OwnersService {
	// �������½
	Owners selectPasslogin(Owners owners);

	// �޸�����
	int updateowpass(Owners owners);

	Owners selectPhone(String ownerphone);

	// ��Ǩ���ҵ������
	int yezhuCount();

	// ��������ҵ��
	List<Owners> quickFind(String str);

	// ��ѯȫ��С������Ӧ��ҵ�����״̬
	List<Owners> selectOwnerDisReport();

	// ��ѯһ��С������Ӧ��ҵ�����״̬
	List<Owners> selectOwnerDisidReport(int disid);

	List<Owners> selectDisid(int disid);

	Owners selectOwerid(int owerid);// ���ٵ���

	List<Owners> selectFanid(int fanid);

	List<Owners> selectAllOwners(int disid);

	List<District> selectdisall();

	List<Owners> selectowners(Owners os);

	List<Owners> selectA(int status);

	List<Owners> selectAll(Owners os);

	int deleteByPrimaryKey(Integer oid);

	int insertSelective(Owners record);

	Owners selectByPrimaryKey(Integer oid);

	int updateByPrimaryKeySelective(Owners record);

	int update_yzstatus(Owners os);

	int selectophone(String ophone);

	int insertBatch(List<Owners> ls);

	void importExcelInfo(InputStream in, MultipartFile file, Integer d, Integer h, Integer u) throws Exception;

	List<Owners> selectAllName();
}
