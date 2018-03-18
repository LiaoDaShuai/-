package com.sve.datacenter.service.impl;

import java.io.InputStream;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.sve.datacenter.dao.HouseFanMapper;
import com.sve.datacenter.model.HouseFan;
import com.sve.datacenter.service.HouseFanService;
import com.sve.util.ExcelUtil;

@Service
@Transactional
public class HouseFanServiceImpl implements HouseFanService{

	@Autowired
	private HouseFanMapper houseFanMapper;

	public int updateFanChargJnum(int fanid) {
		return houseFanMapper.updateFanChargJnum(fanid);
	}

	public List<HouseFan> selectUtypecount(int disid) {
		return houseFanMapper.selectUtypecount(disid);
	}

	public List<HouseFan> selectDisfancount() {
		return houseFanMapper.selectDisfancount();
	}

	public HouseFan selectDisidfancount(int disid) {
		return houseFanMapper.selectDisidfancount(disid);
	}

	public int updateFanChargnum(int fanid) {
		return houseFanMapper.updateFanChargnum(fanid);
	}

	public HouseFan selectFandid(int fanid) {
		return houseFanMapper.selectFandid(fanid);
	}

	public HouseFan selectfannum(String hnum) {
		return houseFanMapper.selectfannum(hnum);
	}

	
	public List<HouseFan> selectfanflid(Integer foolid) {
		return houseFanMapper.selectfanflid(foolid);
	}

	
	public HouseFan selectfanDis(int fanid) {
		return houseFanMapper.selectfanDis(fanid);
	}

	
	public List<HouseFan> selectDisid(Integer disid) {
		return houseFanMapper.selectDisid(disid);
	}

	
	public List<HouseFan> selectAll(HouseFan hf) {
		return houseFanMapper.selectAll(hf);
	}

	
	public List<HouseFan> selectA() {
		return houseFanMapper.selectA();
	}

	
	public int deleteByPrimaryKey(Integer fanid) {
		return houseFanMapper.deleteByPrimaryKey(fanid);
	}

	
	public int insertSelective(HouseFan record) {
		return houseFanMapper.insertSelective(record);
	}

	
	public HouseFan selectByPrimaryKey(Integer fanid) {
		return houseFanMapper.selectByPrimaryKey(fanid);
	}

	
	public int updateByPrimaryKeySelective(HouseFan record) {
		return houseFanMapper.updateByPrimaryKeySelective(record);
	}
	
	public int insertBatch(List<HouseFan> ls) {
		return houseFanMapper.insertBatch(ls);
	}

	public void importExcelInfo(InputStream in, MultipartFile file, Integer d, Integer h, Integer u)throws Exception {
		List<List<Object>> listob=ExcelUtil.getBankListByExcel(in, file.getOriginalFilename());
		List<HouseFan> hf=new ArrayList<HouseFan>();
		for(int i=0;i<listob.size();i++){
			List<Object> ls=listob.get(i);
			HouseFan f=new HouseFan();
			f.setDisid(d);
			f.setHlid(h);
			f.setUnitid(u);
			f.setLouceng(Integer.parseInt(ls.get(0).toString()));
			f.setHnum(String.valueOf(ls.get(1)));
			f.setZarea(Double.parseDouble((ls.get(2).toString())));
			f.setTarea(Double.parseDouble(ls.get(3).toString()));
			f.setGarea(Double.parseDouble(ls.get(4).toString()));
			String utype=String.valueOf(ls.get(5));
			if(utype.equals("住宅")){
				f.setUtype(1);
			}else if(utype.equals("公寓")){
				f.setUtype(2);
			}else if(utype.equals("办公")){
				f.setUtype(3);
			}else if(utype.equals("厂房")){
				f.setUtype(4);
			}else if(utype.equals("仓库")){
				f.setUtype(5);
			}else if(utype.equals("商铺")){
				f.setUtype(6);
			}else if(utype.equals("酒店")){
				f.setUtype(7);
			}else if(utype.equals("别墅")){
				f.setUtype(8);
			}else if(utype.equals("其他")){
				f.setUtype(9);
			}else{
				f.setUtype(0);
			}
			f.setHchaoxiang(String.valueOf(ls.get(6)));
			f.setStartdate(Date.valueOf(ls.get(7).toString()));
			f.setCyear(Integer.parseInt(ls.get(8).toString()));
			f.setRemark(String.valueOf(ls.get(9)));
			hf.add(f);
		}
		houseFanMapper.insertBatch(hf);
	}

	public int houseCount() {
		return houseFanMapper.houseCount();
	}

	public List<HouseFan> quickFind(String str) {
		return houseFanMapper.quickFind(str);
	}
	
}
