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
	private TollService tollService;// �ʵ�
	@Autowired
	private UnpaidbillsService unpaidbillsService;// �ѽ��ʵ�

	@RequestMapping("/housereport") // ��ѯ��С����Ӧ������
	public String houseReport(Model model) {
		List<HouseFan> list = houseFanService.selectDisfancount();
		List<District> dislist = districtService.selectYiAll();
		model.addAttribute("list", list);
		model.addAttribute("dislist", dislist);
		return "report/housestatistics";
	}

	@RequestMapping("/housereport/{disid}") // ��ѯ��С����Ӧ������
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

	@RequestMapping("/parkReport/{disid}") // ��ѯ��С����Ӧ������
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

	@RequestMapping("/ownerReport/{disid}") // ��ѯ��С����Ӧ������
	public String OwnerDisReport(@PathVariable("disid") int disid, Model model) {
		List<Owners> list = ownersService.selectOwnerDisidReport(disid);
		List<District> dislist = districtService.selectYiAll();
		model.addAttribute("dislist", dislist);
		model.addAttribute("list", list);
		return "report/ownercardorstatus";
	}

	@RequestMapping("/QtollReport") // �鿴��С����Ӧ��Ƿ�Ѽ�¼
	public String QtollReport(Model model) {
		List<Toll> list = tollService.TollDisReportAll();
		List<District> dislist = districtService.selectYiAll();
		model.addAttribute("dislist", dislist);
		model.addAttribute("list", list);
		return "report/tollstatistics";
	}

	@RequestMapping("/QtollReport/{disid}") // ��ѯһ��С����ӦǷ�Ѽ�¼
	public String qtollDisidReports(@PathVariable("disid") int disid, Model model) {
		List<Toll> list = tollService.TollDisIdReportAll(disid);
		List<District> dislist = districtService.selectYiAll();
		model.addAttribute("dislist", dislist);
		model.addAttribute("list", list);
		return "report/tollsalestatus";
	}

	@RequestMapping("/QtollReport/{disid}/{ztype}") // ��ѯһ��С��Ƿ�����Ͷ�Ӧ���շ���Ŀ
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
			if (toll.getZtype() == 1) {// ��ȥ����
				sdates.setTime(date);
				sdates.add(sdates.DAY_OF_MONTH, -7);
				toll.setSdate(sdates.getTime());
			} else if (toll.getZtype() == 2) {// ��ȥһ����
				sdates.setTime(date);
				sdates.add(sdates.MONTH, -1);
				toll.setSdate(sdates.getTime());
			} else if (toll.getZtype() == 3) {// ��ȥ������
				sdates.setTime(date);
				sdates.add(sdates.MONTH, -3);
				toll.setSdate(sdates.getTime());
			} else if (toll.getZtype() == 4) {// ��ȥ����
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
			if (toll.getZtype() == 1) {// ��ȥ����
				sdates.setTime(date);
				sdates.add(sdates.DAY_OF_MONTH, -7);
				toll.setSdate(sdates.getTime());
			} else if (toll.getZtype() == 2) {// ��ȥһ����
				sdates.setTime(date);
				sdates.add(sdates.MONTH, -1);
				toll.setSdate(sdates.getTime());
			} else if (toll.getZtype() == 3) {// ��ȥ������
				sdates.setTime(date);
				sdates.add(sdates.MONTH, -3);
				toll.setSdate(sdates.getTime());
			} else if (toll.getZtype() == 4) {// ��ȥ����
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
		if (toll.getZtype() == 1) {// ��ȥ����
			for (int i = 6; i >=0; i--) {
				sdates.add(Calendar.DAY_OF_MONTH, -i);
				datalist.add(getDate(sdates.getTime()));
				long subtotal = 0;
				for (Unpaidbills unpaidbills : list) {
					if (unpaidbills.getZfdates().equals(getDate(sdates.getTime()))) {
						subtotal += unpaidbills.getTotalYjmoney();
					}
				}sdates.add(Calendar.DAY_OF_MONTH, +i);//�������ԭ����ֵ
				sublist.add(subtotal);
			}
		} else if (toll.getZtype() == 2) {// ��ȥһ����
			Calendar edates = Calendar.getInstance();
			for (int i = 10; i >= 0; i--) {
				sdates.add(Calendar.DAY_OF_MONTH, -i * 3);
				edates.add(Calendar.DAY_OF_MONTH, -i*3+3);//�õ�����ǰһ��ʱ���
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
		} else if (toll.getZtype() == 3) {// ��ȥ������
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
		} else if (toll.getZtype() == 4) {// ��ȥ����
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
