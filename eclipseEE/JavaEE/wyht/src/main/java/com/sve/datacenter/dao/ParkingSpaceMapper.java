package com.sve.datacenter.dao;

import java.io.InputStream;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.sve.datacenter.model.ParkingSpace;

public interface ParkingSpaceMapper {
	//��λ����
	int parkCount();
	
	int updateParkChargJnum(int parkid);
	
	//��ѯ��С���ĳ�λ��
	List<ParkingSpace> parkReportAll();
	//��ѯһ��С���ĳ�λ״��
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