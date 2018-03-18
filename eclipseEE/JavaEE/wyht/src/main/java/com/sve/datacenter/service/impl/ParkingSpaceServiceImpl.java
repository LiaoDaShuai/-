package com.sve.datacenter.service.impl;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.sve.datacenter.dao.ParkingSpaceMapper;
import com.sve.datacenter.model.ParkingSpace;
import com.sve.datacenter.service.ParkingSpaceService;
import com.sve.util.ExcelUtil;
@Service
@Transactional
public class ParkingSpaceServiceImpl implements ParkingSpaceService{

	@Autowired
	private ParkingSpaceMapper parkingspaceMapper;

	public int updateParkChargJnum(int parkid) {
		return parkingspaceMapper.updateParkChargJnum(parkid);
	}

	public List<ParkingSpace> parkReportAll() {
		return parkingspaceMapper.parkReportAll();
	}

	public List<ParkingSpace> parkReportStatus(int disid) {
		return parkingspaceMapper.parkReportStatus(disid);
	}

	public List<ParkingSpace> selectParkingSpace(int disid) {
		return parkingspaceMapper.selectParkingSpace(disid);
	}

	public int updateParkChargnum(int parkid) {
		return parkingspaceMapper.updateParkChargnum(parkid);
	}


	public List<ParkingSpace> selectdisid(int disid) {
		return parkingspaceMapper.selectdisid(disid);
	}

	
	public ParkingSpace selectparknum(String pnum) {
		return parkingspaceMapper.selectparknum(pnum);
	}

	
	public List<ParkingSpace> selectA() {
		return parkingspaceMapper.selectA();
	}

	
	public List<ParkingSpace> selectAll(ParkingSpace ps) {
		return parkingspaceMapper.selectAll(ps);
	}

	
	public int deleteByPrimaryKey(Integer parkid) {
		return parkingspaceMapper.deleteByPrimaryKey(parkid);
	}

	
	public int insert(ParkingSpace record) {
		return parkingspaceMapper.insert(record);
	}

	
	public int insertSelective(ParkingSpace record) {
		return parkingspaceMapper.insertSelective(record);
	}

	
	public ParkingSpace selectByPrimaryKey(Integer parkid) {
		return parkingspaceMapper.selectByPrimaryKey(parkid);
	}

	
	public int updateByPrimaryKeySelective(ParkingSpace record) {
		return parkingspaceMapper.updateByPrimaryKeySelective(record);
	}

	
	public int updateByPrimaryKey(ParkingSpace record) {
		return parkingspaceMapper.updateByPrimaryKey(record);
	}

	
	public int insertBatch(List<ParkingSpace> ls) {
		return parkingspaceMapper.insertBatch(ls);
	}

	public void importExcelInfo(InputStream in, MultipartFile file, Integer d) throws Exception {
		List<List<Object>> listob=ExcelUtil.getBankListByExcel(in, file.getOriginalFilename());
		List<ParkingSpace> ps=new ArrayList<ParkingSpace>();
		for(int i=0;i<listob.size();i++){
			List<Object> ls=listob.get(i);
			ParkingSpace p=new ParkingSpace();
			p.setDisid(d);
			p.setPnum(String.valueOf(ls.get(0)));
			p.setCarea(Double.parseDouble(ls.get(1).toString()));
			String sta=String.valueOf(ls.get(2));
			if(sta.equals("空闲")){
				p.setStatus(1);
			}else if(sta.equals("出租")){
				p.setStatus(2);
			}else if(sta.equals("出售")){
				p.setStatus(3);
			}else if(sta.equals("自用")){
				p.setStatus(4);
			}else{
				p.setStatus(0);
			}
			p.setRemark(String.valueOf(ls.get(3)));
			ps.add(p);
		}
		parkingspaceMapper.insertBatch(ps);
	}

	public int parkCount() {
		return parkingspaceMapper.parkCount();
	}
	
	
}
