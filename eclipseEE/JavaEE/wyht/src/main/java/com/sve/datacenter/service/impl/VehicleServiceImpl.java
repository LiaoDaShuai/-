package com.sve.datacenter.service.impl;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.sve.datacenter.dao.VehicleMapper;
import com.sve.datacenter.model.Vehicle;
import com.sve.datacenter.service.VehicleService;
import com.sve.util.ExcelUtil;

@Service
@Transactional
public class VehicleServiceImpl implements VehicleService{

	@Autowired
	private VehicleMapper vehicleMapper;

	public int updateVehicChargJnum(int vehicid) {
		return vehicleMapper.updateVehicChargJnum(vehicid);
	}

	public int updateVehicChargnum(int vehicid) {
		return vehicleMapper.updateVehicChargnum(vehicid);
	}

	public List<Vehicle> selectVehicle(int parkid) {
		return vehicleMapper.selectVehicle(parkid);
	}

	
	public Vehicle selectcnum(String cnum) {
		return vehicleMapper.selectcnum(cnum);
	}

	
	public List<Vehicle> selectAll(Vehicle v) {
		return vehicleMapper.selectAll(v);
	}

	
	public List<Vehicle> selectA() {
		return vehicleMapper.selectA();
	}

	
	public int deleteByPrimaryKey(Integer vehicid) {
		return vehicleMapper.deleteByPrimaryKey(vehicid);
	}

	
	public int insertSelective(Vehicle record) {
		return vehicleMapper.insertSelective(record);
	}

	
	public Vehicle selectByPrimaryKey(Integer vehicid) {
		return vehicleMapper.selectByPrimaryKey(vehicid);
	}

	
	public int updateByPrimaryKeySelective(Vehicle record) {
		return vehicleMapper.updateByPrimaryKeySelective(record);
	}

	
	public int batch_deletion(int[] vehicid) {
		return vehicleMapper.batch_deletion(vehicid);
	}

	
	public int insertBatch(List<Vehicle> ls) {
		return vehicleMapper.insertBatch(ls);
	}

	
	public void importExcelInfo(InputStream in, MultipartFile file, Integer d) throws Exception {
		List<List<Object>> listob=ExcelUtil.getBankListByExcel(in, file.getOriginalFilename());
		List<Vehicle> vs=new ArrayList<Vehicle>();
		for(int i=0;i<listob.size();i++){
			List<Object> ls=listob.get(i);
			Vehicle v=new Vehicle();
			v.setDisid(d);
			v.setParkid(Integer.parseInt(ls.get(0).toString()));
			v.setKanum(String.valueOf(ls.get(1)));
			v.setCname(String.valueOf(ls.get(2)));
			v.setCphone(String.valueOf(ls.get(3)));
			v.setCarnum(String.valueOf(ls.get(4)));
			v.setCarpai(Double.parseDouble(ls.get(5).toString()));
			v.setCarxing(String.valueOf(ls.get(6)));
			v.setCarcolor(String.valueOf(ls.get(7)));
			v.setCarqq(String.valueOf(ls.get(8)));
			v.setCarweixin(String.valueOf(ls.get(9)));
			v.setCaremail(String.valueOf(ls.get(10)));
			v.setHomephone(String.valueOf(ls.get(11)));
			v.setRemark(String.valueOf(ls.get(12)));
			vs.add(v);
		}
		vehicleMapper.insertBatch(vs);
	}

	public int carCount() {
		return vehicleMapper.carCount();
	}

	public List<Vehicle> quickFind(String str) {
		return vehicleMapper.quickFind(str);
	}
	
}
