package com.sve.datacenter.service;

import java.io.InputStream;
import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.sve.datacenter.model.HouseFan;

public interface HouseFanService {
	//��������
	int houseCount();
	//������������
	List<HouseFan> quickFind(String str);
	
	int updateFanChargJnum(int fanid);
	// ���ڱ�������С����Ӧ�ķ�����
	List<HouseFan> selectDisfancount();

	// ���ڱ�������С��id�鿴��Ӧ�ķ�����
	HouseFan selectDisidfancount(int disid);

	List<HouseFan> selectUtypecount(int disid);
	
	int updateFanChargnum(int fanid);

	HouseFan selectFandid(int fanid);

	HouseFan selectfannum(String hnum);

	List<HouseFan> selectfanflid(Integer foolid);

	HouseFan selectfanDis(int fanid);

	List<HouseFan> selectDisid(Integer disid);

	List<HouseFan> selectAll(HouseFan hf);

	List<HouseFan> selectA();

	int deleteByPrimaryKey(Integer fanid);

	int insertSelective(HouseFan record);

	HouseFan selectByPrimaryKey(Integer fanid);

	int updateByPrimaryKeySelective(HouseFan record);

	// ������ӷ���
	int insertBatch(List<HouseFan> ls);

	// ���뷿��
	void importExcelInfo(InputStream in, MultipartFile file, Integer d, Integer h, Integer u) throws Exception;
}
