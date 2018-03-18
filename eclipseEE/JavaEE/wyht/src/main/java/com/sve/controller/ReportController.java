package com.sve.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sve.datacenter.model.District;
import com.sve.datacenter.model.HouseFan;
import com.sve.datacenter.model.Owners;
import com.sve.datacenter.model.ParkingSpace;
import com.sve.datacenter.service.DistrictService;
import com.sve.datacenter.service.HouseFanService;
import com.sve.datacenter.service.HouseLouService;
import com.sve.datacenter.service.OwnersService;
import com.sve.datacenter.service.ParkingSpaceService;
import com.sve.datacenter.service.UnitService;
import com.sve.datacenter.service.VehicleService;
import com.sve.toll.model.Toll;
import com.sve.toll.model.Unpaidbills;
import com.sve.toll.service.TollService;
import com.sve.toll.service.UnpaidbillsService;

@Controller
@RequestMapping("/report")
@RemoteProxy(name = "reportController")
public class ReportController {
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
	private TollService tollService;// 帐单
	@Autowired
	private UnpaidbillsService unpaidbillsService;// 已缴帐单

	@RequestMapping("/housereport") // 查询各小区对应房屋属
	public String houseReport(Model model) {
		List<HouseFan> list = houseFanService.selectDisfancount();
		List<District> dislist = districtService.selectYiAll();
		model.addAttribute("list", list);
		model.addAttribute("dislist", dislist);
		return "report/housestatistics";
	}

	@RequestMapping("/housereport/{disid}") // 查询各小区对应房屋属
	public String houseDisReport(@PathVariable("disid") int disid, Model model) {
		List<HouseFan> list = houseFanService.selectUtypecount(disid);
		List<District> dislist = districtService.selectYiAll();
		model.addAttribute("dislist", dislist);
		model.addAttribute("list", list);
		return "report/housetypestatistics";
	}

	@RequestMapping("/parkReport")
	public String ParkCount(Model model) {
		List<ParkingSpace> list = parkingSpaceService.parkReportAll();
		List<District> dislist = districtService.selectYiAll();
		model.addAttribute("dislist", dislist);
		model.addAttribute("list", list);
		return "report/parkstatistics";
	}

	@RequestMapping("/parkReport/{disid}") // 查询各小区对应房屋属
	public String parkDisReport(@PathVariable("disid") int disid, Model model) {
		List<ParkingSpace> list = parkingSpaceService.parkReportStatus(disid);
		List<District> dislist = districtService.selectYiAll();
		model.addAttribute("dislist", dislist);
		model.addAttribute("list", list);
		return "report/parksalestatus";
	}

	@RequestMapping("/ownerReport")
	public String OwnersCount(Model model) {
		List<Owners> list = ownersService.selectOwnerDisReport();
		List<District> dislist = districtService.selectYiAll();
		model.addAttribute("dislist", dislist);
		model.addAttribute("list", list);
		return "report/ownerstatistics";
	}

	@RequestMapping("/ownerReport/{disid}") // 查询各小区对应房屋属
	public String OwnerDisReport(@PathVariable("disid") int disid, Model model) {
		List<Owners> list = ownersService.selectOwnerDisidReport(disid);
		List<District> dislist = districtService.selectYiAll();
		model.addAttribute("dislist", dislist);
		model.addAttribute("list", list);
		return "report/ownercardorstatus";
	}

	@RequestMapping("/QtollReport") // 查看各小区对应的欠费记录
	public String QtollReport(Model model) {
		List<Toll> list = tollService.TollDisReportAll();
		List<District> dislist = districtService.selectYiAll();
		model.addAttribute("dislist", dislist);
		model.addAttribute("list", list);
		return "report/tollstatistics";
	}

	@RequestMapping("/QtollReport/{disid}") // 查询一个小区对应欠费记录
	public String qtollDisidReports(@PathVariable("disid") int disid, Model model) {
		List<Toll> list = tollService.TollDisIdReportAll(disid);
		List<District> dislist = districtService.selectYiAll();
		model.addAttribute("dislist", dislist);
		model.addAttribute("list", list);
		return "report/tollsalestatus";
	}

	@RequestMapping("/QtollReport/{disid}/{ztype}") // 查询一个小区欠费类型对应的收费项目
	public String qtollDisidPriceReports(@PathVariable("disid") int disid, @PathVariable("ztype") int ztype,
			Model model) {
		List<Toll> list = tollService.selectReprotPrice(disid, ztype);
		List<District> dislist = districtService.selectYiAll();
		model.addAttribute("dislist", dislist);
		model.addAttribute("list", list);
		return "report/tollprojectreport";
	}

	@RequestMapping("/UnpaidReport")
	public String unpaidReport(Toll toll, Model model) {
		if (toll.getZtype() != null && !toll.getZtype().equals("")) {
			Date date = new Date();
			Calendar sdates = Calendar.getInstance();
			if (toll.getZtype() == 1) {// 过去七天
				sdates.setTime(date);
				sdates.add(sdates.DAY_OF_MONTH, -7);
				toll.setSdate(sdates.getTime());
			} else if (toll.getZtype() == 2) {// 过去一个月
				sdates.setTime(date);
				sdates.add(sdates.MONTH, -1);
				toll.setSdate(sdates.getTime());
			} else if (toll.getZtype() == 3) {// 过去三个月
				sdates.setTime(date);
				sdates.add(sdates.MONTH, -3);
				toll.setSdate(sdates.getTime());
			} else if (toll.getZtype() == 4) {// 过去半年
				sdates.setTime(date);
				sdates.add(sdates.MONTH, -6);
				toll.setSdate(sdates.getTime());
			}
		}
		List<Unpaidbills> list = unpaidbillsService.selectUnpaidReport(toll);
		model.addAttribute("toll", toll);
		model.addAttribute("list", list);
		return "report/unpaidstatistics";
	}

	@RequestMapping("/UnpaidReport/{disid}")
	public String unpaidDisReport(@PathVariable("disid") int disid, Toll toll, Model model) {
		if (toll.getZtype() == null) {
			toll.setZtype(1);
		}
		if (toll.getZtype() != null && !toll.getZtype().equals("")) {
			Date date = new Date();
			Calendar sdates = Calendar.getInstance();
			if (toll.getZtype() == 1) {// 过去七天
				sdates.setTime(date);
				sdates.add(sdates.DAY_OF_MONTH, -7);
				toll.setSdate(sdates.getTime());
			} else if (toll.getZtype() == 2) {// 过去一个月
				sdates.setTime(date);
				sdates.add(sdates.MONTH, -1);
				toll.setSdate(sdates.getTime());
			} else if (toll.getZtype() == 3) {// 过去三个月
				sdates.setTime(date);
				sdates.add(sdates.MONTH, -3);
				toll.setSdate(sdates.getTime());
			} else if (toll.getZtype() == 4) {// 过去半年
				sdates.setTime(date);
				sdates.add(sdates.MONTH, -6);
				toll.setSdate(sdates.getTime());
			}
		}
		List<Unpaidbills> list = unpaidbillsService.selectUnpaidDisReport(toll);
		Date date = new Date();
		Calendar sdates = Calendar.getInstance();
		sdates.setTime(date);
		List<String> datalist = new ArrayList<String>();
		List<Long> sublist = new ArrayList<Long>();
		if (toll.getZtype() == 1) {// 过去七天
			for (int i = 6; i >=0; i--) {
				sdates.add(Calendar.DAY_OF_MONTH, -i);
				datalist.add(getDate(sdates.getTime()));
				long subtotal = 0;
				for (Unpaidbills unpaidbills : list) {
					if (unpaidbills.getZfdates().equals(getDate(sdates.getTime()))) {
						subtotal += unpaidbills.getTotalYjmoney();
					}
				}sdates.add(Calendar.DAY_OF_MONTH, +i);//重新设回原来的值
				sublist.add(subtotal);
			}
		} else if (toll.getZtype() == 2) {// 过去一个月
			Calendar edates = Calendar.getInstance();
			for (int i = 10; i >= 0; i--) {
				sdates.add(Calendar.DAY_OF_MONTH, -i * 3);
				edates.add(Calendar.DAY_OF_MONTH, -i*3+3);//得到他的前一个时间段
				datalist.add(getDate(sdates.getTime()));
				long subtotal = 0;
				for (Unpaidbills unpaidbills : list) {
					if (unpaidbills.getUndate().getTime() <= edates.getTime().getTime()
							&& unpaidbills.getUndate().getTime() >= sdates.getTime().getTime()) {
						subtotal += unpaidbills.getTotalYjmoney();
					}
				}
				sdates.add(Calendar.DAY_OF_MONTH, i * 3);
				edates.add(Calendar.DAY_OF_MONTH, i*3-3);
				sublist.add(subtotal);
			}
		} else if (toll.getZtype() == 3) {// 过去三个月
			Calendar edates = Calendar.getInstance();
			for (int i = 3; i >= 0; i--) {
				sdates.add(Calendar.MONTH, -i);
				edates.add(Calendar.MONTH, -i+1);
				datalist.add(getDate(sdates.getTime()));
				long subtotal = 0;
				for (Unpaidbills unpaidbills : list) {
					if (unpaidbills.getUndate().getTime()<= edates.getTime().getTime()
							&& unpaidbills.getUndate().getTime() >= sdates.getTime().getTime()) {
						subtotal+=unpaidbills.getTotalYjmoney();
					}
				}sdates.add(Calendar.MONTH, i);
				edates.add(Calendar.MONTH, i-1);
				sublist.add(subtotal);
			}
		} else if (toll.getZtype() == 4) {// 过去半年
			Calendar edates = Calendar.getInstance();
			for (int i = 6; i >=0; i--) {
				sdates.add(Calendar.MONTH, -i);
				edates.add(Calendar.MONTH, -i+1);
				datalist.add(getDate(sdates.getTime()));
				long subtotal = 0;
				for (Unpaidbills unpaidbills : list) {
					if (unpaidbills.getUndate().getTime() <= edates.getTime().getTime()
							&& unpaidbills.getUndate().getTime() >= sdates.getTime().getTime()) {
						subtotal+=unpaidbills.getTotalYjmoney();
					}
				}sdates.add(Calendar.MONTH, +i);
				edates.add(Calendar.MONTH, i-1);
				sublist.add(subtotal);
			}
		}
		List<District> dislist = districtService.selectYiAll();
		model.addAttribute("datalist", datalist);
		model.addAttribute("sublist", sublist);
		model.addAttribute("toll", toll);
		model.addAttribute("dislist", dislist);
		model.addAttribute("list", list);
		return "report/unpaidDisDetails";
	}

	public String getDate(Date date) {
		SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd");
		return simple.format(date);
	}
}
