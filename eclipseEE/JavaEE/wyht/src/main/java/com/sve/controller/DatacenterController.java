package com.sve.controller;

import java.io.File;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sve.datacenter.model.Ban_chargs;
import com.sve.datacenter.model.Binding;
import com.sve.datacenter.model.District;
import com.sve.datacenter.model.HouseFan;
import com.sve.datacenter.model.HouseLou;
import com.sve.datacenter.model.Owners;
import com.sve.datacenter.model.ParkingSpace;
import com.sve.datacenter.model.Unit;
import com.sve.datacenter.model.Vehicle;
import com.sve.datacenter.service.Ban_chargsService;
import com.sve.datacenter.service.BindingService;
import com.sve.datacenter.service.DistrictService;
import com.sve.datacenter.service.HouseFanService;
import com.sve.datacenter.service.HouseLouService;
import com.sve.datacenter.service.OwnersService;
import com.sve.datacenter.service.ParkingSpaceService;
import com.sve.datacenter.service.UnitService;
import com.sve.datacenter.service.VehicleService;
import com.sve.toll.model.Chargs;
import com.sve.toll.model.Formula;
import com.sve.toll.model.Temporary;
import com.sve.toll.model.Toll;
import com.sve.toll.service.FormulaService;
import com.sve.toll.service.TemporaryService;
import com.sve.toll.service.TollService;
import com.sve.util.FormulaPage;
import com.sve.util.PageInfo2;

@Controller
@RemoteProxy(name = "datacenterController")
public class DatacenterController {
	@Autowired
	private DistrictService districtService;// С��
	@Autowired
	private HouseLouService houseLouService;// ¥��
	@Autowired
	private HouseFanService houseFanService;// ����
	@Autowired
	private UnitService unitService;// ��Ԫ
	@Autowired
	private OwnersService ownersService;// ҵ��
	@Autowired
	private ParkingSpaceService parkingSpaceService;// ��λ
	@Autowired
	private VehicleService vehicleService;// ����
	@Autowired
	private BindingService bindingService;// ��ס��
	@Autowired
	private Ban_chargsService ban_chargsService;
	@Autowired
	private TollService tollService;
	@Autowired
	private TemporaryService temporaryService;
	@Autowired
	private FormulaService formulaService;
	private FormulaPage forpage = new FormulaPage();
	
	@Autowired
	private DataSourceTransactionManager txManager;//ע������������,�������Դ
	
	//�������״̬
	public TransactionStatus txHandle(){
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();//�������Զ���
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRES_NEW);//����������
		return txManager.getTransaction(def);//��������״̬
	}
	
	// ��ס��
	@RemoteMethod
	public int insert_binding(Binding bd) {
		int count = bindingService.selectOwerFPV(bd);
		if (count < 1) {
			bindingService.insertSelective(bd);
			Toll toll = new Toll();
			if (bd.getHouseId() != null) {
				toll.setFanId(bd.getHouseId());
			} else if (bd.getParkId() != null) {
				toll.setParkId(bd.getParkId());
			} else if (bd.getVehicleId() != null) {
				toll.setVehicleId(bd.getVehicleId());
			}
			toll.setOid(bd.getOwnerId());
			tollService.updateFPVandOwer(toll);
		}
		return count;
	}

	// �鿴����
	@RequestMapping("/fandetail/{type}/{id}")
	public String Selectdetail(@PathVariable("type") String type, @PathVariable("id") int id, Model model) {
		Binding binding = new Binding();
		List<Toll> tolllist = null;
		List<Binding> owners = null;// ������ȡowerid
		List<Binding> houses = new ArrayList<Binding>();
		List<Binding> parks = new ArrayList<Binding>();
		List<Binding> vehics = new ArrayList<Binding>();
		List<Ban_chargs> bclist = null;
		Ban_chargs bc = new Ban_chargs();
		if (type.equals("fwid")) {//�ж��ǲ鿴�ĸ����飬����
			HouseFan housefan = houseFanService.selectByPrimaryKey(id);
			binding.setHouseId(id);
			bc.setFan_id(id);
			owners = bindingService.selectOwnerid(binding);//��ȡҵ��id
			tolllist = tollService.selectTollfanid(id);// ����˵���Ϣ
			bclist = ban_chargsService.selectBcPriceid(bc);//��ȡ�������շѱ�׼
			model.addAttribute("housefan", housefan);//�ֽ��������鴫��ȥ
		} else if (type.equals("cwid")) {
			ParkingSpace park = parkingSpaceService.selectByPrimaryKey(id);
			binding.setParkId(id);
			bc.setPark_id(id);
			owners = bindingService.selectOwnerid(binding);
			tolllist = tollService.selectTollparkid(id);
			bclist = ban_chargsService.selectBcPriceid(bc);
			model.addAttribute("park", park);
		} else if (type.equals("clid")) {
			Vehicle vehic = vehicleService.selectByPrimaryKey(id);
			binding.setVehicleId(id);
			bc.setVehic_id(id);
			owners = bindingService.selectOwnerid(binding);
			tolllist = tollService.selectTollvehicid(id);
			bclist = ban_chargsService.selectBcPriceid(bc);
			model.addAttribute("vehic", vehic);
		} else if (type.equals("owid")) {//���������ҵ���Ļ�
			Owners owner = ownersService.selectByPrimaryKey(id);
			model.addAttribute("owner", owner);//�鿴ҵ������
			
			houses.addAll(bindingService.selectOwnerFanAllid(id));
			parks.addAll(bindingService.selectOwnerParkAllid(id));
			vehics.addAll(bindingService.selectOwnerVehicAllid(id));
			tolllist=tollService.selectTollowerid(owner.getOid());
		}
		if (owners != null) {//����صķ��ݡ���λ��������¼��binding
			for (Binding bin : owners) {
				houses.addAll(bindingService.selectOwnerFanAllid(bin.getOwnerId()));
				parks.addAll(bindingService.selectOwnerParkAllid(bin.getOwnerId()));
				vehics.addAll(bindingService.selectOwnerVehicAllid(bin.getOwnerId()));
			}
		}
		if (tolllist != null) {//���˵�
			tolllist = bandingjion(tolllist);
		}
		model.addAttribute("tolllist", tolllist);
		model.addAttribute("bclist", bclist);
		model.addAttribute("houses", houses);
		model.addAttribute("parks", parks);
		model.addAttribute("vehics", vehics);
		return "datacenter/information";
	}
	
	@RequestMapping("/fandetail/addcharg")
	public String addCharg(int type, Ban_chargs bc) {
		ban_chargsService.insertSelective(bc);
		if (bc.getFan_id() != null) {
			houseFanService.updateFanChargnum(bc.getFan_id());
			if (type == 1) {
				return "redirect:/house/all";
			} else {
				return "redirect:fwid/" + bc.getFan_id();
			}
		} else if (bc.getPark_id() != null) {
			parkingSpaceService.updateParkChargnum(bc.getPark_id());
			if (type == 1) {
				return "redirect:/parking/all";
			} else {
				return "redirect:cwid/" + bc.getPark_id();
			}
		} else if (bc.getVehic_id() != null) {
			vehicleService.updateVehicChargnum(bc.getVehic_id());
			if (type == 1) {
				return "redirect:/car/all";
			} else {
				return "redirect:clid/" + bc.getVehic_id();
			}
		}
		return "";
	}

	// �﷨0/1����һ��ÿ��1���賿1��ִ��һ�Σ�0 0 1 1 * ?,cron���ʽ
//	@Scheduled(cron = "0/10 * * * * ?")���ڲ���
	@Scheduled(cron = "0 0 1 1 * ?")
	public void TaskToll() throws ParseException {
		List<Ban_chargs> bclist = ban_chargsService.selectBcAll();
		Date date = new Date();// ��ȡ��ǰʱ��
		for (Ban_chargs bc : bclist) {
			// ��������պ��������ڣ����������
			if (endMonth(bc.getStartdate(), date) % bc.getChargs().getPriceweek() == 0) {
				Toll toll = jifei(bc);
				Binding bind = new Binding();
				if (bc.getFan_id() != null) {// ����
					HouseFan house = houseFanService.selectByPrimaryKey(bc.getFan_id());
					toll.setZtype(1);
					toll.setDisid(house.getDisid());
					toll.setFanId(house.getFanid());
					bind.setHouseId(house.getFanid());
				} else if (bc.getPark_id() != null) {
					ParkingSpace park = parkingSpaceService.selectByPrimaryKey(bc.getPark_id());
					toll.setZtype(2);
					toll.setDisid(park.getDisid());
					toll.setParkId(park.getParkid());
					bind.setParkId(park.getParkid());
				} else if (bc.getVehic_id() != null) {
					Vehicle vehic = vehicleService.selectByPrimaryKey(bc.getVehic_id());
					toll.setZtype(3);
					toll.setDisid(vehic.getDisid());
					toll.setVehicleId(vehic.getVehicid());
					bind.setVehicleId(vehic.getVehicid());
				}
				List<Binding> bindlist = bindingService.selectOwnerid(bind);
				if (bindlist != null && bindlist.size() > 0) {
					toll.setOid(bindlist.get(0).getOwnerId());
				}
				toll.setPriceid(bc.getPriceId());
				toll.setChargid(bc.getChargid());
				toll.setSdate(bc.getStartdate());
				if (bc.getEnddate() != null || bc.getRemark() != null) {
					toll.setEdate(bc.getEnddate());
					toll.setRemark(bc.getRemark());
				}
				toll.setBcId(bc.getBcid());
				tollService.insertSelective(toll);
			}
		}
	}

	// ���ڼ�����ã������շ����ͣ�����*�������̶�����ʽ��,������ܷ��ú�Ž�toll
	public Toll jifei(Ban_chargs bc) {
		Toll toll = new Toll();
		if (bc.getChargs().getShouid() == 0) {
			Long price = bc.getChargs().getPricing();
			int unit = bc.getChargs().getPriceunit();
			HouseFan house = houseFanService.selectByPrimaryKey(bc.getFan_id());
			if (unit == 1) {
				//��λ������������⡣������
				toll.setSubtotal(house.getZarea() * price);// �������
				toll.setCount(Integer.parseInt(house.getZarea().toString()));// �������
			} else if (unit == 2) {
				toll.setSubtotal(house.getGarea() * price);// �������
				toll.setCount(Integer.parseInt(house.getGarea().toString()));
			} else if (unit == 3) {
				toll.setSubtotal(house.getTarea() * price);// ��̯���
				toll.setCount(Integer.parseInt(house.getTarea().toString()));
			}
			toll.setPriceing(price);
		} else if (bc.getChargs().getShouid() == 1) {
			toll.setSubtotal(bc.getPrice());// ÿ������¼��
		} else if (bc.getChargs().getShouid() == 2) {
			toll.setSubtotal(bc.getChargs().getFixedprice());// �̶����
		} else if (bc.getChargs().getShouid() == 3) {
			toll.setSubtotal(Tformula(bc));
		}
		return toll;
	}

	// ���ݹ�ʽ�����ܽ��
	public double Tformula(Ban_chargs bc) {
		Formula formula = formulaService.findid(bc.getChargs().getFormula_id());
		long subtotal = 0;
		HouseFan housefan = null;
		HouseLou houselou = null;
		if (bc.getFan_id() != null) {// ��fan_id������null����������ڷ��ݹ�ʽ�ģ����и�ֵ
			housefan = houseFanService.selectByPrimaryKey(bc.getFan_id());
			houselou = houseLouService.selectByPrimaryKey(housefan.getHlid());
		}	
		if (formula.getFormulanum() == 8) {
			subtotal = (long) forpage.gongshiSelect(houselou.getCengcount(), housefan.getZarea(), formula);
		} else if (formula.getFormulanum() == 6) {
			subtotal = (long) forpage.gongshiSelect(houselou.getCengcount(), housefan.getZarea(), formula);
		} else if (formula.getFormulanum() == 5) {
			subtotal = (long) forpage.gongshiSelect(houselou.getCengcount(), 0, formula);
		} else if (formula.getFormulanum() == 4) {
			subtotal = (long) forpage.gongshiSelect(houselou.getCengcount(), 0, formula);
		} else if (formula.getFormulanum() == 3) {
			Vehicle vehic = vehicleService.selectByPrimaryKey(bc.getVehic_id());
			subtotal = (long) forpage.gongshiSelect(vehic.getCarpai(), 0, formula);
		}
		return subtotal;
	}

	// �������·�
	public int endMonth(Date sdate, Date edate) throws ParseException {
		Calendar startdate = Calendar.getInstance();
		Calendar enddate = Calendar.getInstance();
		startdate.setTime(sdate);
		enddate.setTime(edate);
		int endyear = enddate.get(Calendar.YEAR) - startdate.get(Calendar.YEAR);
		int result = endyear * 12 + enddate.get(Calendar.MONTH) - startdate.get(Calendar.MONTH);
		return result == 0 ? 1 : Math.abs(result);
	}

	/****************************** ���� ***************************************/

	@RequestMapping("/car/all")
	public String showCar(HttpServletRequest request,Vehicle ve, Model model) {
		String pageNum = request.getParameter("pageNum");
		String pageSize = request.getParameter("pageSize");
		PageHelper.startPage(getPageNum(pageNum), getPageSize(pageSize));
		List<Vehicle> list = vehicleService.selectAll(ve);
		int[] l = { 6, 10, 14, 18 };
		PageInfo page = new PageInfo(list);
		page.setPageNum(getPageNum(pageNum));
		page.setPageSize(getPageSize(pageSize));
		thisEndSizeNum(pageNum, pageSize);
		PageInfo2 page2 = new PageInfo2(page, page.getPageNum());
		page2.setSelectnum(l);
		page2.setSize(page.getPageSize());
		model.addAttribute("page", page);
		model.addAttribute("page2", page2);
		model.addAttribute("vehicle", ve);
		return "datacenter/car";
	}

	// ��ӳ���
	@RequestMapping(value = "/car/insert", method = RequestMethod.POST)
	public String insert(HttpServletRequest request, Vehicle v, MultipartFile input_file, MultipartFile input_file1,
			MultipartFile input_file2) throws Exception {
		if (!input_file.isEmpty()) {
			v.setCarphoto(upload(request, input_file));
		}
		if (!input_file1.isEmpty()) {
			v.setJiazhao(upload(request, input_file1));
		}
		if (!input_file2.isEmpty()) {
			v.setDrivingphoto(upload(request, input_file2));
		}
		vehicleService.insertSelective(v);
		return "redirect:all";
	}

	// �༭����
	@RequestMapping(value = "/car/edit", method = RequestMethod.POST)
	public @ResponseBody List<Vehicle> edit(int vehicid) {
		Vehicle v = vehicleService.selectByPrimaryKey(vehicid);
		List<Vehicle> list = new ArrayList<Vehicle>();
		list.add(v);
		return list;
	}

	// �޸ĳ�����Ϣ
	@RequestMapping(value = "/car/update", method = RequestMethod.POST)
	public String update(HttpServletRequest request, Vehicle v, MultipartFile input_file3, MultipartFile input_file4,
			MultipartFile input_file5) throws Exception {
		if (!input_file3.isEmpty()) {
			v.setCarphoto(upload(request, input_file3));
		}
		if (!input_file4.isEmpty()) {
			v.setJiazhao(upload(request, input_file4));
		}
		if (!input_file5.isEmpty()) {
			v.setDrivingphoto(upload(request, input_file5));
		}
		vehicleService.updateByPrimaryKeySelective(v);
		return "redirect:all";
	}

	// ���ݳ���id��ѯ����
	@RemoteMethod
	public Vehicle editVehicle(int vehicid){
		Vehicle ve=vehicleService.selectByPrimaryKey(vehicid);
		return ve;
	}

	// ɾ������
	@RemoteMethod
	public int delete_car(int vehicid) {
		int i=0;
		TransactionStatus status=txHandle();
		try{
			i=vehicleService.deleteByPrimaryKey(vehicid);
			txManager.commit(status);
		}catch(Exception e){
			txManager.rollback(status);
			i=0;
		}
		return i;
	}

	// ����ɾ������
	@RemoteMethod
	public int batchDeleteCar(int[] vehicid) {
		int i = 0;
		TransactionStatus status=txHandle();
		try{
			for (int id : vehicid) {
				i += vehicleService.deleteByPrimaryKey(id);
			}
			txManager.commit(status);
		}catch(Exception e){
			txManager.rollback(status);
			i=0;
		}
		return i;
	}

	// ���복��
	@RequestMapping(value = "/importVehicle", method = RequestMethod.POST)
	public String importVehicle(HttpServletRequest request, @RequestParam(value = "excelFile") MultipartFile excelFile)
			throws Exception {
		MultipartRequest multipartRequest = (MultipartRequest) request;
		MultipartFile file = multipartRequest.getFile("excelFile");
		Integer disid = Integer.parseInt(request.getParameter("disid"));
		System.out.println("disid:" + disid);
		InputStream in = file.getInputStream();
		vehicleService.importExcelInfo(in, file, disid);
		in.close();
		return "redirect:/car/all";
	}
	@RemoteMethod
	public List<ParkingSpace> selectPks(int disid){
		return parkingSpaceService.selectParkingSpace(disid);
	}
	/****************************** ��λ ***************************************/

	@RequestMapping(value = "/parking/all")
	public String showParking(HttpServletRequest request,ParkingSpace ps,Model model) {
		String pageNum = request.getParameter("pageNum");
		String pageSize = request.getParameter("pageSize");
		PageHelper.startPage(getPageNum(pageNum), getPageSize(pageSize));
		List<ParkingSpace> list = parkingSpaceService.selectAll(ps);
		int[] l = { 6, 8, 10, 12 };
		PageInfo page = new PageInfo(list);
		page.setPageNum(getPageNum(pageNum));
		page.setPageSize(getPageSize(pageSize));
		thisEndSizeNum(pageNum, pageSize);
		PageInfo2 page2 = new PageInfo2(page, page.getPageNum());// ��ҳ������
		page2.setSelectnum(l);
		page2.setSize(page.getPageSize());// �����ڵ�ҳ�����ȥ
		model.addAttribute("page", page);
		model.addAttribute("page2", page2);
		model.addAttribute("parking", ps);
		return "datacenter/parking";
	}

	// ��ӳ�λ
	@RequestMapping(value = "/parking/insert", method = RequestMethod.POST)
	public String insert(ParkingSpace ps) {
		parkingSpaceService.insertSelective(ps);
		return "redirect:/parking/all";
	}

	// ���³�λ
	@RequestMapping(value = "/parking/update", method = RequestMethod.POST)
	public String update(ParkingSpace ps) {
		parkingSpaceService.updateByPrimaryKeySelective(ps);
		return "redirect:/parking/all";
	}

	// ���ݳ�λid��ѯ��λ��Ϣ
	@RemoteMethod
	public ParkingSpace selectps(int parkid) {
		ParkingSpace ps = parkingSpaceService.selectByPrimaryKey(parkid);
		return ps;
	}

	// ɾ����λ
	@RemoteMethod
	public int delete_parkid(int parkid) {
		int i=0;
		TransactionStatus status=txHandle();
		try{
			i=parkingSpaceService.deleteByPrimaryKey(parkid);
			txManager.commit(status);
		}catch(Exception e){
			txManager.rollback(status);
			i=0;
		}
		return i;
	}

	// ����ɾ����λ
	@RemoteMethod
	public int batchDeletePark(int[] parkitem) {
		int i = 0;
		TransactionStatus status=txHandle();
		try{
			for (int id : parkitem) {
				i += parkingSpaceService.deleteByPrimaryKey(id);
			}
			txManager.commit(status);
		}catch(Exception e){
			txManager.rollback(status);
			i=0;
		}
		return i;
	}

	// ���복λ
	@RequestMapping(value = "/importParking", method = RequestMethod.POST)
	public String importParking(HttpServletRequest request, @RequestParam(value = "excelFile") MultipartFile excelFile)
			throws Exception {
		MultipartRequest multipartRequest = (MultipartRequest) request;
		MultipartFile file = multipartRequest.getFile("excelFile");
		Integer disid = Integer.parseInt(request.getParameter("disid"));
		System.out.println("disid:" + disid);
		InputStream in = file.getInputStream();
		parkingSpaceService.importExcelInfo(in, file, disid);
		in.close();
		return "redirect:/parking/all";
	}

	/****************************** ҵ�� ***************************************/
	@RequestMapping("/yezhu/all")
	public String showOwners(HttpServletRequest request,Owners owners, Model model) {
		String pageNum = request.getParameter("pageNum");
		String pageSize = request.getParameter("pageSize");
		String status=request.getParameter("status");
		int st = 2;
		if (status == null || status.equals("")) {
			owners.setStatus(st);
		}else{
			owners.setStatus(Integer.parseInt(status));
		}
		System.out.println("-------------"+owners.getStatus());
		PageHelper.startPage(getPageNum(pageNum), getPageSize(pageSize));
		List<Owners> list = ownersService.selectAll(owners);
		int[] l = { 6, 8, 10, 12 };
		PageInfo page = new PageInfo(list);
		page.setPageNum(getPageNum(pageNum));
		page.setPageSize(getPageSize(pageSize));
		thisEndSizeNum(pageNum, pageSize);
		PageInfo2 page2 = new PageInfo2(page, page.getPageNum());
		page2.setSelectnum(l);
		page2.setSize(page.getPageSize());
		model.addAttribute("page", page);
		model.addAttribute("page2", page2);
		model.addAttribute("owner", owners);
		if (owners.getStatus().equals(0)){
			return "datacenter/zhuhu_2";
		}else if (owners.getStatus().equals(1)){
			return "datacenter/zhuhu_3";
		}else if (owners.getStatus().equals(3)){
			return "datacenter/zhuhu_4";
		}
		return "datacenter/zhuhu_1";
	}

	// ����ס��
	@RequestMapping(value = "/importOwners", method = RequestMethod.POST)
	public String importOwners(HttpServletRequest request, @RequestParam(value = "excelFile") MultipartFile excelFile)
			throws Exception {
		MultipartRequest multipartRequest = (MultipartRequest) request;
		MultipartFile file = multipartRequest.getFile("excelFile");
		Integer disid = Integer.parseInt(request.getParameter("disid"));
		Integer hlid = Integer.parseInt(request.getParameter("hlid"));
		Integer unitid = Integer.parseInt(request.getParameter("unitid"));
		InputStream in = file.getInputStream();
		ownersService.importExcelInfo(in, file, disid, hlid, unitid);
		in.close();
		return "redirect:yezhu/all";
	}

	// ���ס��
	@RequestMapping(value = "/yezhu/insert", method = RequestMethod.POST)
	public String insert(HttpServletRequest request, Owners owner, MultipartFile input_file, MultipartFile input_file1)
			throws Exception {
		if (!input_file.isEmpty()) {
			owner.setOphoto(upload(request, input_file));
		}
		if (!input_file1.isEmpty()) {
			owner.setCardphoto(upload(request, input_file1));
		}
		owner.setMdate(owner.getDate());
		ownersService.insertSelective(owner);
		Binding bind=new Binding();
		bind.setOwnerId(owner.getOid());
		bind.setHouseId(owner.getFanid());
		if(owner.getCardid()==null||owner.getCardid().equals("")){
			bind.setOwnercard(1);
		}else{
			bind.setOwnercard(owner.getCardid());
		}
		bindingService.insertSelective(bind);
		return "redirect:all?status=0";
	}

	// �༭ס����Ϣ
	@RemoteMethod
	public Owners editowners(int oid) {
		return ownersService.selectByPrimaryKey(oid);
	}

	// �޸�ס����Ϣ
	@RequestMapping(value = "/yezhu/update", method = RequestMethod.POST)
	public String updateOwners(HttpServletRequest request, Owners owner, MultipartFile input_file2,
			MultipartFile input_file3) throws Exception {
		if (!input_file2.isEmpty()) {
			owner.setOphoto(upload(request, input_file2));
		}
		if (!input_file3.isEmpty()) {
			owner.setCardphoto(upload(request, input_file3));
		}
		ownersService.updateByPrimaryKeySelective(owner);
		return "redirect:all";
	}

	// ��ѯȫ��С��
	@RemoteMethod
	public List<District> selectdisall() {
		return ownersService.selectdisall();
	}

	// ����С��id��ѯȫ��ҵ����Ϣ
	@RemoteMethod
	public List<Owners> selectallowners(int disid) {
		List<Owners> list = ownersService.selectAllOwners(disid);
		return list;
	}

	// �޸�ҵ��״̬
	@RemoteMethod
	public int updateyzstatus(int oid, int status) {
		Owners os = new Owners();
		os.setOid(oid);
		os.setStatus(status);
		return ownersService.update_yzstatus(os);
	}

	// ����Ǩ��
	@RemoteMethod
	public int batchMoveOut(int[] item) {
		int i = 0;
		Owners os = new Owners();
		os.setStatus(3);
		for (int id : item) {
			os.setOid(id);
			i += ownersService.update_yzstatus(os);
		}
		return i;
	}

	// ����ɾ��ҵ��
	@RemoteMethod
	public int batchDeleteOwners(int[] item) {
		int i = 0;
		TransactionStatus status=txHandle();
		try{
			for (int id : item) {
				i += ownersService.deleteByPrimaryKey(id);
			}
			txManager.commit(status);
		}catch(Exception e){
			txManager.rollback(status);
			i=0;
		}
		return i;
	}

	// ��ѯ�ֻ������Ƿ��Ѵ���
	@RemoteMethod
	public int selectOwnersphone(String ophone) {
		return ownersService.selectophone(ophone);
	}

	/*************************** ���� **********************************/
	@RequestMapping(value = "/house/all")
	public String showHouseFan(HttpServletRequest request,HouseFan hf, Model model) {
		String pageNum = request.getParameter("pageNum");
		String pageSize = request.getParameter("pageSize");
		PageHelper.startPage(getPageNum(pageNum), getPageSize(pageSize));
		List<HouseFan> list = houseFanService.selectAll(hf);
		int[] l = { 6, 8, 10, 12 };
		PageInfo page = new PageInfo(list);
		page.setPageNum(getPageNum(pageNum));
		page.setPageSize(getPageSize(pageSize));
		thisEndSizeNum(pageNum, pageSize);
		PageInfo2 page2 = new PageInfo2(page, page.getPageNum());
		page2.setSelectnum(l);
		page2.setSize(page.getPageSize());
		model.addAttribute("page", page);
		model.addAttribute("page2", page2);
		model.addAttribute("housefan", hf);
		return "datacenter/house";
	}

	// ��ӷ���
	@RequestMapping(value = "/house/insert")
	public String insert(HttpServletRequest request, HouseFan hf, @RequestParam("input_file") MultipartFile input_file)
			throws Exception {
		if (!input_file.isEmpty()) {
			String name = upload(request, input_file);
			hf.setFujian(name);
		}
		//����Ӧ�ĵ�Ԫ���������
		unitService.addfcount(hf.getUnitid());
		if (hf.getGarea() != null && hf.getGarea()!=0) {
			if (hf.getLouceng() < 7) {// ���ұ�׼�涨��7�����¹�̯���ռ�������7%-12%
				hf.setGarea(hf.getZarea() * 0.07);
			} else if (hf.getLouceng() >= 7 && hf.getLouceng() <= 12) {// 7-12��ȥ10%-16%
				hf.setGarea(hf.getZarea() * 0.1);
			} // ��̯����߲�¥�Ľ������˵����ⰲȫͨ��Ҳռ�úܶ�ռ䣬���С��ܵ���������ǿ�羮�������羮�ȣ���๫���豸����ռ�úܴ�ռ�
			else if (hf.getLouceng() > 12 && hf.getLouceng() < 33) {
				if (hf.getLouceng() > 12 && hf.getLouceng() < 25) {
					hf.setGarea(hf.getZarea() * 0.14);
				} else {
					hf.setGarea(hf.getZarea() * 0.15);
				}
			}
			hf.setTarea(hf.getZarea() - hf.getGarea());
		}
		houseFanService.insertSelective(hf);
		return "redirect:all";
	}

	// �޸ķ���
	@RequestMapping(value = "/house/update", method = RequestMethod.POST)
	public String update(HttpServletRequest request, HouseFan hf, MultipartFile input_file) throws Exception {
		if (!input_file.isEmpty()) {
			String name = upload(request, input_file);
			hf.setFujian(name);
		}
		houseFanService.updateByPrimaryKeySelective(hf);
		return "redirect:all";
	}

	// ����¥��id��ѯ����
	@RemoteMethod
	public HouseFan selecthf(int fanid) {
		return houseFanService.selectByPrimaryKey(fanid);
	}

	// ɾ������
	@RemoteMethod
	public int delete_housefan(int fanid) {
		int i=0;
		TransactionStatus status=txHandle();
		try{
			i=houseFanService.deleteByPrimaryKey(fanid);
			txManager.commit(status);
		}catch(Exception e){
			txManager.rollback(status);
			i=0;
		}
		return i;
	}

	// ����ɾ������
	@RemoteMethod
	public int batchDeletehf(int[] hfitem) {
		int i = 0;
		TransactionStatus status=txHandle();
		try{
			for(int id : hfitem) {
				i += houseFanService.deleteByPrimaryKey(id);
			}
			txManager.commit(status);
		}catch(Exception e){
			txManager.rollback(status);
			i=0;
		}
		return i;
	}
	
	//���뷿��
	@RequestMapping(value="/importHouse")
	public String importHouse(HttpServletRequest request,MultipartFile excelFile)throws Exception{
		Integer disid=Integer.parseInt(request.getParameter("disid"));
		Integer hlid=Integer.parseInt(request.getParameter("hlid"));
		Integer unitid=Integer.parseInt(request.getParameter("unitid"));
		InputStream in=excelFile.getInputStream();
		houseFanService.importExcelInfo(in, excelFile, disid, hlid, unitid);
		in.close();
		return "redirect:/house/all";
	}

	/****************************** ��Ԫ ************************************/
	@RequestMapping("/unit/all")
	public String showUnit(HttpServletRequest request, Unit u, Model model) {
		String pageNum = request.getParameter("pageNum");
		String pageSize = request.getParameter("pageSize");
		PageHelper.startPage(getPageNum(pageNum), getPageSize(pageSize));
		List<Unit> list = unitService.selectUnit(u);
		int[] l = { 6, 8, 10, 12 };
		PageInfo page = new PageInfo(list);
		page.setPageNum(getPageNum(pageNum));
		page.setPageSize(getPageSize(pageSize));
		thisEndSizeNum(pageNum, pageSize);
		PageInfo2 page2 = new PageInfo2(page, page.getPageNum());// ��ҳ������
		page2.setSelectnum(l);
		page2.setSize(page.getPageSize());// �����ڵ�ҳ�����ȥ
		model.addAttribute("page", page);
		model.addAttribute("page2", page2);
		model.addAttribute("unit", u);
		return "datacenter/danyuan";
	}

	@RequestMapping(value = "/unit/update", method = RequestMethod.POST)
	public String update(Unit unit) {
		unitService.updateByPrimaryKeySelective(unit);
		return "forward:/unit/all";
	}

	@RequestMapping(value = "/unit/insert", method = RequestMethod.POST)
	public String insert(Unit unit) {
		int i = unitService.insertSelective(unit);
		if (i == 1) {
			unitService.addunits(unit);
		}
		return "forward:/unit/all";
	}

	@RemoteMethod
	public int delete_unit(Unit unit) {
		int i = unitService.deleteByPrimaryKey(unit.getUnitid());
		i += unitService.subunits(unit);
		return i;
	}

	/************************************ ¥�� *****************************************/
	@RequestMapping(value = "/louyu/all")
	public String showHouseLou(HttpServletRequest request,HouseLou hl, Model model) {
		String pageNum = request.getParameter("pageNum");
		String pageSize = request.getParameter("pageSize");
		PageHelper.startPage(getPageNum(pageNum), getPageSize(pageSize));
		List<HouseLou> list = houseLouService.selectAll(hl);
		int[] l = { 4, 6, 8, 10 };
		PageInfo page = new PageInfo(list);
		page.setPageNum(getPageNum(pageNum));
		page.setPageSize(getPageSize(pageSize));
		thisEndSizeNum(pageNum, pageSize);
		PageInfo2 page2 = new PageInfo2(page, page.getPageNum());
		page2.setSelectnum(l);
		page2.setSize(page.getPageSize());
		model.addAttribute("page", page);
		model.addAttribute("page2", page2);
		model.addAttribute("houselou", hl);
		return "datacenter/louyu";
	}

	// ���¥��
	@RequestMapping(value = "/louyu/insert", method = RequestMethod.POST)
	public String insert(HouseLou hl) {
		houseLouService.insertSelective(hl);
		Unit u = new Unit();
		u.setDisid(hl.getDisid());
		u.setHlid(hl.getHlid());
		for (int i = 1; i <= hl.getUnits(); i++) {
			u.setUnitname("��Ԫ" + i);
			houseLouService.insert_unit(u);
		}
		return "redirect:all";
	}

	// �޸�¥��
	@RequestMapping(value = "/louyu/update", method = RequestMethod.POST)
	public String update(HouseLou hl) {
		houseLouService.updateByPrimaryKeySelective(hl);
		return "redirect:all";
	}

	@RemoteMethod//�鿴�Ƿ��Ѵ��ڸ��շѱ�׼
	public int selectbcharg(Ban_chargs bc){
		return ban_chargsService.selectisBc(bc);
	}
	@RemoteMethod//ɾ���󶨵��շѱ�׼
	public int delbcharg(int type,int otherid,int bcid){
		if(type==1){//�޸Ķ�Ӧ�շ���Ŀ�ĸ���
			houseFanService.updateFanChargJnum(otherid);
		}else if(type==2){
			parkingSpaceService.updateParkChargJnum(otherid);
		}else if(type==3){
			vehicleService.updateVehicChargJnum(otherid);
		}
		return ban_chargsService.deleteByPrimaryKey(bcid);
	}
	@RemoteMethod
	public Ban_chargs editcharg(int bcid){
		return ban_chargsService.selectByPrimaryKey(bcid);
	}
	
	// ��ѯС��״̬Ϊ0��С��
	@RemoteMethod
	public List<District> selectdis(int status) {
		List<District> dls = houseLouService.selectByDis(status);
		return dls;
	}

	// ����¥��id��ѯ¥��(�༭¥��)
	@RemoteMethod
	public HouseLou edithouselou(int hlid) {
		return houseLouService.selectByPrimaryKey(hlid);
	}

	// ����С��id��ѯ¥��
	@RemoteMethod
	public List<HouseLou> selectly(int disid) {
		List<HouseLou> hl = houseLouService.selectly(disid);
		return hl;
	}

	// ����С��id��¥��id��ѯ��Ԫ
	@RemoteMethod
	public List<Unit> selectut(Unit ut) {
		List<Unit> u = houseLouService.selectut(ut);
		return u;
	}

	// ����С��id��¥��id��ѯ����
	@RemoteMethod
	public List<HouseFan> selecthf(HouseFan hf) {
		List<HouseFan> h = houseLouService.selecthf(hf);
		return h;
	}

	// ����¥��id��ѯ���ݱ��Ƿ�������
	@RemoteMethod
	public int delete_selecthouse(int hlid) {
		int i = houseLouService.delete_selecthouse(hlid);
		return i;
	}

	// ɾ��¥���ɾ����Ԫ����ɾ��¥��
	@RemoteMethod
	public int delete_houselou(int hlid) {
		int i = houseLouService.delete_unit(hlid);
		i += houseLouService.deleteByPrimaryKey(hlid);
		return i;
	}

	// ��ѯ¥�������Ƿ��Ѵ���
	@RemoteMethod
	public int selectHLname(String floorname) {
		return houseLouService.selecthfname(floorname);
	}

	/*********************************** С�� ************************************/

	@RequestMapping("/xiaoqu/all")
	public String showDistrict(HttpServletRequest request, District dis, Model model) {
		String pageNum = request.getParameter("pageNum");
		String pageSize = request.getParameter("pageSize");
		PageHelper.startPage(getPageNum(pageNum), getPageSize(pageSize));
		List<District> list = districtService.selectAll(dis);
		int[] l = { 4, 6, 8, 10 };
		PageInfo page = new PageInfo(list);
		page.setPageNum(getPageNum(pageNum));
		page.setPageSize(getPageSize(pageSize));
		thisEndSizeNum(pageNum, pageSize);
		PageInfo2 page2 = new PageInfo2(page, page.getPageNum());// ��ҳ������
		page2.setSelectnum(l);
		page2.setSize(page.getPageSize());// �����ڵ�ҳ�����ȥ
		model.addAttribute("page", page);
		model.addAttribute("page2", page2);
		model.addAttribute("disname", dis.getDname());
		return "datacenter/xiaoqu";
	}

	// �޸�С��״̬
	@RemoteMethod
	public int updata_status(int disid, int status) {
		District di = new District();
		di.setDisid(disid);
		di.setStatus(status);
		return districtService.update_status(di);
	}

	// �༭С��
	@RemoteMethod
	public District editDis(int disid) {
		return districtService.selectByPrimaryKey(disid);
	}

	// ��ѯС�������Ƿ��Ѵ���
	@RemoteMethod
	public int selectDname(String dname) {
		return districtService.selectdname(dname);
	}

	// ���С��
	@RequestMapping(value = "/xiaoqu/insert", method = RequestMethod.POST)
	public String insert(HttpServletRequest request, District di, MultipartFile input_file) throws Exception {
		if (!input_file.isEmpty()) {
			String name = upload(request, input_file);
			di.setLogo(name);
		}
		districtService.insertSelective(di);
		return "redirect:all";
	}

	// �޸�С��
	@RequestMapping(value = "/xiaoqu/update", method = RequestMethod.POST)
	public String update(HttpServletRequest request, District di, MultipartFile input_file) throws Exception {
		if (!input_file.isEmpty()) {
			String name = upload(request, input_file);
			di.setLogo(name);
		}
		districtService.updateByPrimaryKeySelective(di);
		return "redirect:all";
	}

	// ����ͼƬ
	public String upload(HttpServletRequest request, MultipartFile input_file) throws Exception {
		String name = input_file.getOriginalFilename();// ��ȡͼƬ����
		String url = "E:/Y2��/eclipseEE/JavaEE/wyht/src/main/webapp/img/";//request.getSession().getServletContext().getRealPath("/img/");// ����·��
		File file = new File(url);
		if (!file.exists()) {// ���Ŀ¼������
			file.mkdirs();// ����Ŀ¼
		}
		input_file.transferTo(new File(url + name));// �����ļ�
		
		return name;// ����ͼƬ����
	}

	@RemoteMethod
	public List<District> selectAll() {
		List<District> list = districtService.selectYiAll();
		return list;
	}

	@RemoteMethod
	public List<HouseLou> selectloudid(int disid) {
		List<HouseLou> list = houseLouService.selectDisid(disid);
		return list;
	}

	@RemoteMethod
	public List<HouseFan> selectfanid(int foolid) {
		List<HouseFan> list = houseFanService.selectfanflid(foolid);
		return list;
	}

	@RemoteMethod
	public List<Owners> selectOwner(int disid) {
		List<Owners> list = ownersService.selectDisid(disid);
		return list;
	}

	// ��Ϣ�ؼ��������鿴�󶨵�һЩֵ�뷽��
	public List<Toll> bandingjion(List<Toll> list) {
		for (Toll toll : list) {
			if (toll.getFanId() != null && !toll.getFanId().equals("")) {
				toll.setHousefan(houseFanService.selectByPrimaryKey(toll.getFanId()));
			} else if (toll.getParkId() != null && !toll.getParkId().equals("")) {
				toll.setParkingspace(parkingSpaceService.selectByPrimaryKey(toll.getParkId()));
			} else if (toll.getVehicleId() != null && !toll.getVehicleId().equals("")) {
				toll.setVehiclemanager(vehicleService.selectByPrimaryKey(toll.getVehicleId()));
			}
			if (toll.getOid() != null) {
				if (toll.getFanId() != null) {
					toll.setOwnerlist(ownersService.selectFanid(toll.getFanId()));
				} else {
					List<Owners> owerlist = new ArrayList<Owners>();
					owerlist.add(ownersService.selectOwerid(toll.getOid()));
					toll.setOwnerlist(owerlist);
				}
			}
			if (toll.getTemId() != null) {
				Temporary temporary = temporaryService.selectByPrimaryKey(toll.getTemId());
				if (temporary.getOwerId() != null && !temporary.getOwerId().equals("")) {
					temporary.setOwners(ownersService.selectByPrimaryKey(temporary.getOwerId()));
				}
				toll.setTemporary(temporary);
			}
		}
		return list;
	}

	// ȫ�ֱ��������ڱ���ҳ������ʱ���ܶ�����һҳ
	int endPageNum = 0;
	int endPageSize = 0;

	public int getPageNum(String pageNum) {
		int num = 1;
		if (pageNum != null && !pageNum.equals("")) {
			try {
				num = Integer.parseInt(pageNum);
			} catch (Exception e) {
				num = endPageNum;
			}
		}
		return num;
	}

	public int getPageSize(String pageSize) {
		int size = 6;
		if (pageSize != null && !pageSize.equals("")) {
			try {
				size = Integer.parseInt(pageSize);
			} catch (Exception e) {
				size = endPageSize;
			}
		}
		return size;
	}

	public void thisEndSizeNum(String num, String size) {// ����ǰҳ���������ҳ��
		endPageNum = getPageNum(num);
		endPageSize = getPageSize(size);
	}
}
