package com.sve.datacenter.dao;

import java.io.InputStream;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.sve.datacenter.model.ParkingSpace;

public interface ParkingSpaceMapper {
	//车位总数
	int parkCount();
	
	int updateParkChargJnum(int parkid);
	
	//查询各小区的车位数
	List<ParkingSpace> parkReportAll();
	//查询一个小区的车位状况
	List<ParkingSpace> parkReportStatus(int disid);
	
	List<ParkingSpace> selectParkingSpace(int disid);
	
	int updateParkChargnum(int parkid);
	
	List<ParkingSpace> selectdisid(int disid);
	
	ParkingSpace selectparknum(String pnum);
	
	List<ParkingSpace> selectA();
	
	List<ParkingSpace> selectAll(ParkingSpace ps);
	
    int deleteByPrimaryKey(Integer parkid);

    int insert(ParkingSpace record);

    int insertSelective(ParkingSpace record);

    ParkingSpace selectByPrimaryKey(Integer parkid);

    int updateByPrimaryKeySelective(ParkingSpace record);

    int updateByPrimaryKey(ParkingSpace record);

    int insertBatch(List<ParkingSpace> ls);
    
    void importExcelInfo(InputStream in, MultipartFile file, Integer d);
}