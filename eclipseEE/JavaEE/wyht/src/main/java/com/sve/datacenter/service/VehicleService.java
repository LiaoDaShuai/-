package com.sve.datacenter.service;

import java.io.InputStream;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.sve.datacenter.model.Vehicle;

public interface VehicleService {
	//车辆总量
	int carCount();
	//快速搜索车辆
	List<Vehicle> quickFind(String str);
	
	int updateVehicChargJnum(int vehicid);
	
	int updateVehicChargnum(int vehicid);

	List<Vehicle> selectVehicle(int parkid);

	Vehicle selectcnum(String cnum);

	List<Vehicle> selectAll(Vehicle v);

	List<Vehicle> selectA();

	int deleteByPrimaryKey(Integer vehicid);

	int insertSelective(Vehicle record);

	Vehicle selectByPrimaryKey(Integer vehicid);

	int updateByPrimaryKeySelective(Vehicle record);

	int batch_deletion(int[] vehicid);

	int insertBatch(List<Vehicle> ls);

	void importExcelInfo(InputStream in, MultipartFile file, Integer d) throws Exception;
}
