package com.sve.datacenter.dao;

import java.io.InputStream;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.sve.datacenter.model.HouseFan;

public interface HouseFanMapper {
	//房屋总数
	int houseCount();
	//快速搜索房屋
	List<HouseFan> quickFind(String str);
	
	int updateFanChargJnum(int fanid);
	//用于报表，看看小区对应的房屋数
	List<HouseFan> selectDisfancount();
	//用于报表，根据小区id查看对应的房屋数
	HouseFan selectDisidfancount(int disid);
	
	List<HouseFan> selectUtypecount(int disid);
	
	int updateFanChargnum(int fanid);
	
	HouseFan selectFandid(int fanid);
	
	HouseFan selectfannum(String hnum);
	
	List<HouseFan> selectfanflid(Integer foolid);
	
	HouseFan selectfanDis(int fanid);
	
	List<HouseFan> selectDisid(Integer disid);
	// 模糊查询 -->
	List<HouseFan> selectAll(HouseFan hf);
	 // 查询全部 -->
	List<HouseFan> selectA();
	
    int deleteByPrimaryKey(Integer fanid);

    int insertSelective(HouseFan record);

    HouseFan selectByPrimaryKey(Integer fanid);

    int updateByPrimaryKeySelective(HouseFan record);
    
    int insertBatch(List<HouseFan> ls);//批量添加房屋
    
    void importExcelInfo(InputStream in,MultipartFile file,Integer d,Integer h,Integer u);//导入房屋

}