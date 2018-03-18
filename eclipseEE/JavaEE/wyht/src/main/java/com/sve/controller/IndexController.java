package com.sve.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.apache.shiro.SecurityUtils;
import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sve.auto.model.Menu;
import com.sve.auto.model.User;
import com.sve.auto.service.MenuService;
import com.sve.datacenter.model.HouseFan;
import com.sve.datacenter.model.Owners;
import com.sve.datacenter.model.Vehicle;
import com.sve.datacenter.service.DistrictService;
import com.sve.datacenter.service.HouseFanService;
import com.sve.datacenter.service.HouseLouService;
import com.sve.datacenter.service.OwnersService;
import com.sve.datacenter.service.ParkingSpaceService;
import com.sve.datacenter.service.VehicleService;
import com.sve.lifeservice.model.Announce;
import com.sve.lifeservice.service.AnnounceService;
import com.sve.lifeservice.service.StoragesService;
import com.sve.staff.service.EmployeeService;
import com.sve.toll.model.IndexModel;
import com.sve.toll.model.Toll;
import com.sve.toll.service.TollService;
import com.sve.toll.service.UnpaidbillsService;

@Controller
@RequestMapping("/index")
@RemoteProxy(name="indexController")
public class IndexController {
	@Autowired
	private DistrictService districtService;
	@Autowired
	private HouseFanService housefanService;
	@Autowired
	private HouseLouService houselouService;
	@Autowired
	private TollService tollService;
	@Autowired
	private ParkingSpaceService parkingspaceService;
	@Autowired
	private VehicleService vehiclemanagerService;
	@Autowired
	private OwnersService ownersService;
	@Autowired
	private UnpaidbillsService unpaidbillsService;
	@Autowired
	private MenuService menuService;
	@Autowired
	private StoragesService storagesService;
	@Autowired
	private AnnounceService announceService;
	@Autowired
	private EmployeeService employeeService;
	
	
	@RequestMapping("/index")
	public String index(Model model,HttpServletRequest request){
		Toll qtoll=tollService.tollQFSumAndCount();//查询欠费金额和未缴帐单的数量
		Toll stoll=tollService.tollSRSumAndCount();//查询收入金额和以缴的数量
		Toll ttoll=tollService.tollTFSumAndCount();//查询退费的金额
		IndexModel indexModel=new IndexModel();
		indexModel.setYjtollcount(stoll.getCount());
		indexModel.setWjtollcount(qtoll.getCount());
		indexModel.setVehiccount(vehiclemanagerService.carCount());
		indexModel.setTotalsrcount(stoll.getSubtotal()-ttoll.getSubtotal());
		indexModel.setTotalqfcount(qtoll.getSubtotal());
		indexModel.setStoragecount(storagesService.storagesCount());
		indexModel.setPrakcount(parkingspaceService.parkCount());
		indexModel.setOwnercount(ownersService.yezhuCount());
		indexModel.setFloorcount(houselouService.louyuCount());
		indexModel.setFancount(housefanService.houseCount());
		indexModel.setEmpcount(employeeService.employeeCount());
		indexModel.setDisyjcount(districtService.disCount());
		indexModel.setAnncount(announceService.announceCount());
		List<Menu> menulist=menuService.selectMenuPerm(SecurityUtils.getSubject().getPrincipal().toString());
		request.getSession().setAttribute("menulist", menulist);
		model.addAttribute("index", indexModel);
		//查询最新发布的5条公告
//		List<Announce> as=announceService.();
		return "index.wy";
	}
	
	@RemoteMethod
	public IndexModel quickfind(@RequestParam("str")String str){
		List<Owners> os=ownersService.quickFind(str);
		List<HouseFan> hfs=housefanService.quickFind(str);
		List<Vehicle> vs=vehiclemanagerService.quickFind(str);
		System.out.println("---------"+hfs.size());
		for(HouseFan h:hfs){
			System.out.println(h.getHnum());
		}
		IndexModel im=new IndexModel();
		if(os!=null){
			im.setOs(os);
		}if(hfs!=null){
			im.setHfs(hfs);
		}if(vs!=null){
			im.setVs(vs);
		}
		return im;
	}
	
}
