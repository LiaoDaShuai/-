package com.sve.datacenter.service.impl;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.sve.datacenter.dao.BindingMapper;
import com.sve.datacenter.dao.OwnersMapper;
import com.sve.datacenter.model.Binding;
import com.sve.datacenter.model.District;
import com.sve.datacenter.model.Owners;
import com.sve.datacenter.service.OwnersService;
import com.sve.util.ExcelUtil;

@Service
@Transactional
public class OwnersServiceImpl implements OwnersService{

	@Autowired
	private OwnersMapper ownersMapper;
	@Autowired
	private BindingMapper bindMapper;
	
	public Owners selectPasslogin(Owners owners) {
		return ownersMapper.selectPasslogin(owners);
	}

	public int updateowpass(Owners owners) {
		return ownersMapper.updateowpass(owners);
	}

	public Owners selectPhone(String ownerphone) {
		return ownersMapper.selectPhone(ownerphone);
	}

	public List<Owners> selectAllName() {
		return ownersMapper.selectAllName();
	}

	public List<Owners> selectOwnerDisReport() {
		return ownersMapper.selectOwnerDisReport();
	}

	public List<Owners> selectOwnerDisidReport(int disid) {
		return ownersMapper.selectOwnerDisidReport(disid);
	}

	public List<Owners> selectDisid(int disid) {
		return ownersMapper.selectDisid(disid);
	}

	public Owners selectOwerid(int owerid) {
		return ownersMapper.selectOwerid(owerid);
	}

	public List<Owners> selectFanid(int fanid) {
		return ownersMapper.selectFanid(fanid);
	}

	
	public List<Owners> selectAllOwners(int disid) {
		return ownersMapper.selectAllOwners(disid);
	}

	
	public List<District> selectdisall() {
		return ownersMapper.selectdisall();
	}

	
	public List<Owners> selectowners(Owners os) {
		return ownersMapper.selectowners(os);
	}

	
	public List<Owners> selectA(int status) {
		return ownersMapper.selectA(status);
	}

	
	public List<Owners> selectAll(Owners os) {
		return ownersMapper.selectAll(os);
	}

	
	public int deleteByPrimaryKey(Integer oid) {
		return ownersMapper.deleteByPrimaryKey(oid);
	}

	
	public int insertSelective(Owners record) {
		return ownersMapper.insertSelective(record);
	}

	
	public Owners selectByPrimaryKey(Integer oid) {
		return ownersMapper.selectByPrimaryKey(oid);
	}

	
	public int updateByPrimaryKeySelective(Owners record) {
		return ownersMapper.updateByPrimaryKeySelective(record);
	}

	
	public int update_yzstatus(Owners os) {
		return ownersMapper.update_yzstatus(os);
	}

	
	public int selectophone(String ophone) {
		return ownersMapper.selectophone(ophone);
	}

	
	public int insertBatch(List<Owners> ls) {
		return ownersMapper.insertBatch(ls);
	}

	
	public void importExcelInfo(InputStream in, MultipartFile file, Integer d, Integer h, Integer u) throws Exception {
		List<List<Object>> listob=ExcelUtil.getBankListByExcel(in, file.getOriginalFilename());
		for(int i=0;i<listob.size();i++){
			List<Object> ls=listob.get(i);
			Owners o=new Owners();
			Binding bind=new Binding();
			o.setDisid(d);
			o.setHlid(h);
			o.setUnitid(u);
			o.setFanid(Integer.parseInt(ls.get(0).toString()));
			o.setOwername(String.valueOf(ls.get(1)));
			o.setSex(String.valueOf(ls.get(2)));
			o.setOwnerphone(String.valueOf(ls.get(3)));
			o.setHomephone(String.valueOf(ls.get(4)));
			o.setMdate(String.valueOf(ls.get(5)));
			String cd=String.valueOf(ls.get(6));
			if(cd.equals("业主本人")){
				o.setCardid(1);
			}else if(cd.equals("亲属")){
				o.setCardid(2);
			}else if(cd.equals("租客")){
				o.setCardid(3);
			}else{
				o.setCardid(4);
			}
			o.setLivetype(String.valueOf(ls.get(7)));
			o.setQqnum(String.valueOf(ls.get(8)));
			o.setWeixin(String.valueOf(ls.get(9)));
			o.setEmail(String.valueOf(ls.get(10)));
			o.setEmergency(String.valueOf(ls.get(11)));
			o.setEmergphone(String.valueOf(ls.get(12)));
			o.setNation(String.valueOf(ls.get(13)));
			o.setPolitical(String.valueOf(ls.get(14)));
			o.setIshunyin(String.valueOf(ls.get(15)));
			o.setIdcard(String.valueOf(ls.get(16)));
			o.setHujiaddress(String.valueOf(ls.get(17)));
			o.setTemporarynum(String.valueOf(ls.get(18)));
			o.setPetxinxi(String.valueOf(ls.get(19)));
			o.setOnum(String.valueOf(ls.get(20)));
			o.setRemark(String.valueOf(ls.get(21)));
			ownersMapper.insertSelective(o);
			bind.setOwnerId(o.getOid());
			bind.setHouseId(o.getFanid());
			if(o.getCardid()==null||o.getCardid().equals("")){
				bind.setOwnercard(1);
			}else{
				bind.setOwnercard(o.getCardid());
			}
			bindMapper.insertSelective(bind);//添加到绑定表中
		}
	}

	public int yezhuCount() {
		return ownersMapper.yezhuCount();
	}

	public List<Owners> quickFind(String str) {
		return ownersMapper.quickFind(str);
	}
	
}
