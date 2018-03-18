package com.sve.datacenter.service;

import java.io.InputStream;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.sve.datacenter.model.District;
import com.sve.datacenter.model.Owners;

public interface OwnersService {
	// 用密码登陆
	Owners selectPasslogin(Owners owners);

	// 修改密码
	int updateowpass(Owners owners);

	Owners selectPhone(String ownerphone);

	// 已迁入的业主总数
	int yezhuCount();

	// 快速搜索业主
	List<Owners> quickFind(String str);

	// 查询全部小区及对应的业主身份状态
	List<Owners> selectOwnerDisReport();

	// 查询一个小区及对应的业主身份状态
	List<Owners> selectOwnerDisidReport(int disid);

	List<Owners> selectDisid(int disid);

	Owners selectOwerid(int owerid);// 查少的列

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
