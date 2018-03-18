package com.sve.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sve.datacenter.model.Binding;
import com.sve.datacenter.model.HouseFan;
import com.sve.datacenter.model.HouseLou;
import com.sve.datacenter.model.Owners;
import com.sve.datacenter.model.ParkingSpace;
import com.sve.datacenter.model.Vehicle;
import com.sve.datacenter.service.Ban_chargsService;
import com.sve.datacenter.service.BindingService;
import com.sve.datacenter.service.HouseFanService;
import com.sve.datacenter.service.HouseLouService;
import com.sve.datacenter.service.OwnersService;
import com.sve.datacenter.service.ParkingSpaceService;
import com.sve.datacenter.service.VehicleService;
import com.sve.toll.model.Chargs;
import com.sve.toll.model.Formula;
import com.sve.toll.model.IndexModel;
import com.sve.toll.model.Predeposit;
import com.sve.toll.model.Priceproject;
import com.sve.toll.model.Tablemanager;
import com.sve.toll.model.Temporary;
import com.sve.toll.model.Toll;
import com.sve.toll.model.Unpaidbills;
import com.sve.toll.service.ChargsService;
import com.sve.toll.service.FormulaService;
import com.sve.toll.service.PredepositService;
import com.sve.toll.service.PriceprojectService;
import com.sve.toll.service.TablemanagerService;
import com.sve.toll.service.TemporaryService;
import com.sve.toll.service.TollService;
import com.sve.toll.service.UnpaidbillsService;
import com.sve.util.FormulaPage;
import com.sve.util.PageInfo2;

@Controller
@RequestMapping("/toll")
@RemoteProxy(name = "tollController")
public class TollController {
	@Autowired // 存放收费项目的服务方法
	private PriceprojectService priceprojectService;
	@Autowired // 存放收费标准的服务方法
	private ChargsService chargsService;
	@Autowired // 存放管理收费公式的服务方法
	private FormulaService formulaService;
	@Autowired // 存放抄表录入的服务方法
	private TablemanagerService tablemanagerService;
	@Autowired // 存放小区房屋的服务方法
	private HouseFanService housefanService;
	@Autowired // 存放小区楼宇的服务方法
	private HouseLouService houselouService;
	@Autowired // 存放生成未缴账单的服务
	private TollService tollService;
	@Autowired // 存放车位的服务
	private ParkingSpaceService parkingspaceService;
	@Autowired // 存放车辆的服务
	private VehicleService vehiclemanagerService;
	@Autowired // 存放相关业主的服务
	private OwnersService ownersService;
	@Autowired // 存放临时收费相应信息，
	private TemporaryService temporaryService;
	@Autowired // 存放绑定收费相关信息
	private Ban_chargsService ban_chargsService;
	@Autowired // 存放已缴账单的服务信息
	private UnpaidbillsService unpaidbillsService;
	@Autowired // 用于存放预存款信息的方法
	private PredepositService predepositService;
	@Autowired // 绑定住户的
	private BindingService bindingService;
	// 收费公式工具类
	FormulaPage fpage = new FormulaPage();

	// 404，出错转向页面
	@RequestMapping("/error4")
	public String error4() {
		return "404";
	}

	// 500出错转向页面
	@RequestMapping("/error5")
	public String error5() {
		return "500";
	}

	// 排除本身查询收费名是否已存在
	@RemoteMethod
	public int ispricename(int priceid, String pricename) {
		Priceproject pro = new Priceproject();
		pro.setPriceid(priceid);
		pro.setPricename(pricename);
		return priceprojectService.selectProname(pro);
	}

	// 查询公式名是否已存在
	@RemoteMethod
	public int isformulaname(String formulaname) {
		return formulaService.selectFormulaname(formulaname);
	}

	// 排除本身查询公式名是否已存在
	@RemoteMethod
	public int isformulaName(int formulaid, String formualname) {
		Formula formula = new Formula();
		formula.setFormulaid(formulaid);
		formula.setFormulaname(formualname);
		return formulaService.selectFormulaName(formula);
	}

	// 查询所有收费项目与对应的收费标准
	@RequestMapping("/priceAll")
	public String findAll(Priceproject priceproject, Model model, HttpServletRequest request) {
		String pageNum = request.getParameter("pageNum");
		String pageSize = request.getParameter("pageSize");
		int num = getPageNum(pageNum);
		int size = getPageSize(pageSize);
		PageHelper.startPage(num, size);
		List<Priceproject> list = priceprojectService.selectPriceGaoAll(priceproject);
		for (Priceproject price : list) {
			price.setChargslist(chargsService.selectChargsProject(price.getPriceid()));
		}
		PageInfo<Priceproject> page = new PageInfo<Priceproject>(list);
		page.setPageNum(getPageNum(pageNum));
		thisEndSizeNum(pageNum, pageSize);
		PageInfo2 page2 = new PageInfo2(page, page.getPageNum());// 分页条，及下拉框工具类
		int selectnum[] = { 6, 8, 12, 16 };// 设置下来框里的数
		page2.setSelectnum(selectnum);
		page2.setSize(page.getPageSize());
		model.addAttribute("mohuselect", priceproject);// 传回条件参数
		model.addAttribute("page", page);
		model.addAttribute("page2", page2);
		return "toll/cost_shoufei";
	}

	// 跳转到添加收费项目页面
	@RequestMapping("/priceinsert")
	public String insertView() {
		return "toll/add_cost_template";
	}

	// 处理添加项目
	@RequestMapping("/priceadd")
	public String addprice(Priceproject price, Model model) {
		priceprojectService.Insertprice(price);
		return "redirect:priceAll";
	}

	// 查询并跳转到编辑收费项目
	@RequestMapping("/priceedit")
	public String editprice(int priceid, Model model) {
		Priceproject price = priceprojectService.Selectpriceid(priceid);
		model.addAttribute("price", price);
		return "toll/edit_cost_template";
	}

	// 判断收费项目是否存在
	@RemoteMethod
	public int ispricename(String pricename) {
		return priceprojectService.selectPrname(pricename);
	}

	// 更改收费项目
	@RequestMapping("/priceupdate")
	public String updateprice(Priceproject price) {
		priceprojectService.Updateprice(price);
		return "redirect:priceAll";
	}

	// 删除收费项目
	@RequestMapping("/pricedelete")
	public String delprice(int priceid, Model model) {
		priceprojectService.Deleteprice(priceid);
		return "redirect:priceAll";
	}

	// 异步查收费项目
	@RemoteMethod
	public List<Priceproject> yipriceAll() {
		return priceprojectService.SelectpriceAll();
	}

	// 添加收费标准
	@RequestMapping("/chargadd")
	public String addChargs(Chargs chargs) {
		chargsService.InsertChargs(chargs);
		return "redirect:priceAll";
	}

	// 编辑收费标准
	@RemoteMethod
	public Chargs editChargs(int chargid) {
		Chargs charg = chargsService.SelectChargId(chargid);
		return charg;
	}

	@RequestMapping("/chargupdate")
	public String updateChargs(Chargs charg) {
		chargsService.UpdateChargs(charg);
		return "redirect:priceAll";
	}

	// 删除收费标准
	@RequestMapping("/chargdel")
	public String delChargs(int chargid) {
		chargsService.DeleteChargs(chargid);
		return "redirect:priceAll";
	}

	@RemoteMethod // 异步获取全部收费标准
	public List<Chargs> chargyiAllid(int priceid) {
		return chargsService.selectPidduiCharg(priceid);
	}

	@RemoteMethod // 针对房屋打造的收费标准
	public List<Chargs> chargFanAllid(int priceid) {
		return chargsService.selectTaskfanid(priceid);
	}

	@RemoteMethod // 针对车位打造的收费标准
	public List<Chargs> chargParkAllid(int priceid) {
		return chargsService.selectTaskparkid(priceid);
	}

	@RemoteMethod // 针对车辆打造的收费标准
	public List<Chargs> chargVehicAllid(int priceid) {
		return chargsService.selectTaskvehicid(priceid);
	}

	// 异步根据项目id查下面的自定义公式的收费标准
	@RemoteMethod
	public List<Chargs> chargyiid(int priceid) {
		return chargsService.selectProForid(priceid);
	}

	// 查询全部公式
	@RequestMapping("/formulaAll")
	public String allformula(Formula formula, Model model, HttpServletRequest request) {
		String pageNum = request.getParameter("pageNum");
		String pageSize = request.getParameter("pageSize");
		PageHelper.startPage(getPageNum(pageNum), getPageSize(pageSize));
		List<Formula> list = formulaService.selectGaoJiAll(formula);
		PageInfo<Formula> page = new PageInfo<Formula>(list);
		page.setPageNum(getPageNum(pageNum));
		thisEndSizeNum(pageNum, pageSize);
		PageInfo2 page2 = new PageInfo2(page, page.getPageNum());// 分页条，及下拉框工具类
		int selectnum[] = { 6, 8, 12, 16 };// 设置下来框里的数
		page2.setSelectnum(selectnum);
		page2.setSize(page.getPageSize());
		model.addAttribute("mohuselect", formula);// 传回条件参数
		model.addAttribute("page", page);
		model.addAttribute("page2", page2);
		return "toll/formula";
	}

	// 跳到添加公式
	@RequestMapping("/insertformula")
	public String insertformula() {
		return "toll/add_formula";
	}

	// 处理添加公式
	@RequestMapping("/addformula")
	public String addformula(Formula formula) {
		formulaService.insertfor(formula);
		return "redirect:formulaAll";
	}

	// 调到编辑页面
	@RequestMapping("/eidtformula")
	public String editformula(int forid, Model model) {
		Formula formula = formulaService.findid(forid);
		model.addAttribute("formula", formula);
		return "toll/edit_formula";
	}

	// 处理更新
	@RequestMapping("/updateformula")
	public String updateformula(Formula formula) {
		formulaService.updatefor(formula);
		return "redirect:formulaAll";
	}

	@RequestMapping("/deleteformula")
	@ResponseBody
	public List<String> deleteformula(int forid) {
		List<String> list = new ArrayList<String>();
		if (chargsService.selectFormulaid(forid) > 0) {
			list.add("error");
			return list;
		} else {
			formulaService.deletefor(forid);
			list.add("success");
			return list;
		}
	}

	// 异步获取全部公式
	@RemoteMethod
	public List<Formula> yibuFormulaAll() {
		List<Formula> list = formulaService.selectAll();
		return list;
	}

	// 异步获取全部公式
	@RemoteMethod
	public Formula yibuFormulaid(int forid) {
		return formulaService.findid(forid);
	}

	// 查询全部的抄表记录
	@RequestMapping("/tableAll")
	public String tableAll(Tablemanager tab, HttpServletRequest request, Model model) {
		String pageNum = request.getParameter("pageNum");
		String pageSize = request.getParameter("pageSize");
		int num = getPageNum(pageNum);
		int size = getPageSize(pageSize);
		PageHelper.startPage(num, size);
		List<Tablemanager> list = tablemanagerService.selectTabHouChargGaoji(tab);
		PageInfo<Tablemanager> page = new PageInfo<Tablemanager>(list);
		page.setPageNum(getPageNum(pageNum));

		thisEndSizeNum(pageNum, pageSize);
		PageInfo2 page2 = new PageInfo2(page, page.getPageNum());// 分页条，及下拉框工具类
		int selectnum[] = { 6, 8, 12, 16 };// 设置下来框里的数
		page2.setSelectnum(selectnum);
		page2.setSize(page.getPageSize());
		model.addAttribute("mohuselect", tab);// 传回条件参数
		model.addAttribute("page", page);
		model.addAttribute("page2", page2);
		return "toll/data_entry";
	}

	// 添加抄表记录
	@RequestMapping("/tableadd")
	public String tableAdd(Tablemanager tablemanager) {
		tablemanagerService.inserttab(tablemanager);
		Toll toll = new Toll();
		toll.setZtype(1);// 抄表默认都是房屋型的
		toll.setDisid(tablemanager.getTabDisId());
		toll.setPriceid(tablemanager.getTabPriceId());
		toll.setChargid(tablemanager.getTabChargId());
		List<Owners> owners = ownersService.selectFanid(tablemanager.getTabFanId());
		if (owners != null && owners.size() != 0) {
			toll.setOid(owners.get(0).getOid());
		}
		toll.setFanId(tablemanager.getTabFanId());
		Chargs chargs = chargsService.SelectChargId(tablemanager.getTabChargId());
		int formulaid = chargs.getFormula_id();// 表计只能录入自定义公式的收费标准
		Formula formula = formulaService.findid(formulaid);
		Long subtotal = null;
		if (formula.getFormulanum() == 7) {
			HouseFan housefan = housefanService.selectByPrimaryKey(tablemanager.getTabFanId());
			HouseLou houselou = houselouService.selectByPrimaryKey(housefan.getHlid());
			subtotal = (long) fpage.gongshiSelect(houselou.getCengcount(),
					tablemanager.getTabEndnum() - tablemanager.getTabStartnum(), formula);
			System.out.println(houselou.getCengcount()+" ---------- "+subtotal);
		} else {
			subtotal = (long) fpage.gongshiSelect(tablemanager.getTabEndnum() - tablemanager.getTabStartnum(), 0,
					formula);
		}
		toll.setSubtotal(subtotal);
		toll.setCount(tablemanager.getTabEndnum() - tablemanager.getTabStartnum());
		toll.setSdate(tablemanager.getTabMonths());
		toll.setTabId(tablemanager.getTabId());
		Calendar ct = Calendar.getInstance();
		ct.setTime(tablemanager.getTabMonths());
		ct.add(Calendar.MONTH, +1);
		toll.setEdate(ct.getTime());
		tollService.insertSelective(toll);
		return "redirect:tableAll";
	}

	// 修改抄表记录
	@RemoteMethod
	public List<String> tableupdate(Tablemanager tablemanager) {
		List<String> list = new ArrayList<String>();
		if (tablemanagerService.updatetab(tablemanager) > 0) {
			list.add("success");
			return list;
		} else {
			list.add("error");
			return list;
		}
	}

	// 查询当前用户的收费标准对应的最后度数
	@RemoteMethod
	public List<Tablemanager> chargidend(Tablemanager tablemanager) {
		List<Tablemanager> list = tablemanagerService.selectChargidEndnum(tablemanager);
		return list;
	}

	// 一个房号一个只能抄表录入一次
	@RemoteMethod
	public int Tollmonths(Tablemanager tablemanager) {
		int count = tablemanagerService.selectTongMonths(tablemanager);
		return count;
	}

	// 预存款查询
	@RequestMapping("/selectPredAll")
	public String PredeAll(Predeposit predeposit, Model model, HttpServletRequest request) {
		String pageNum = request.getParameter("pageNum");
		String pageSize = request.getParameter("pageSize");
		int num = getPageNum(pageNum);
		int size = getPageSize(pageSize);
		PageHelper.startPage(num, size);
		List<Predeposit> list = predepositService.selectAll();
		PageInfo<Predeposit> page = new PageInfo<Predeposit>(list);
		page.setPageNum(getPageNum(pageNum));
		thisEndSizeNum(pageNum, pageSize);
		PageInfo2 page2 = new PageInfo2(page, page.getPageNum());// 分页条，及下拉框工具类
		int selectnum[] = { 6, 8, 12, 16 };// 设置下来框里的数
		page2.setSelectnum(selectnum);
		page2.setSize(page.getPageSize());
		model.addAttribute("mohuselect", predeposit);// 传回条件参数
		model.addAttribute("page", page);
		model.addAttribute("page2", page2);
		return "toll/yucunkuan";
	}

	// 预存款充值
	@RequestMapping("/PredAdd")
	public String PredeAdd(Predeposit predeposit, Model model) {
		predepositService.insertSelective(predeposit);
		return "redirect:selectPredAll";
	}

	@RequestMapping("/PredTuiKuan") // 用于处理退款
	public String PredTuikuan(Predeposit predeposit) {
		String remark = "退款人:" + predeposit.getPredTuiname() + " 手机号:" + predeposit.getPredTuiphone() + " 备注:"
				+ predeposit.getPredTuiremark();
		predeposit.setPredRemark(remark);
		predeposit.setPredMoney(-predeposit.getPredMoney());
		predeposit.setPredType(2);
		predepositService.insertSelective(predeposit);
		return "redirect:selectPredAll";
	}

	@RemoteMethod // 查看所剩金额
	public int predgtMoney(Predeposit predeposit) {
		int money = predepositService.selectgtMoney(predeposit.getPredDisId(), predeposit.getPredOid());
		return money;
	}

	@RequestMapping("/findpredoid/{predOid}")
	public String findpredOid(@PathVariable("predOid") int predOid, Predeposit predeposit, Model model,
			HttpServletRequest request) {
		String pageNum = request.getParameter("pageNum");
		String pageSize = request.getParameter("pageSize");
		int count = 0;
		for (Predeposit pred : predepositService.selectDetailOid(predOid)) {
			count += pred.getPredMoney();
		}
		PageHelper.startPage(getPageNum(pageNum), getPageSize(pageSize));
		List<Predeposit> list = predepositService.selectDetailOid(predOid);
		PageInfo<Predeposit> page = new PageInfo<Predeposit>(list);
		page.setPageNum(getPageNum(pageNum));
		page.setPrePage(count);
		thisEndSizeNum(pageNum, pageSize);
		PageInfo2 page2 = new PageInfo2(page, page.getPageNum());
		int selectnum[] = { 6, 8, 12, 16 };// 设置下来框里的数
		page2.setSelectnum(selectnum);
		page2.setSize(page.getPageSize());
		model.addAttribute("mohuselect", predeposit);// 传回条件参数
		model.addAttribute("page", page);
		model.addAttribute("page2", page2);
		return "toll/yucunkun_detail";
	}

	// 预存款记录查询
	@RequestMapping("/selectPredJiAll")
	public String PredeJilvAll(Predeposit predeposit, Model model, HttpServletRequest request) {
		String pageNum = request.getParameter("pageNum");
		String pageSize = request.getParameter("pageSize");
		int num = getPageNum(pageNum);
		int size = getPageSize(pageSize);
		PageHelper.startPage(num, size);
		List<Predeposit> list = predepositService.selectDetails();
		PageInfo<Predeposit> page = new PageInfo<Predeposit>(list);
		page.setPageNum(getPageNum(pageNum));
		thisEndSizeNum(pageNum, pageSize);
		PageInfo2 page2 = new PageInfo2(page, page.getPageNum());
		int selectnum[] = { 6, 8, 12, 16 };// 设置下来框里的数
		page2.setSelectnum(selectnum);
		page2.setSize(page.getPageSize());
		model.addAttribute("mohuselect", predeposit);// 传回条件参数
		model.addAttribute("page", page);
		model.addAttribute("page2", page2);
		return "toll/yucunkuan_entry";
	}

	// 查询所有未缴账单
	@RequestMapping("/selectWeiAll")
	public String selectWeiAll(Toll toll, Model model, HttpServletRequest request) {
		String pageNum = request.getParameter("pageNum");
		String pageSize = request.getParameter("pageSize");
		int num = getPageNum(pageNum);
		int size = getPageSize(pageSize);
		PageHelper.startPage(num, size);
		List<Toll> list = tollService.selectWeiGaoAll(toll);
		System.out.println(list.size());
		list = bandingjion(list);
		PageInfo<Toll> page = new PageInfo<Toll>(list);
		page.setPageNum(getPageNum(pageNum));
		thisEndSizeNum(pageNum, pageSize);
		PageInfo2 page2 = new PageInfo2(page, page.getPageNum());
		int selectnum[] = { 6, 8, 12, 16 };// 设置下来框里的数
		page2.setSelectnum(selectnum);
		page2.setSize(page.getPageSize());
		model.addAttribute("mohuselect", toll);// 传回条件参数
		model.addAttribute("page", page);
		model.addAttribute("page2", page2);
		return "toll/unpay_house";
	}

	// 信息关键方法，查看绑定的一些值与方法
	public List<Toll> bandingjion(List<Toll> list) {
		for (Toll toll : list) {
			if (toll.getFanId() != null && !toll.getFanId().equals("")) {
				toll.setHousefan(housefanService.selectByPrimaryKey(toll.getFanId()));
			} else if (toll.getParkId() != null && !toll.getParkId().equals("")) {
				toll.setParkingspace(parkingspaceService.selectByPrimaryKey(toll.getParkId()));
			} else if (toll.getVehicleId() != null && !toll.getVehicleId().equals("")) {
				toll.setVehiclemanager(vehiclemanagerService.selectByPrimaryKey(toll.getVehicleId()));
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
			if (toll.getBcId() != null) {// 若是定時生成的，則判斷有沒有对应绑定的业主
				Binding bind = new Binding();
				if (toll.getFanId() != null && !toll.getFanId().equals("")) {
					bind.setHouseId(toll.getFanId());
				} else if (toll.getParkId() != null && !toll.getParkId().equals("")) {
					bind.setParkId(toll.getParkId());
				} else if (toll.getVehicleId() != null && !toll.getVehicleId().equals("")) {
					bind.setVehicleId(toll.getVehicleId());
				}
				List<Binding> bindlist = bindingService.selectOwnerid(bind);
				List<Owners> owerlist = new ArrayList<Owners>();
				if (bindlist != null) {
					for (Binding b : bindlist) {
						owerlist.add(ownersService.selectOwerid(b.getOwnerId()));
					}
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

	// 删除未缴账单
	@RequestMapping("/deleteWeij")
	@ResponseBody
	public List<String> deleteWeij(int tollid) {
		tollService.deleteByPrimaryKey(tollid);
		return new ArrayList<String>();
	}

	@RequestMapping("/costCenter")//进入收银台
	public String costcenter(Model model) {
		return "toll/cost_center";
	}
	
	@RemoteMethod
	public List<Toll> shouyisuo(String keyword){
		List<Toll> tolllist=tollService.selectShouyin(keyword);
		for(Toll toll:tolllist){
			if(toll.getZtype()==1){
				toll.setHousefan(housefanService.selectFandid(toll.getFanId()));
			}else if(toll.getZtype()==2){
				toll.setParkingspace(parkingspaceService.selectByPrimaryKey(toll.getParkId()));
			}else if(toll.getZtype()==3){
				toll.setVehiclemanager(vehiclemanagerService.selectByPrimaryKey(toll.getVehicleId()));
			}else if(toll.getZtype()==4){
				toll.setOwner(ownersService.selectOwerid(toll.getOid()));
			}
		}
		return tolllist;
	}

	@RequestMapping(value = "/checkoutids/{billType}/{id}") // 根据账单id，和账单类型查看其对应的其他账单
	public String shouying(@PathVariable("billType") int billType, @PathVariable("id") int id, Toll toll, Model model,
			HttpServletRequest request) {
		String pageNum = request.getParameter("pageNum");
		String pageSize = request.getParameter("pageSize");
		List<Toll> list = null;
		PageHelper.startPage(getPageNum(pageNum), getPageSize(pageSize));
		if (billType == 1) {// 房屋
			list = tollService.selectTollfanid(id);
		} else if (billType == 2) {// 车位
			list = tollService.selectTollparkid(id);
		} else if (billType == 3) {// 车辆
			list = tollService.selectTollvehicid(id);
		}
		list = bandingjion(list);
		PageInfo<Toll> page = new PageInfo<Toll>(list);
		page.setPageNum(getPageNum(pageNum));
		thisEndSizeNum(pageNum, pageSize);
		PageInfo2 page2 = new PageInfo2(page, page.getPageNum());
		int selectnum[] = { 6, 8, 12, 16 };// 设置下来框里的数
		page2.setSelectnum(selectnum);
		page2.setSize(page.getPageSize());
		model.addAttribute("page", page);
		model.addAttribute("page2", page2);
		model.addAttribute("isower", false);
		return "toll/cost_center_detail";
	}

	@RequestMapping(value = "/checkoutower/{owerid}") // 查询相关用户的账单信息
	public String shouyingower(@PathVariable("owerid") int owerid, Toll toll, Model model, HttpServletRequest request) {
		String pageNum = request.getParameter("pageNum");
		String pageSize = request.getParameter("pageSize");
		PageHelper.startPage(getPageNum(pageNum), getPageSize(pageSize));
		List<Toll> list = tollService.selectTollowerid(owerid);
		if (list.size() == 0) {
			Owners owners = ownersService.selectOwerid(owerid);// 获取传进的业主信息
			PageHelper.startPage(getPageNum(pageNum), getPageSize(pageSize));
			list = tollService.selectTollfanid(owners.getFanid());
		}
		list = bandingjion(list);
		for (Toll tol : list) {
			List<Owners> onslist = new ArrayList<Owners>();// 用于存储要删除的，直接remove会保错
			for (Owners own : tol.getOwnerlist()) {
				if (own.getOid() != owerid) {
					onslist.add(own);
				}
			}
			tol.getOwnerlist().removeAll(onslist);// 移除掉要删的
		}
		PageInfo<Toll> page = new PageInfo<Toll>(list);
		page.setPageNum(getPageNum(pageNum));
		thisEndSizeNum(pageNum, pageSize);
		PageInfo2 page2 = new PageInfo2(page, page.getPageNum());
		int selectnum[] = { 6, 8, 12, 16 };// 设置下来框里的数
		page2.setSelectnum(selectnum);
		page2.setSize(page.getPageSize());
		if(list!=null&&list.size()>0){
			Integer predcount=predepositService.selectgtMoney(list.get(0).getDisid(),owerid);
			if(predcount!=null&&!predcount.equals("")&&predcount>0){
				model.addAttribute("predcount", predcount);
			}
		}
		model.addAttribute("page", page);
		model.addAttribute("page2", page2);
		model.addAttribute("isower", true);// 代表是通过住户
		return "toll/cost_center_detail";
	}

	@RequestMapping("/payment") // 确定收费
	public String cashierid(HttpServletRequest request,Unpaidbills unpaidbills) {
		Owners owners=(Owners) request.getSession().getAttribute("owners");
		if(unpaidbills.getTotalYc()>0){
			Predeposit predeposit=new Predeposit();
			String remark = "缴费抵扣:" + unpaidbills.getTotalYc() +" 业主:"+owners.getOwername()+" 备注:"
					+ unpaidbills.getRemark();
			predeposit.setPredRemark(remark);
			predeposit.setPredOid(owners.getOid());
			predeposit.setPredDisId(owners.getDisid());
			predeposit.setPredMoney(-unpaidbills.getTotalYc());
			predeposit.setPredType(3);//代表抵扣
			predepositService.insertSelective(predeposit);
		}
		unpaidbillsService.insertSelective(unpaidbills);
		for (int i = 0; i < unpaidbills.getTolids().length; i++) {
			Toll toll = tollService.selectByPrimaryKey(unpaidbills.getTolids()[i]);
			if (toll.getTabId() != null && !toll.getTabId().equals("")) {
				tablemanagerService.updateTabStatus(toll.getTabId());
			}
			tollService.updateTollStatus(unpaidbills.getUnpaid(), unpaidbills.getTolids()[i]);
		}
		return "redirect:selectyijiluAll";
	}

	@RequestMapping("/selectyijiluAll") // 查询全部已缴信息
	public String selectyijiluAll(Toll toll, Model model, HttpServletRequest request) {
		String pageNum = request.getParameter("pageNum");
		String pageSize = request.getParameter("pageSize");
		PageHelper.startPage(getPageNum(pageNum), getPageSize(pageSize));
		List<Unpaidbills> list = unpaidbillsService.selectGaojiAll(toll);
		PageInfo<Unpaidbills> page = new PageInfo<Unpaidbills>(list);
		page.setPageNum(getPageNum(pageNum));
		thisEndSizeNum(pageNum, pageSize);
		PageInfo2 page2 = new PageInfo2(page, page.getPageNum());
		int selectnum[] = { 6, 8, 12, 16 };// 设置下来框里的数
		page2.setSelectnum(selectnum);
		page2.setSize(page.getPageSize());
		model.addAttribute("mohuselect", toll);// 传回条件参数
		model.addAttribute("page", page);
		model.addAttribute("page2", page2);
		return "toll/payed";
	}

	@RequestMapping("/editunpaid/{unpaid}") // 根据已缴id查询详情账单信息
	public String editunpaid(@PathVariable("unpaid") int unpaid, Model model) {
		Unpaidbills unpaidbills = unpaidbillsService.selectUnpaids(unpaid);
		unpaidbills.setTolllist(bandingjion(unpaidbills.getTolllist()));// 包装一下账单
		// 若业主id不为空，则说明有对应的业主，则要把相应的楼房和业主信息带进去
		if (unpaidbills.getOid() != null && !unpaidbills.getOid().equals("")) {
			Owners owners = ownersService.selectOwerid(unpaidbills.getOid());
			unpaidbills.setOwners(owners);
			HouseLou houselou = houselouService.selectFandid(owners.getHlid());
			unpaidbills.setHouselou(houselou);
			HouseFan housefan = housefanService.selectFandid(owners.getFanid());
			unpaidbills.setHousefan(housefan);
		}
		model.addAttribute("unpdetails", unpaidbills);
		return "toll/payed_info";
	}

	@RequestMapping("/yituiunpaid/{unpaid}") // 根据已缴id查询退费详情账单信息
	public String yitui(@PathVariable("unpaid") int unpaid, Model model) {
		Unpaidbills unpaidbills = unpaidbillsService.selectYiTuiUnpaids(unpaid);
		unpaidbills.setTolllist(bandingjion(unpaidbills.getTolllist()));// 包装一下账单
		// 若业主id不为空，则说明有对应的业主，则要把相应的楼房和业主信息带进去
		if (unpaidbills.getOid() != null && !unpaidbills.getOid().equals("")) {
			Owners owners = ownersService.selectOwerid(unpaidbills.getOid());
			unpaidbills.setOwners(owners);
			HouseLou houselou = houselouService.selectFandid(owners.getHlid());
			unpaidbills.setHouselou(houselou);
			HouseFan housefan = housefanService.selectFandid(owners.getFanid());
			unpaidbills.setHousefan(housefan);
		}
		model.addAttribute("unpdetails", unpaidbills);
		return "toll/payed_info";
	}

	// 根据已缴id查询详情账单信息
	@RemoteMethod
	public Unpaidbills yifuunpaid(int unpaid) {
		Unpaidbills unpaidbills = unpaidbillsService.selectTuiUnpaids(unpaid);
		if (unpaidbills != null) {
			unpaidbills.setTolllist(bandingjion(unpaidbills.getTolllist()));// 包装一下账单
			// 若业主id不为空，则说明有对应的业主，则要把相应的楼房和业主信息带进去
			if (unpaidbills.getOid() != null && !unpaidbills.getOid().equals("")) {
				Owners owners = ownersService.selectOwerid(unpaidbills.getOid());
				unpaidbills.setOwners(owners);
				HouseLou houselou = houselouService.selectFandid(owners.getHlid());
				unpaidbills.setHouselou(houselou);
				HouseFan housefan = housefanService.selectFandid(owners.getFanid());
				unpaidbills.setHousefan(housefan);
			}
		} else {
			unpaidbills = unpaidbillsService.selectByPrimaryKey(unpaid);
			if (unpaidbills.getOid() != null) {
				unpaidbills.setOwners(ownersService.selectOwerid(unpaidbills.getOid()));
			}
		}
		return unpaidbills;
	}

	// 打印
	@RequestMapping("/dayin")
	public String dayin(int unpaid, Model model) {
		Unpaidbills unpaidbills = unpaidbillsService.selectDayinunpaid(unpaid);
		if (unpaidbills != null) {
			unpaidbills.setTolllist(bandingjion(unpaidbills.getTolllist()));// 包装一下账单
			for (Toll tol : unpaidbills.getTolllist()) {
				if (tol.getTabId() != null) {
					tol.setTablemanager(tablemanagerService.selectid(tol.getTabId()));
				}
			}
		} else {
			unpaidbills = unpaidbillsService.selectByPrimaryKey(unpaid);
			if (unpaidbills.getOid() != null) {
				unpaidbills.setOwners(ownersService.selectOwerid(unpaidbills.getOid()));
			}
		}
		model.addAttribute("unpaidbills", unpaidbills);
		return "index/print_sj";
	}
	//打印未缴记录
	@RequestMapping("/dayinjiao")
	public String dayinjiao(Model model,HttpServletRequest request){
		String[] tolls=request.getParameterValues("tolids");
		List<Toll> list=new ArrayList<Toll>();
		for(int i=0;i<tolls.length;i++){
			list.add(tollService.selectWeiTollid(Integer.parseInt(tolls[i])));
		}
		bandingjion(list);
		for (Toll tol : list) {
			if (tol.getTabId() != null) {
				tol.setTablemanager(tablemanagerService.selectid(tol.getTabId()));
			}
		}
		model.addAttribute("list", list);
		return "index/print_wj";
	}
	
	// 删除已缴记录，转向回收站
	@RemoteMethod
	public int UnpaidDel(int unpaid) {
		int count = unpaidbillsService.deleteByPrimaryKey(unpaid);
		return count;
	}
	//繳費通知
	@RequestMapping("/costNotice")
	public String jiaofei(){
		return "toll/cost_notice";
	}

	// 退款
	@RequestMapping("/refund")
	public String Dealwithrefund(Unpaidbills unpaidbills) {
		List<Toll> list = new ArrayList<Toll>();
		for (int i = 0; i < unpaidbills.getTolids().length; i++) {
			tollService.tollupstatus(unpaidbills.getTolids()[i]);
			list.add(tollService.selectByPrimaryKey(unpaidbills.getTolids()[i]));
		}
		unpaidbillsService.Upunpidstatus(unpaidbills.getUnpaid());// 将之前的以缴状态改为已退
		long totalmoney = 0, totalznj = 0, totalyc = 0, totalyjmoney = 0;
		for (Toll toll : list) {
			totalmoney += toll.getSubtotal();// 总应收
			totalznj += toll.getZhina();// 总滞纳
			totalyc += toll.getYuck();// 总预存
			totalyjmoney += (toll.getSubtotal() + toll.getZhina() - toll.getYuck() - toll.getYoufei());// 总应收
		}
		String remark = unpaidbills.getRemark();
		unpaidbills = new Unpaidbills();
		unpaidbills.setDisid(list.get(0).getDisid());
		unpaidbills.setOid(list.get(0).getOid());
		unpaidbills.setRemark(remark);
		unpaidbills.setTotalMoney(-totalmoney);
		unpaidbills.setTotalZnj(totalznj);
		unpaidbills.setTotalYc(totalyc);
		unpaidbills.setTotalYjmoney(totalyjmoney);
		unpaidbills.setStatus(1);// 设置为退费
		unpaidbillsService.insertSelective(unpaidbills);
		for (Toll toll : list) {
			toll.setUanpaid2(unpaidbills.getUnpaid());
			tollService.updateByPrimaryKeySelective(toll);
		}
		return "redirect:selectyijiluAll";
	}

	// 查询以缴记录
	@RequestMapping("/unpaidXiangAll")
	public String unpaidXiangAll(Toll toll, Model model, HttpServletRequest request) {
		String pageNum = request.getParameter("pageNum");
		String pageSize = request.getParameter("pageSize");
		PageHelper.startPage(getPageNum(pageNum), getPageSize(pageSize));
		List<Unpaidbills> list = unpaidbillsService.selectUnpidTollAll(toll);
		for (Unpaidbills unpid : list) {
			unpid.setTolllist(bandingjion(unpid.getTolllist()));
			if (unpid.getOid() != null && !unpid.getOid().equals("")) {
				Owners owners = ownersService.selectOwerid(unpid.getOid());
				unpid.setOwners(owners);
			}
		}
		PageInfo<Unpaidbills> page = new PageInfo<Unpaidbills>(list);
		page.setPageNum(getPageNum(pageNum));
		thisEndSizeNum(pageNum, pageSize);
		PageInfo2 page2 = new PageInfo2(page, page.getPageNum());
		int selectnum[] = { 6, 8, 12, 16 };// 设置下来框里的数
		page2.setSelectnum(selectnum);
		page2.setSize(page.getPageSize());
		model.addAttribute("mohuselect", toll);// 传回条件参数
		model.addAttribute("page", page);
		model.addAttribute("page2", page2);
		return "toll/payed_detail";
	}

	// 临时收费添加
	@RequestMapping("/tmpAdd")
	public String temporaryAdd(Toll toll, Temporary temporary, Boolean flag) {
		if (toll.getOid() != null) {
			temporary.setOwerId(toll.getOid());
		}
		temporaryService.insertSelective(temporary);
		toll.setTemId(temporary.getTemid());
		tollService.insertSelective(toll);
		if (flag) {
			return "redirect:checkoutower/" + toll.getOid();
		} else {
			if (toll.getZtype() == 1) {
				return "redirect:checkoutids/" + toll.getZtype() + "/" + toll.getFanId();
			} else if (toll.getZtype() == 2) {
				return "redirect:checkoutids/" + toll.getZtype() + "/" + toll.getParkId();
			} else if (toll.getZtype() == 3) {
				return "redirect:checkoutids/" + toll.getZtype() + "/" + toll.getVehicleId();
			}
			return "redirect:checkoutower/" + toll.getOid();
		}
	}

	// 根据业主id查历史缴费
	@RequestMapping("/tollDetail/{oid}")
	public String tollHistoryOid(@PathVariable("oid") int oid, HttpServletRequest request, Model model) {
		String pageNum = request.getParameter("pageNum");
		String pageSize = request.getParameter("pageSize");
		PageHelper.startPage(getPageNum(pageNum), getPageSize(pageSize));
		List<Toll> list = tollService.tollhistoryOid(oid);
		if (list.size() == 0) {
			Owners owners = ownersService.selectOwerid(oid);// 获取传进的业主信息
			list = tollService.selectTollfanid(owners.getFanid());
		}
		list = bandingjion(list);
		for (Toll tol : list) {
			List<Owners> owrlist = new ArrayList<Owners>();
			for (Owners own : tol.getOwnerlist()) {
				if (own.getOid() != oid) {
					owrlist.add(own);
				}
			}
			tol.getOwnerlist().removeAll(owrlist);
			Unpaidbills unpaid = unpaidbillsService.selectByPrimaryKey(tol.getUanpaid());
			tol.setUnpaidbills(unpaid);
		}
		PageInfo<Toll> page = new PageInfo<Toll>(list);
		page.setPageNum(getPageNum(pageNum));
		thisEndSizeNum(pageNum, pageSize);
		PageInfo2 page2 = new PageInfo2(page, page.getPageNum());
		int selectnum[] = { 6, 8, 12, 16 };// 设置下来框里的数
		page2.setSelectnum(selectnum);
		page2.setSize(page.getPageSize());
		model.addAttribute("page", page);
		model.addAttribute("page2", page2);
		return "toll/cost_lishi";
	}

	// 查看帐单缴费的历史记录
	@RequestMapping("/tollDetail/{billType}/{id}")
	public String tollHistoryNoid(@PathVariable("billType") int billType, @PathVariable("id") int id,
			HttpServletRequest request, Model model) {
		String pageNum = request.getParameter("pageNum");
		String pageSize = request.getParameter("pageSize");
		PageHelper.startPage(getPageNum(pageNum), getPageSize(pageSize));
		List<Toll> list = null;
		if (billType == 1) {// 房屋
			list = tollService.tollhistoryfanid(id);
		} else if (billType == 2) {// 车位
			list = tollService.tollhistoryparkid(id);
		} else if (billType == 3) {// 车辆
			list = tollService.tollhistoryvehicid(id);
		}
		list = bandingjion(list);
		for (Toll tols : list) {
			Unpaidbills unpaid = unpaidbillsService.selectByPrimaryKey(tols.getUanpaid());
			tols.setUnpaidbills(unpaid);
		}
		PageInfo<Toll> page = new PageInfo<Toll>(list);
		page.setPageNum(getPageNum(pageNum));
		thisEndSizeNum(pageNum, pageSize);
		PageInfo2 page2 = new PageInfo2(page, page.getPageNum());
		int selectnum[] = { 6, 8, 12, 16 };// 设置下来框里的数
		page2.setSelectnum(selectnum);
		page2.setSize(page.getPageSize());
		model.addAttribute("page", page);
		model.addAttribute("page2", page2);
		return "toll/cost_lishi";
	}

	// 查看删除的记录
	// 查看全部回收站的记录
	@RequestMapping("/recyclebin")
	public String recyclebin(Toll toll, Model model, HttpServletRequest request) {
		String pageNum = request.getParameter("pageNum");
		String pageSize = request.getParameter("pageSize");
		PageHelper.startPage(getPageNum(pageNum), getPageSize(pageSize));
		List<Unpaidbills> list = unpaidbillsService.selectDelAll(toll);
		PageInfo<Unpaidbills> page = new PageInfo<Unpaidbills>(list);
		page.setPageNum(getPageNum(pageNum));
		thisEndSizeNum(pageNum, pageSize);
		PageInfo2 page2 = new PageInfo2(page, page.getPageNum());
		int selectnum[] = { 6, 8, 12, 16 };// 设置下来框里的数
		page2.setSelectnum(selectnum);
		page2.setSize(page.getPageSize());
		model.addAttribute("mohuselect", toll);// 传回条件参数
		model.addAttribute("page", page);
		model.addAttribute("page2", page2);
		return "toll/payed_deleted";
	}

	// 恢复删除的记录
	@RemoteMethod
	public int huifeijilv(int unpaid) {
		int count = unpaidbillsService.NoupdateUnpaid(unpaid);
		return count;
	}

	@RemoteMethod // 查询全部临时收费项目
	public List<Priceproject> selectYajinPrice() {
		return priceprojectService.selectPriceTypeAll();
	}

	@RemoteMethod // 根据收费项目找全部收费标准
	public List<Chargs> selectChargpid(int pid) {
		return chargsService.selectPidduiCharg(pid);
	}

	@RemoteMethod // 根据收费标准查单价，数量，和总额
	public Chargs selectChargid(int cid) {
		return chargsService.SelectChargId(cid);
	}

	@RemoteMethod // 根据小区id查房号
	public List<HouseFan> selectfanNum(int disid) {
		return housefanService.selectDisid(disid);
	}

	@RemoteMethod // 根据小区id查车位
	public List<ParkingSpace> selectParkNum(int disid) {
		return parkingspaceService.selectdisid(disid);
	}

	@RemoteMethod // 根据小区id查车位，在查相应的车牌号
	public List<Vehicle> selectVehicle(int disid) {
		List<ParkingSpace> parklist = parkingspaceService.selectdisid(disid);
		List<Vehicle> vehiclist = new ArrayList<Vehicle>();
		for (ParkingSpace park : parklist) {
			List<Vehicle> vlist = vehiclemanagerService.selectVehicle(park.getParkid());
			for (Vehicle vehic : vlist) {
				vehiclist.add(vehic);
			}
		}
		return vehiclist;
	}

	int endPageNum = 0;
	int endPageSize = 0;// 设置两个全局变量存取页数，防止分页时出错，读取错误信息

	public int getPageNum(String pageNum) {// 转义并检查当前条数是否出错。
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

	public int getPageSize(String pageSize) {// 转义并检查每页条数是否出错。
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
