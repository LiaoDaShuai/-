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
	private DistrictService districtService;// 小区
	@Autowired
	private HouseLouService houseLouService;// 楼宇
	@Autowired
	private HouseFanService houseFanService;// 房屋
	@Autowired
	private UnitService unitService;// 单元
	@Autowired
	private OwnersService ownersService;// 业主
	@Autowired
	private ParkingSpaceService parkingSpaceService;// 车位
	@Autowired
	private VehicleService vehicleService;// 车辆
	@Autowired
	private BindingService bindingService;// 绑定住户
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
	private DataSourceTransactionManager txManager;//注入事务管理对象,获得数据源
	
	//获得事务状态
	public TransactionStatus txHandle(){
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();//事务属性定义
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRES_NEW);//开启新事务
		return txManager.getTransaction(def);//返回事务状态
	}
	
	// 绑定住户
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

	// 查看详情
	@RequestMapping("/fandetail/{type}/{id}")
	public String Selectdetail(@PathVariable("type") String type, @PathVariable("id") int id, Model model) {
		Binding binding = new Binding();
		List<Toll> tolllist = null;
		List<Binding> owners = null;// 用来获取owerid
		List<Binding> houses = new ArrayList<Binding>();
		List<Binding> parks = new ArrayList<Binding>();
		List<Binding> vehics = new ArrayList<Binding>();
		List<Ban_chargs> bclist = null;
		Ban_chargs bc = new Ban_chargs();
		if (type.equals("fwid")) {//判断是查看哪个详情，房屋
			HouseFan housefan = houseFanService.selectByPrimaryKey(id);
			binding.setHouseId(id);
			bc.setFan_id(id);
			owners = bindingService.selectOwnerid(binding);//获取业主id
			tolllist = tollService.selectTollfanid(id);// 添加账单信息
			bclist = ban_chargsService.selectBcPriceid(bc);//获取所具有收费标准
			model.addAttribute("housefan", housefan);//现将房屋详情传过去
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
		} else if (type.equals("owid")) {//如果单单是业主的话
			Owners owner = ownersService.selectByPrimaryKey(id);
			model.addAttribute("owner", owner);//查看业主详情
			
			houses.addAll(bindingService.selectOwnerFanAllid(id));
			parks.addAll(bindingService.selectOwnerParkAllid(id));
			vehics.addAll(bindingService.selectOwnerVehicAllid(id));
			tolllist=tollService.selectTollowerid(owner.getOid());
		}
		if (owners != null) {//将相关的房屋、车位、车辆先录入binding
			for (Binding bin : owners) {
				houses.addAll(bindingService.selectOwnerFanAllid(bin.getOwnerId()));
				parks.addAll(bindingService.selectOwnerParkAllid(bin.getOwnerId()));
				vehics.addAll(bindingService.selectOwnerVehicAllid(bin.getOwnerId()));
			}
		}
		if (tolllist != null) {//绑定账单
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

	// 语法0/1代表一，每月1号凌晨1点执行一次：0 0 1 1 * ?,cron表达式
//	@Scheduled(cron = "0/10 * * * * ?")用于测试
	@Scheduled(cron = "0 0 1 1 * ?")
	public void TaskToll() throws ParseException {
		List<Ban_chargs> bclist = ban_chargsService.selectBcAll();
		Date date = new Date();// 获取当前时间
		for (Ban_chargs bc : bclist) {
			// 计算出若刚好满足周期，则进行生成
			if (endMonth(bc.getStartdate(), date) % bc.getChargs().getPriceweek() == 0) {
				Toll toll = jifei(bc);
				Binding bind = new Binding();
				if (bc.getFan_id() != null) {// 若是
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

	// 用于计算费用，根据收费类型，单价*数量、固定金额、公式等,计算出总费用后放进toll
	public Toll jifei(Ban_chargs bc) {
		Toll toll = new Toll();
		if (bc.getChargs().getShouid() == 0) {
			Long price = bc.getChargs().getPricing();
			int unit = bc.getChargs().getPriceunit();
			HouseFan house = houseFanService.selectByPrimaryKey(bc.getFan_id());
			if (unit == 1) {
				//车位会进来，有问题。。。。
				toll.setSubtotal(house.getZarea() * price);// 建筑面积
				toll.setCount(Integer.parseInt(house.getZarea().toString()));// 建筑面积
			} else if (unit == 2) {
				toll.setSubtotal(house.getGarea() * price);// 套内面积
				toll.setCount(Integer.parseInt(house.getGarea().toString()));
			} else if (unit == 3) {
				toll.setSubtotal(house.getTarea() * price);// 公摊面积
				toll.setCount(Integer.parseInt(house.getTarea().toString()));
			}
			toll.setPriceing(price);
		} else if (bc.getChargs().getShouid() == 1) {
			toll.setSubtotal(bc.getPrice());// 每户单独录入
		} else if (bc.getChargs().getShouid() == 2) {
			toll.setSubtotal(bc.getChargs().getFixedprice());// 固定金额
		} else if (bc.getChargs().getShouid() == 3) {
			toll.setSubtotal(Tformula(bc));
		}
		return toll;
	}

	// 根据公式计算总金额
	public double Tformula(Ban_chargs bc) {
		Formula formula = formulaService.findid(bc.getChargs().getFormula_id());
		long subtotal = 0;
		HouseFan housefan = null;
		HouseLou houselou = null;
		if (bc.getFan_id() != null) {// 若fan_id不等于null则代表是属于房屋公式的，进行赋值
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

	// 算出相差月份
	public int endMonth(Date sdate, Date edate) throws ParseException {
		Calendar startdate = Calendar.getInstance();
		Calendar enddate = Calendar.getInstance();
		startdate.setTime(sdate);
		enddate.setTime(edate);
		int endyear = enddate.get(Calendar.YEAR) - startdate.get(Calendar.YEAR);
		int result = endyear * 12 + enddate.get(Calendar.MONTH) - startdate.get(Calendar.MONTH);
		return result == 0 ? 1 : Math.abs(result);
	}

	/****************************** 车辆 ***************************************/

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

	// 添加车辆
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

	// 编辑车辆
	@RequestMapping(value = "/car/edit", method = RequestMethod.POST)
	public @ResponseBody List<Vehicle> edit(int vehicid) {
		Vehicle v = vehicleService.selectByPrimaryKey(vehicid);
		List<Vehicle> list = new ArrayList<Vehicle>();
		list.add(v);
		return list;
	}

	// 修改车辆信息
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

	// 根据车辆id查询车辆
	@RemoteMethod
	public Vehicle editVehicle(int vehicid){
		Vehicle ve=vehicleService.selectByPrimaryKey(vehicid);
		return ve;
	}

	// 删除车辆
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

	// 批量删除车辆
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

	// 导入车辆
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
	/****************************** 车位 ***************************************/

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
		PageInfo2 page2 = new PageInfo2(page, page.getPageNum());// 分页导航条
		page2.setSelectnum(l);
		page2.setSize(page.getPageSize());// 将当期的页数存进去
		model.addAttribute("page", page);
		model.addAttribute("page2", page2);
		model.addAttribute("parking", ps);
		return "datacenter/parking";
	}

	// 添加车位
	@RequestMapping(value = "/parking/insert", method = RequestMethod.POST)
	public String insert(ParkingSpace ps) {
		parkingSpaceService.insertSelective(ps);
		return "redirect:/parking/all";
	}

	// 更新车位
	@RequestMapping(value = "/parking/update", method = RequestMethod.POST)
	public String update(ParkingSpace ps) {
		parkingSpaceService.updateByPrimaryKeySelective(ps);
		return "redirect:/parking/all";
	}

	// 根据车位id查询车位信息
	@RemoteMethod
	public ParkingSpace selectps(int parkid) {
		ParkingSpace ps = parkingSpaceService.selectByPrimaryKey(parkid);
		return ps;
	}

	// 删除车位
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

	// 批量删除车位
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

	// 导入车位
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

	/****************************** 业主 ***************************************/
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

	// 导入住户
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

	// 添加住户
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

	// 编辑住户信息
	@RemoteMethod
	public Owners editowners(int oid) {
		return ownersService.selectByPrimaryKey(oid);
	}

	// 修改住户信息
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

	// 查询全部小区
	@RemoteMethod
	public List<District> selectdisall() {
		return ownersService.selectdisall();
	}

	// 根据小区id查询全部业主信息
	@RemoteMethod
	public List<Owners> selectallowners(int disid) {
		List<Owners> list = ownersService.selectAllOwners(disid);
		return list;
	}

	// 修改业主状态
	@RemoteMethod
	public int updateyzstatus(int oid, int status) {
		Owners os = new Owners();
		os.setOid(oid);
		os.setStatus(status);
		return ownersService.update_yzstatus(os);
	}

	// 批量迁出
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

	// 批量删除业主
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

	// 查询手机号码是否已存在
	@RemoteMethod
	public int selectOwnersphone(String ophone) {
		return ownersService.selectophone(ophone);
	}

	/*************************** 房屋 **********************************/
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

	// 添加房屋
	@RequestMapping(value = "/house/insert")
	public String insert(HttpServletRequest request, HouseFan hf, @RequestParam("input_file") MultipartFile input_file)
			throws Exception {
		if (!input_file.isEmpty()) {
			String name = upload(request, input_file);
			hf.setFujian(name);
		}
		//将对应的单元房屋书加上
		unitService.addfcount(hf.getUnitid());
		if (hf.getGarea() != null && hf.getGarea()!=0) {
			if (hf.getLouceng() < 7) {// 国家标准规定，7层以下公摊面积占建筑面积7%-12%
				hf.setGarea(hf.getZarea() * 0.07);
			} else if (hf.getLouceng() >= 7 && hf.getLouceng() <= 12) {// 7-12层去10%-16%
				hf.setGarea(hf.getZarea() * 0.1);
			} // 公摊数因高层楼的建筑除了电梯外安全通道也占用很多空间，还有“管道井”，“强电井”，弱电井等，许多公用设备都会占用很大空间
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

	// 修改房屋
	@RequestMapping(value = "/house/update", method = RequestMethod.POST)
	public String update(HttpServletRequest request, HouseFan hf, MultipartFile input_file) throws Exception {
		if (!input_file.isEmpty()) {
			String name = upload(request, input_file);
			hf.setFujian(name);
		}
		houseFanService.updateByPrimaryKeySelective(hf);
		return "redirect:all";
	}

	// 根据楼宇id查询房屋
	@RemoteMethod
	public HouseFan selecthf(int fanid) {
		return houseFanService.selectByPrimaryKey(fanid);
	}

	// 删除房屋
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

	// 批量删除房屋
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
	
	//导入房屋
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

	/****************************** 单元 ************************************/
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
		PageInfo2 page2 = new PageInfo2(page, page.getPageNum());// 分页导航条
		page2.setSelectnum(l);
		page2.setSize(page.getPageSize());// 将当期的页数存进去
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

	/************************************ 楼宇 *****************************************/
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

	// 添加楼宇
	@RequestMapping(value = "/louyu/insert", method = RequestMethod.POST)
	public String insert(HouseLou hl) {
		houseLouService.insertSelective(hl);
		Unit u = new Unit();
		u.setDisid(hl.getDisid());
		u.setHlid(hl.getHlid());
		for (int i = 1; i <= hl.getUnits(); i++) {
			u.setUnitname("单元" + i);
			houseLouService.insert_unit(u);
		}
		return "redirect:all";
	}

	// 修改楼宇
	@RequestMapping(value = "/louyu/update", method = RequestMethod.POST)
	public String update(HouseLou hl) {
		houseLouService.updateByPrimaryKeySelective(hl);
		return "redirect:all";
	}

	@RemoteMethod//查看是否已存在该收费标准
	public int selectbcharg(Ban_chargs bc){
		return ban_chargsService.selectisBc(bc);
	}
	@RemoteMethod//删除绑定的收费标准
	public int delbcharg(int type,int otherid,int bcid){
		if(type==1){//修改对应收费项目的个数
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
	
	// 查询小区状态为0的小区
	@RemoteMethod
	public List<District> selectdis(int status) {
		List<District> dls = houseLouService.selectByDis(status);
		return dls;
	}

	// 根据楼宇id查询楼宇(编辑楼宇)
	@RemoteMethod
	public HouseLou edithouselou(int hlid) {
		return houseLouService.selectByPrimaryKey(hlid);
	}

	// 根据小区id查询楼宇
	@RemoteMethod
	public List<HouseLou> selectly(int disid) {
		List<HouseLou> hl = houseLouService.selectly(disid);
		return hl;
	}

	// 根据小区id和楼宇id查询单元
	@RemoteMethod
	public List<Unit> selectut(Unit ut) {
		List<Unit> u = houseLouService.selectut(ut);
		return u;
	}

	// 根据小区id和楼宇id查询房屋
	@RemoteMethod
	public List<HouseFan> selecthf(HouseFan hf) {
		List<HouseFan> h = houseLouService.selecthf(hf);
		return h;
	}

	// 根据楼宇id查询房屋表是否有数据
	@RemoteMethod
	public int delete_selecthouse(int hlid) {
		int i = houseLouService.delete_selecthouse(hlid);
		return i;
	}

	// 删除楼宇，先删除单元，再删除楼宇
	@RemoteMethod
	public int delete_houselou(int hlid) {
		int i = houseLouService.delete_unit(hlid);
		i += houseLouService.deleteByPrimaryKey(hlid);
		return i;
	}

	// 查询楼宇名称是否已存在
	@RemoteMethod
	public int selectHLname(String floorname) {
		return houseLouService.selecthfname(floorname);
	}

	/*********************************** 小区 ************************************/

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
		PageInfo2 page2 = new PageInfo2(page, page.getPageNum());// 分页导航条
		page2.setSelectnum(l);
		page2.setSize(page.getPageSize());// 将当期的页数存进去
		model.addAttribute("page", page);
		model.addAttribute("page2", page2);
		model.addAttribute("disname", dis.getDname());
		return "datacenter/xiaoqu";
	}

	// 修改小区状态
	@RemoteMethod
	public int updata_status(int disid, int status) {
		District di = new District();
		di.setDisid(disid);
		di.setStatus(status);
		return districtService.update_status(di);
	}

	// 编辑小区
	@RemoteMethod
	public District editDis(int disid) {
		return districtService.selectByPrimaryKey(disid);
	}

	// 查询小区名称是否已存在
	@RemoteMethod
	public int selectDname(String dname) {
		return districtService.selectdname(dname);
	}

	// 添加小区
	@RequestMapping(value = "/xiaoqu/insert", method = RequestMethod.POST)
	public String insert(HttpServletRequest request, District di, MultipartFile input_file) throws Exception {
		if (!input_file.isEmpty()) {
			String name = upload(request, input_file);
			di.setLogo(name);
		}
		districtService.insertSelective(di);
		return "redirect:all";
	}

	// 修改小区
	@RequestMapping(value = "/xiaoqu/update", method = RequestMethod.POST)
	public String update(HttpServletRequest request, District di, MultipartFile input_file) throws Exception {
		if (!input_file.isEmpty()) {
			String name = upload(request, input_file);
			di.setLogo(name);
		}
		districtService.updateByPrimaryKeySelective(di);
		return "redirect:all";
	}

	// 保存图片
	public String upload(HttpServletRequest request, MultipartFile input_file) throws Exception {
		String name = input_file.getOriginalFilename();// 获取图片名称
		String url = "E:/Y2总/eclipseEE/JavaEE/wyht/src/main/webapp/img/";//request.getSession().getServletContext().getRealPath("/img/");// 保存路径
		File file = new File(url);
		if (!file.exists()) {// 如果目录不存在
			file.mkdirs();// 创建目录
		}
		input_file.transferTo(new File(url + name));// 保存文件
		
		return name;// 返回图片名称
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

	// 信息关键方法，查看绑定的一些值与方法
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

	// 全局变量，用于保障页数出错时，能定到上一页
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

	public void thisEndSizeNum(String num, String size) {// 将当前页数覆给最后页数
		endPageNum = getPageNum(num);
		endPageSize = getPageSize(size);
	}
}
