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
	@Autowired // ����շ���Ŀ�ķ��񷽷�
	private PriceprojectService priceprojectService;
	@Autowired // ����շѱ�׼�ķ��񷽷�
	private ChargsService chargsService;
	@Autowired // ��Ź����շѹ�ʽ�ķ��񷽷�
	private FormulaService formulaService;
	@Autowired // ��ų���¼��ķ��񷽷�
	private TablemanagerService tablemanagerService;
	@Autowired // ���С�����ݵķ��񷽷�
	private HouseFanService housefanService;
	@Autowired // ���С��¥��ķ��񷽷�
	private HouseLouService houselouService;
	@Autowired // �������δ���˵��ķ���
	private TollService tollService;
	@Autowired // ��ų�λ�ķ���
	private ParkingSpaceService parkingspaceService;
	@Autowired // ��ų����ķ���
	private VehicleService vehiclemanagerService;
	@Autowired // ������ҵ���ķ���
	private OwnersService ownersService;
	@Autowired // �����ʱ�շ���Ӧ��Ϣ��
	private TemporaryService temporaryService;
	@Autowired // ��Ű��շ������Ϣ
	private Ban_chargsService ban_chargsService;
	@Autowired // ����ѽ��˵��ķ�����Ϣ
	private UnpaidbillsService unpaidbillsService;
	@Autowired // ���ڴ��Ԥ�����Ϣ�ķ���
	private PredepositService predepositService;
	@Autowired // ��ס����
	private BindingService bindingService;
	// �շѹ�ʽ������
	FormulaPage fpage = new FormulaPage();

	// 404������ת��ҳ��
	@RequestMapping("/error4")
	public String error4() {
		return "404";
	}

	// 500����ת��ҳ��
	@RequestMapping("/error5")
	public String error5() {
		return "500";
	}

	// �ų������ѯ�շ����Ƿ��Ѵ���
	@RemoteMethod
	public int ispricename(int priceid, String pricename) {
		Priceproject pro = new Priceproject();
		pro.setPriceid(priceid);
		pro.setPricename(pricename);
		return priceprojectService.selectProname(pro);
	}

	// ��ѯ��ʽ���Ƿ��Ѵ���
	@RemoteMethod
	public int isformulaname(String formulaname) {
		return formulaService.selectFormulaname(formulaname);
	}

	// �ų������ѯ��ʽ���Ƿ��Ѵ���
	@RemoteMethod
	public int isformulaName(int formulaid, String formualname) {
		Formula formula = new Formula();
		formula.setFormulaid(formulaid);
		formula.setFormulaname(formualname);
		return formulaService.selectFormulaName(formula);
	}

	// ��ѯ�����շ���Ŀ���Ӧ���շѱ�׼
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
		PageInfo2 page2 = new PageInfo2(page, page.getPageNum());// ��ҳ�����������򹤾���
		int selectnum[] = { 6, 8, 12, 16 };// ���������������
		page2.setSelectnum(selectnum);
		page2.setSize(page.getPageSize());
		model.addAttribute("mohuselect", priceproject);// ������������
		model.addAttribute("page", page);
		model.addAttribute("page2", page2);
		return "toll/cost_shoufei";
	}

	// ��ת������շ���Ŀҳ��
	@RequestMapping("/priceinsert")
	public String insertView() {
		return "toll/add_cost_template";
	}

	// ���������Ŀ
	@RequestMapping("/priceadd")
	public String addprice(Priceproject price, Model model) {
		priceprojectService.Insertprice(price);
		return "redirect:priceAll";
	}

	// ��ѯ����ת���༭�շ���Ŀ
	@RequestMapping("/priceedit")
	public String editprice(int priceid, Model model) {
		Priceproject price = priceprojectService.Selectpriceid(priceid);
		model.addAttribute("price", price);
		return "toll/edit_cost_template";
	}

	// �ж��շ���Ŀ�Ƿ����
	@RemoteMethod
	public int ispricename(String pricename) {
		return priceprojectService.selectPrname(pricename);
	}

	// �����շ���Ŀ
	@RequestMapping("/priceupdate")
	public String updateprice(Priceproject price) {
		priceprojectService.Updateprice(price);
		return "redirect:priceAll";
	}

	// ɾ���շ���Ŀ
	@RequestMapping("/pricedelete")
	public String delprice(int priceid, Model model) {
		priceprojectService.Deleteprice(priceid);
		return "redirect:priceAll";
	}

	// �첽���շ���Ŀ
	@RemoteMethod
	public List<Priceproject> yipriceAll() {
		return priceprojectService.SelectpriceAll();
	}

	// ����շѱ�׼
	@RequestMapping("/chargadd")
	public String addChargs(Chargs chargs) {
		chargsService.InsertChargs(chargs);
		return "redirect:priceAll";
	}

	// �༭�շѱ�׼
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

	// ɾ���շѱ�׼
	@RequestMapping("/chargdel")
	public String delChargs(int chargid) {
		chargsService.DeleteChargs(chargid);
		return "redirect:priceAll";
	}

	@RemoteMethod // �첽��ȡȫ���շѱ�׼
	public List<Chargs> chargyiAllid(int priceid) {
		return chargsService.selectPidduiCharg(priceid);
	}

	@RemoteMethod // ��Է��ݴ�����շѱ�׼
	public List<Chargs> chargFanAllid(int priceid) {
		return chargsService.selectTaskfanid(priceid);
	}

	@RemoteMethod // ��Գ�λ������շѱ�׼
	public List<Chargs> chargParkAllid(int priceid) {
		return chargsService.selectTaskparkid(priceid);
	}

	@RemoteMethod // ��Գ���������շѱ�׼
	public List<Chargs> chargVehicAllid(int priceid) {
		return chargsService.selectTaskvehicid(priceid);
	}

	// �첽������Ŀid��������Զ��幫ʽ���շѱ�׼
	@RemoteMethod
	public List<Chargs> chargyiid(int priceid) {
		return chargsService.selectProForid(priceid);
	}

	// ��ѯȫ����ʽ
	@RequestMapping("/formulaAll")
	public String allformula(Formula formula, Model model, HttpServletRequest request) {
		String pageNum = request.getParameter("pageNum");
		String pageSize = request.getParameter("pageSize");
		PageHelper.startPage(getPageNum(pageNum), getPageSize(pageSize));
		List<Formula> list = formulaService.selectGaoJiAll(formula);
		PageInfo<Formula> page = new PageInfo<Formula>(list);
		page.setPageNum(getPageNum(pageNum));
		thisEndSizeNum(pageNum, pageSize);
		PageInfo2 page2 = new PageInfo2(page, page.getPageNum());// ��ҳ�����������򹤾���
		int selectnum[] = { 6, 8, 12, 16 };// ���������������
		page2.setSelectnum(selectnum);
		page2.setSize(page.getPageSize());
		model.addAttribute("mohuselect", formula);// ������������
		model.addAttribute("page", page);
		model.addAttribute("page2", page2);
		return "toll/formula";
	}

	// ������ӹ�ʽ
	@RequestMapping("/insertformula")
	public String insertformula() {
		return "toll/add_formula";
	}

	// ������ӹ�ʽ
	@RequestMapping("/addformula")
	public String addformula(Formula formula) {
		formulaService.insertfor(formula);
		return "redirect:formulaAll";
	}

	// �����༭ҳ��
	@RequestMapping("/eidtformula")
	public String editformula(int forid, Model model) {
		Formula formula = formulaService.findid(forid);
		model.addAttribute("formula", formula);
		return "toll/edit_formula";
	}

	// �������
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

	// �첽��ȡȫ����ʽ
	@RemoteMethod
	public List<Formula> yibuFormulaAll() {
		List<Formula> list = formulaService.selectAll();
		return list;
	}

	// �첽��ȡȫ����ʽ
	@RemoteMethod
	public Formula yibuFormulaid(int forid) {
		return formulaService.findid(forid);
	}

	// ��ѯȫ���ĳ����¼
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
		PageInfo2 page2 = new PageInfo2(page, page.getPageNum());// ��ҳ�����������򹤾���
		int selectnum[] = { 6, 8, 12, 16 };// ���������������
		page2.setSelectnum(selectnum);
		page2.setSize(page.getPageSize());
		model.addAttribute("mohuselect", tab);// ������������
		model.addAttribute("page", page);
		model.addAttribute("page2", page2);
		return "toll/data_entry";
	}

	// ��ӳ����¼
	@RequestMapping("/tableadd")
	public String tableAdd(Tablemanager tablemanager) {
		tablemanagerService.inserttab(tablemanager);
		Toll toll = new Toll();
		toll.setZtype(1);// ����Ĭ�϶��Ƿ����͵�
		toll.setDisid(tablemanager.getTabDisId());
		toll.setPriceid(tablemanager.getTabPriceId());
		toll.setChargid(tablemanager.getTabChargId());
		List<Owners> owners = ownersService.selectFanid(tablemanager.getTabFanId());
		if (owners != null && owners.size() != 0) {
			toll.setOid(owners.get(0).getOid());
		}
		toll.setFanId(tablemanager.getTabFanId());
		Chargs chargs = chargsService.SelectChargId(tablemanager.getTabChargId());
		int formulaid = chargs.getFormula_id();// ���ֻ��¼���Զ��幫ʽ���շѱ�׼
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

	// �޸ĳ����¼
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

	// ��ѯ��ǰ�û����շѱ�׼��Ӧ��������
	@RemoteMethod
	public List<Tablemanager> chargidend(Tablemanager tablemanager) {
		List<Tablemanager> list = tablemanagerService.selectChargidEndnum(tablemanager);
		return list;
	}

	// һ������һ��ֻ�ܳ���¼��һ��
	@RemoteMethod
	public int Tollmonths(Tablemanager tablemanager) {
		int count = tablemanagerService.selectTongMonths(tablemanager);
		return count;
	}

	// Ԥ����ѯ
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
		PageInfo2 page2 = new PageInfo2(page, page.getPageNum());// ��ҳ�����������򹤾���
		int selectnum[] = { 6, 8, 12, 16 };// ���������������
		page2.setSelectnum(selectnum);
		page2.setSize(page.getPageSize());
		model.addAttribute("mohuselect", predeposit);// ������������
		model.addAttribute("page", page);
		model.addAttribute("page2", page2);
		return "toll/yucunkuan";
	}

	// Ԥ����ֵ
	@RequestMapping("/PredAdd")
	public String PredeAdd(Predeposit predeposit, Model model) {
		predepositService.insertSelective(predeposit);
		return "redirect:selectPredAll";
	}

	@RequestMapping("/PredTuiKuan") // ���ڴ����˿�
	public String PredTuikuan(Predeposit predeposit) {
		String remark = "�˿���:" + predeposit.getPredTuiname() + " �ֻ���:" + predeposit.getPredTuiphone() + " ��ע:"
				+ predeposit.getPredTuiremark();
		predeposit.setPredRemark(remark);
		predeposit.setPredMoney(-predeposit.getPredMoney());
		predeposit.setPredType(2);
		predepositService.insertSelective(predeposit);
		return "redirect:selectPredAll";
	}

	@RemoteMethod // �鿴��ʣ���
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
		int selectnum[] = { 6, 8, 12, 16 };// ���������������
		page2.setSelectnum(selectnum);
		page2.setSize(page.getPageSize());
		model.addAttribute("mohuselect", predeposit);// ������������
		model.addAttribute("page", page);
		model.addAttribute("page2", page2);
		return "toll/yucunkun_detail";
	}

	// Ԥ����¼��ѯ
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
		int selectnum[] = { 6, 8, 12, 16 };// ���������������
		page2.setSelectnum(selectnum);
		page2.setSize(page.getPageSize());
		model.addAttribute("mohuselect", predeposit);// ������������
		model.addAttribute("page", page);
		model.addAttribute("page2", page2);
		return "toll/yucunkuan_entry";
	}

	// ��ѯ����δ���˵�
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
		int selectnum[] = { 6, 8, 12, 16 };// ���������������
		page2.setSelectnum(selectnum);
		page2.setSize(page.getPageSize());
		model.addAttribute("mohuselect", toll);// ������������
		model.addAttribute("page", page);
		model.addAttribute("page2", page2);
		return "toll/unpay_house";
	}

	// ��Ϣ�ؼ��������鿴�󶨵�һЩֵ�뷽��
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
			if (toll.getBcId() != null) {// ���Ƕ��r���ɵģ��t�Д��Л]�ж�Ӧ�󶨵�ҵ��
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

	// ɾ��δ���˵�
	@RequestMapping("/deleteWeij")
	@ResponseBody
	public List<String> deleteWeij(int tollid) {
		tollService.deleteByPrimaryKey(tollid);
		return new ArrayList<String>();
	}

	@RequestMapping("/costCenter")//��������̨
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

	@RequestMapping(value = "/checkoutids/{billType}/{id}") // �����˵�id�����˵����Ͳ鿴���Ӧ�������˵�
	public String shouying(@PathVariable("billType") int billType, @PathVariable("id") int id, Toll toll, Model model,
			HttpServletRequest request) {
		String pageNum = request.getParameter("pageNum");
		String pageSize = request.getParameter("pageSize");
		List<Toll> list = null;
		PageHelper.startPage(getPageNum(pageNum), getPageSize(pageSize));
		if (billType == 1) {// ����
			list = tollService.selectTollfanid(id);
		} else if (billType == 2) {// ��λ
			list = tollService.selectTollparkid(id);
		} else if (billType == 3) {// ����
			list = tollService.selectTollvehicid(id);
		}
		list = bandingjion(list);
		PageInfo<Toll> page = new PageInfo<Toll>(list);
		page.setPageNum(getPageNum(pageNum));
		thisEndSizeNum(pageNum, pageSize);
		PageInfo2 page2 = new PageInfo2(page, page.getPageNum());
		int selectnum[] = { 6, 8, 12, 16 };// ���������������
		page2.setSelectnum(selectnum);
		page2.setSize(page.getPageSize());
		model.addAttribute("page", page);
		model.addAttribute("page2", page2);
		model.addAttribute("isower", false);
		return "toll/cost_center_detail";
	}

	@RequestMapping(value = "/checkoutower/{owerid}") // ��ѯ����û����˵���Ϣ
	public String shouyingower(@PathVariable("owerid") int owerid, Toll toll, Model model, HttpServletRequest request) {
		String pageNum = request.getParameter("pageNum");
		String pageSize = request.getParameter("pageSize");
		PageHelper.startPage(getPageNum(pageNum), getPageSize(pageSize));
		List<Toll> list = tollService.selectTollowerid(owerid);
		if (list.size() == 0) {
			Owners owners = ownersService.selectOwerid(owerid);// ��ȡ������ҵ����Ϣ
			PageHelper.startPage(getPageNum(pageNum), getPageSize(pageSize));
			list = tollService.selectTollfanid(owners.getFanid());
		}
		list = bandingjion(list);
		for (Toll tol : list) {
			List<Owners> onslist = new ArrayList<Owners>();// ���ڴ洢Ҫɾ���ģ�ֱ��remove�ᱣ��
			for (Owners own : tol.getOwnerlist()) {
				if (own.getOid() != owerid) {
					onslist.add(own);
				}
			}
			tol.getOwnerlist().removeAll(onslist);// �Ƴ���Ҫɾ��
		}
		PageInfo<Toll> page = new PageInfo<Toll>(list);
		page.setPageNum(getPageNum(pageNum));
		thisEndSizeNum(pageNum, pageSize);
		PageInfo2 page2 = new PageInfo2(page, page.getPageNum());
		int selectnum[] = { 6, 8, 12, 16 };// ���������������
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
		model.addAttribute("isower", true);// ������ͨ��ס��
		return "toll/cost_center_detail";
	}

	@RequestMapping("/payment") // ȷ���շ�
	public String cashierid(HttpServletRequest request,Unpaidbills unpaidbills) {
		Owners owners=(Owners) request.getSession().getAttribute("owners");
		if(unpaidbills.getTotalYc()>0){
			Predeposit predeposit=new Predeposit();
			String remark = "�ɷѵֿ�:" + unpaidbills.getTotalYc() +" ҵ��:"+owners.getOwername()+" ��ע:"
					+ unpaidbills.getRemark();
			predeposit.setPredRemark(remark);
			predeposit.setPredOid(owners.getOid());
			predeposit.setPredDisId(owners.getDisid());
			predeposit.setPredMoney(-unpaidbills.getTotalYc());
			predeposit.setPredType(3);//����ֿ�
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

	@RequestMapping("/selectyijiluAll") // ��ѯȫ���ѽ���Ϣ
	public String selectyijiluAll(Toll toll, Model model, HttpServletRequest request) {
		String pageNum = request.getParameter("pageNum");
		String pageSize = request.getParameter("pageSize");
		PageHelper.startPage(getPageNum(pageNum), getPageSize(pageSize));
		List<Unpaidbills> list = unpaidbillsService.selectGaojiAll(toll);
		PageInfo<Unpaidbills> page = new PageInfo<Unpaidbills>(list);
		page.setPageNum(getPageNum(pageNum));
		thisEndSizeNum(pageNum, pageSize);
		PageInfo2 page2 = new PageInfo2(page, page.getPageNum());
		int selectnum[] = { 6, 8, 12, 16 };// ���������������
		page2.setSelectnum(selectnum);
		page2.setSize(page.getPageSize());
		model.addAttribute("mohuselect", toll);// ������������
		model.addAttribute("page", page);
		model.addAttribute("page2", page2);
		return "toll/payed";
	}

	@RequestMapping("/editunpaid/{unpaid}") // �����ѽ�id��ѯ�����˵���Ϣ
	public String editunpaid(@PathVariable("unpaid") int unpaid, Model model) {
		Unpaidbills unpaidbills = unpaidbillsService.selectUnpaids(unpaid);
		unpaidbills.setTolllist(bandingjion(unpaidbills.getTolllist()));// ��װһ���˵�
		// ��ҵ��id��Ϊ�գ���˵���ж�Ӧ��ҵ������Ҫ����Ӧ��¥����ҵ����Ϣ����ȥ
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

	@RequestMapping("/yituiunpaid/{unpaid}") // �����ѽ�id��ѯ�˷������˵���Ϣ
	public String yitui(@PathVariable("unpaid") int unpaid, Model model) {
		Unpaidbills unpaidbills = unpaidbillsService.selectYiTuiUnpaids(unpaid);
		unpaidbills.setTolllist(bandingjion(unpaidbills.getTolllist()));// ��װһ���˵�
		// ��ҵ��id��Ϊ�գ���˵���ж�Ӧ��ҵ������Ҫ����Ӧ��¥����ҵ����Ϣ����ȥ
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

	// �����ѽ�id��ѯ�����˵���Ϣ
	@RemoteMethod
	public Unpaidbills yifuunpaid(int unpaid) {
		Unpaidbills unpaidbills = unpaidbillsService.selectTuiUnpaids(unpaid);
		if (unpaidbills != null) {
			unpaidbills.setTolllist(bandingjion(unpaidbills.getTolllist()));// ��װһ���˵�
			// ��ҵ��id��Ϊ�գ���˵���ж�Ӧ��ҵ������Ҫ����Ӧ��¥����ҵ����Ϣ����ȥ
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

	// ��ӡ
	@RequestMapping("/dayin")
	public String dayin(int unpaid, Model model) {
		Unpaidbills unpaidbills = unpaidbillsService.selectDayinunpaid(unpaid);
		if (unpaidbills != null) {
			unpaidbills.setTolllist(bandingjion(unpaidbills.getTolllist()));// ��װһ���˵�
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
	//��ӡδ�ɼ�¼
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
	
	// ɾ���ѽɼ�¼��ת�����վ
	@RemoteMethod
	public int UnpaidDel(int unpaid) {
		int count = unpaidbillsService.deleteByPrimaryKey(unpaid);
		return count;
	}
	//�U�M֪ͨ
	@RequestMapping("/costNotice")
	public String jiaofei(){
		return "toll/cost_notice";
	}

	// �˿�
	@RequestMapping("/refund")
	public String Dealwithrefund(Unpaidbills unpaidbills) {
		List<Toll> list = new ArrayList<Toll>();
		for (int i = 0; i < unpaidbills.getTolids().length; i++) {
			tollService.tollupstatus(unpaidbills.getTolids()[i]);
			list.add(tollService.selectByPrimaryKey(unpaidbills.getTolids()[i]));
		}
		unpaidbillsService.Upunpidstatus(unpaidbills.getUnpaid());// ��֮ǰ���Խ�״̬��Ϊ����
		long totalmoney = 0, totalznj = 0, totalyc = 0, totalyjmoney = 0;
		for (Toll toll : list) {
			totalmoney += toll.getSubtotal();// ��Ӧ��
			totalznj += toll.getZhina();// ������
			totalyc += toll.getYuck();// ��Ԥ��
			totalyjmoney += (toll.getSubtotal() + toll.getZhina() - toll.getYuck() - toll.getYoufei());// ��Ӧ��
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
		unpaidbills.setStatus(1);// ����Ϊ�˷�
		unpaidbillsService.insertSelective(unpaidbills);
		for (Toll toll : list) {
			toll.setUanpaid2(unpaidbills.getUnpaid());
			tollService.updateByPrimaryKeySelective(toll);
		}
		return "redirect:selectyijiluAll";
	}

	// ��ѯ�Խɼ�¼
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
		int selectnum[] = { 6, 8, 12, 16 };// ���������������
		page2.setSelectnum(selectnum);
		page2.setSize(page.getPageSize());
		model.addAttribute("mohuselect", toll);// ������������
		model.addAttribute("page", page);
		model.addAttribute("page2", page2);
		return "toll/payed_detail";
	}

	// ��ʱ�շ����
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

	// ����ҵ��id����ʷ�ɷ�
	@RequestMapping("/tollDetail/{oid}")
	public String tollHistoryOid(@PathVariable("oid") int oid, HttpServletRequest request, Model model) {
		String pageNum = request.getParameter("pageNum");
		String pageSize = request.getParameter("pageSize");
		PageHelper.startPage(getPageNum(pageNum), getPageSize(pageSize));
		List<Toll> list = tollService.tollhistoryOid(oid);
		if (list.size() == 0) {
			Owners owners = ownersService.selectOwerid(oid);// ��ȡ������ҵ����Ϣ
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
		int selectnum[] = { 6, 8, 12, 16 };// ���������������
		page2.setSelectnum(selectnum);
		page2.setSize(page.getPageSize());
		model.addAttribute("page", page);
		model.addAttribute("page2", page2);
		return "toll/cost_lishi";
	}

	// �鿴�ʵ��ɷѵ���ʷ��¼
	@RequestMapping("/tollDetail/{billType}/{id}")
	public String tollHistoryNoid(@PathVariable("billType") int billType, @PathVariable("id") int id,
			HttpServletRequest request, Model model) {
		String pageNum = request.getParameter("pageNum");
		String pageSize = request.getParameter("pageSize");
		PageHelper.startPage(getPageNum(pageNum), getPageSize(pageSize));
		List<Toll> list = null;
		if (billType == 1) {// ����
			list = tollService.tollhistoryfanid(id);
		} else if (billType == 2) {// ��λ
			list = tollService.tollhistoryparkid(id);
		} else if (billType == 3) {// ����
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
		int selectnum[] = { 6, 8, 12, 16 };// ���������������
		page2.setSelectnum(selectnum);
		page2.setSize(page.getPageSize());
		model.addAttribute("page", page);
		model.addAttribute("page2", page2);
		return "toll/cost_lishi";
	}

	// �鿴ɾ���ļ�¼
	// �鿴ȫ������վ�ļ�¼
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
		int selectnum[] = { 6, 8, 12, 16 };// ���������������
		page2.setSelectnum(selectnum);
		page2.setSize(page.getPageSize());
		model.addAttribute("mohuselect", toll);// ������������
		model.addAttribute("page", page);
		model.addAttribute("page2", page2);
		return "toll/payed_deleted";
	}

	// �ָ�ɾ���ļ�¼
	@RemoteMethod
	public int huifeijilv(int unpaid) {
		int count = unpaidbillsService.NoupdateUnpaid(unpaid);
		return count;
	}

	@RemoteMethod // ��ѯȫ����ʱ�շ���Ŀ
	public List<Priceproject> selectYajinPrice() {
		return priceprojectService.selectPriceTypeAll();
	}

	@RemoteMethod // �����շ���Ŀ��ȫ���շѱ�׼
	public List<Chargs> selectChargpid(int pid) {
		return chargsService.selectPidduiCharg(pid);
	}

	@RemoteMethod // �����շѱ�׼�鵥�ۣ����������ܶ�
	public Chargs selectChargid(int cid) {
		return chargsService.SelectChargId(cid);
	}

	@RemoteMethod // ����С��id�鷿��
	public List<HouseFan> selectfanNum(int disid) {
		return housefanService.selectDisid(disid);
	}

	@RemoteMethod // ����С��id�鳵λ
	public List<ParkingSpace> selectParkNum(int disid) {
		return parkingspaceService.selectdisid(disid);
	}

	@RemoteMethod // ����С��id�鳵λ���ڲ���Ӧ�ĳ��ƺ�
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
	int endPageSize = 0;// ��������ȫ�ֱ�����ȡҳ������ֹ��ҳʱ������ȡ������Ϣ

	public int getPageNum(String pageNum) {// ת�岢��鵱ǰ�����Ƿ����
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

	public int getPageSize(String pageSize) {// ת�岢���ÿҳ�����Ƿ����
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
