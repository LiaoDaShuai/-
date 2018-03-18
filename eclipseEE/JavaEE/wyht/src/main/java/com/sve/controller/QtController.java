package com.sve.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sve.datacenter.model.Binding;
import com.sve.datacenter.model.HouseFan;
import com.sve.datacenter.model.Owners;
import com.sve.datacenter.service.Ban_chargsService;
import com.sve.datacenter.service.BindingService;
import com.sve.datacenter.service.HouseFanService;
import com.sve.datacenter.service.HouseLouService;
import com.sve.datacenter.service.OwnersService;
import com.sve.datacenter.service.ParkingSpaceService;
import com.sve.datacenter.service.VehicleService;
import com.sve.lifeservice.model.Announce;
import com.sve.lifeservice.service.AnnounceService;
import com.sve.staff.model.Cmplaints;
import com.sve.staff.model.Cmptype;
import com.sve.staff.model.Message;
import com.sve.staff.model.News;
import com.sve.staff.model.Newtype;
import com.sve.staff.model.Warranty;
import com.sve.staff.model.Wartype;
import com.sve.staff.service.CmplaintsService;
import com.sve.staff.service.CmptypeService;
import com.sve.staff.service.MessageService;
import com.sve.staff.service.NewsService;
import com.sve.staff.service.NewtypeService;
import com.sve.staff.service.WarrantyService;
import com.sve.staff.service.WartypeService;
import com.sve.toll.model.Predeposit;
import com.sve.toll.model.Temporary;
import com.sve.toll.model.Toll;
import com.sve.toll.model.Unpaidbills;
import com.sve.toll.service.PredepositService;
import com.sve.toll.service.PriceprojectService;
import com.sve.toll.service.TablemanagerService;
import com.sve.toll.service.TemporaryService;
import com.sve.toll.service.TollService;
import com.sve.toll.service.UnpaidbillsService;
import com.sve.util.FormulaPage;
import com.sve.util.PageInfo2;

@RequestMapping("qt")
@RemoteProxy(name = "qtController")
@Controller
public class QtController {
	@Autowired
	private AnnounceService announceService;
	@Autowired
	private MessageService messageService;
	@Autowired
	private UnpaidbillsService unpaidbillsService;
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
	@Autowired // ���ڴ��Ԥ�����Ϣ�ķ���
	private PredepositService predepositService;
	@Autowired
	private WartypeService wartypeService;// ��������
	@Autowired
	private WarrantyService warrantyService;// ����
	@Autowired
	private CmptypeService cmptypeService;//Ͷ������
	@Autowired
	private CmplaintsService cmplainsService;//Ͷ��
	@Autowired // ��ס����
	private BindingService bindingService;
	@Autowired // ����շ���Ŀ�ķ��񷽷�
	private PriceprojectService priceprojectService;
	@Autowired
	private NewtypeService newtypeService;
	@Autowired
	private NewsService newsService;
	// �շѹ�ʽ������
	FormulaPage fpage = new FormulaPage();

	@RequestMapping("/newsTypeAll")
	@ResponseBody
	public List<Newtype> newsTypeAll(HttpServletResponse response){
		return newtypeService.selectNtAll();
	}
	
	@RequestMapping("/newsTypeId")
	@ResponseBody
	public List<News> newsTypeId(HttpServletRequest request,HttpServletResponse response){
		System.out.println(request.getParameter("ntids"));
		return newsService.selectNewTypeId(Integer.parseInt(request.getParameter("ntids")));
	}
	
	@RequestMapping("/newsAll")
	@ResponseBody
	public List<News> newsAll(HttpServletRequest request,HttpServletResponse response){
		return newsService.selectNewAll();
	}
	
	@RequestMapping("/newsId")
	@ResponseBody
	public News newsId(HttpServletRequest request,HttpServletResponse response){
		System.out.println(request.getParameter("ids"));
		return newsService.selectByPrimaryKey(Integer.parseInt(request.getParameter("ids")));
	}
	@RequestMapping("/newsMohu")
	@ResponseBody
	public List<News> newsMohu(HttpServletRequest request,HttpServletResponse response){
		System.out.println(request.getParameter("keyword"));
		return newsService.selectNewMohu(request.getParameter("keyword"));
	}
	
	//����΢��С��������
	@RequestMapping("/testWx")
	@ResponseBody
	public List<Announce> testWx(HttpServletResponse response){
		 /* ������Ӧͷ����ajax������� */  
//        response.setHeader("Access-Control-Allow-Origin", "*");  
        /* �Ǻű�ʾ���е��������󶼿��Խ��ܣ� */  
//        response.setHeader("Access-Control-Allow-Methods", "GET,POST");  
		return announceService.selectAnnounce();
	}
	
	// ��ҳ
	@RequestMapping("/index")
	public String index(HttpServletRequest request, Model model) {
		Owners owners = (Owners) request.getSession().getAttribute("owners");
		List<Announce> list = null;
		if (owners != null) {// Ϊ�û���¼
			list = announceService.selectADorder(owners.getDisid());
		} else {
			list = announceService.selectADyk();
		}
		model.addAttribute("annlist", list);
		return "qtpage/index";
	}

	// ��������
	@RequestMapping("/gywm")
	public String gywm(HttpServletRequest request, Model model) {
		return "qtpage/communityintroduction";
	}

	// �������
	@RequestMapping("/ggall")
	public String ggall(Model model) {
		List<Announce> list = announceService.selectADyk();
		model.addAttribute("annall", list);
		return "qtpage/announcement";
	}

	// ���ظ��๫��
	@RequestMapping("/ggallload")
	public String ggallload(Model model) {
		List<Announce> list = announceService.selectAnnounce();
		model.addAttribute("annall", list);
		return "qtpage/announcement";
	}

	@RequestMapping("showann/{annId}")
	public String showann(@PathVariable("annId") int annId, Model model) {
		Announce ann = announceService.selectAnnounceById(annId);
		announceService.updateCount(annId);// �޸��������
		model.addAttribute("ann", ann);
		return "qtpage/showann";
	}

	// ��������
	@RequestMapping("/newall")
	public String newall() {
		return "qtpage/news";
	}

	// ҵ������
	@RequestMapping("/service")
	public String service() {
		return "qtpage/standing";
	}

	// ��������
	@RequestMapping("/addwm")
	public String addwm() {
		return "qtpage/career";
	}

	// ��ϵ����
	@RequestMapping("/lxwm")
	public String lxwm() {
		return "qtpage/contact";
	}

	// ���Ž���
	@RequestMapping("/jtjs")
	public String jtjs() {
		return "qtpage/communityintroduction";
	}

	// ���ż�ֵ��
	@RequestMapping("/jtjzg")
	public String jtjzg() {
		return "qtpage/corevalues";
	}

	// ͨ�����
	@RequestMapping("/tghz")
	public String tghz(HttpServletRequest request, Model model) {
		Owners owners = (Owners) request.getSession().getAttribute("owners");
		List<Message> list = null;
		if (owners != null) {
			list = messageService.selectTg(owners.getOid());
		}
		model.addAttribute("messlist", list);
		return "qtpage/notice";
	}

	// ���ظ���ͨ��
	@RequestMapping("/tghzload")
	public String tghzload(HttpServletRequest request, Model model) {
		Owners owners = (Owners) request.getSession().getAttribute("owners");
		List<Message> list = null;
		if (owners != null) {
			list = messageService.selectTgload(owners.getOid());
		}
		model.addAttribute("messlist", list);
		return "qtpage/notice";
	}

	// ��ʾ֪ͨ����
	@RequestMapping("shownotice/{mesId}")
	public String shownotice(@PathVariable("mesId") int mesId, Model model) {
		Message mess = messageService.selectByPrimaryKey(mesId);
		messageService.updateStatus(mesId);
		model.addAttribute("mess", mess);
		return "qtpage/shownotice";
	}

	// ý��㱨
	@RequestMapping("/mthb")
	public String mthb() {
		return "qtpage/media";
	}

	// ��Ƶ����
	@RequestMapping("/spzx")
	public String spzx() {
		return "qtpage/media";
	}

	// ¥��Ƽ�
	@RequestMapping("/lykj")
	public String lykj() {
		return "qtpage/standing";
	}

	// ���ݱ���
	@RequestMapping("/fwbx")
	public String fwbx(HttpServletRequest request, Model model) {
		Owners owners = (Owners) request.getSession().getAttribute("owners");
		List<Wartype> wts = null;
		List<HouseFan> nums = null;
		if (owners != null) {
			wts = wartypeService.selectAll();
			nums = warrantyService.selectHNum(owners.getOid());
			model.addAttribute("ownerid", owners.getOid());
		}
		model.addAttribute("wartypes", wts);
		model.addAttribute("nums", nums);
		return "qtpage/maintain";
	}

	// �ύ���ݱ���
	//�ύ���ݱ���
	@RequestMapping("/addfwbx")
	public String addfwbx(HttpServletRequest request,Warranty war, MultipartFile input_file) throws Exception{
		Owners owners=(Owners)request.getSession().getAttribute("owners");
		if(!input_file.isEmpty()){
			String name=upload(request, input_file);
			war.setWarImg(name);
		}
		if(owners!=null){
			warrantyService.insertSelective(war);
		}
		return "redirect:fwbx";
	}
	// Ͷ��
	@RequestMapping("/cmplaint")
	public String cmplaint(HttpServletRequest request, Model model) {
		Owners owners = (Owners) request.getSession().getAttribute("owners");
		List<Cmptype> cts = null;
		if (owners != null) {
			cts = cmptypeService.selectAll();
			model.addAttribute("ownerid", owners.getOid());
		}
		model.addAttribute("cmptypes", cts);
		return "qtpage/cmplaint";
	}

	// �ύͶ��
	@RequestMapping("/addcmplaint")
	public String addcmplaint(HttpServletRequest request, Cmplaints cmp, MultipartFile input_file) throws Exception {
		Owners owners = (Owners) request.getSession().getAttribute("owners");
		if (!input_file.isEmpty()) {
			String name = upload(request, input_file);
			cmp.setCmpImg(name);
		}
		if (owners != null) {
			cmplainsService.insertSelective(cmp);
		}
		return "redirect:cmplaint";
	}

	// ����ͼƬ
	public String upload(HttpServletRequest request, MultipartFile input_file) throws Exception {
		String name = input_file.getOriginalFilename();// ��ȡͼƬ����
		String url = "F:/Eclipse-workspace/wyht/src/main/webapp/img/";// request.getSession().getServletContext().getRealPath("/img/");//
																		// ����·��
		File file = new File(url);
		if (!file.exists()) {// ���Ŀ¼������
			file.mkdirs();// ����Ŀ¼
		}
		input_file.transferTo(new File(url + name));// �����ļ�
		return name;// ����ͼƬ����
	}

	// �ɷѷ���
	@RequestMapping("jffw")
	public String jffw(HttpServletRequest request, Model model) {
		Owners owners = (Owners) request.getSession().getAttribute("owners");
		List<Unpaidbills> unlist = null;
		List<Toll> list = null;
		if (owners != null) {
			String pageNum = request.getParameter("pageNum");
			String pageSize = request.getParameter("pageSize");
			PageHelper.startPage(getPageNum(pageNum), getPageSize(pageSize));
			list = tollService.selectTollowerid(owners.getOid());// ����ס��id���˵�
			if (list.size() == 0) {// ���û���˵�
				List<Binding> bindlist = bindingService.selecfanownid(owners.getOid());
				for (Binding bind : bindlist) {
					for (Toll tol : tollService.selectTollfanid(bind.getHouseId())) {// ��һ��Сbug��������������ڲ鷿id��û���˵���
						list.add(tol);
					}
				}
			}
			list = bandingjion(list);
			PageInfo<Toll> page = new PageInfo<Toll>(list);
			page.setPageNum(getPageNum(pageNum));
			thisEndSizeNum(pageNum, pageSize);
			PageInfo2 page2 = new PageInfo2(page, page.getPageNum());
			int selectnum[] = { 8, 12, 16, 20 };// ���������������
			page2.setSelectnum(selectnum);
			page2.setSize(page.getPageSize());
			Integer predcount = predepositService.selectgtMoney(owners.getDisid(), owners.getOid());
			if (predcount != null && !predcount.equals("") && predcount > 0) {
				model.addAttribute("predcount", predcount);
			}
			model.addAttribute("page", page);
			model.addAttribute("page2", page2);
			// �ѽ��˵�
			unlist = unpaidbillsService.selectTuiQt(owners.getOid());
			for (Unpaidbills unpaidbill : unlist) {
				System.out.println(unpaidbill.getTolllist().size());
				if (unpaidbill.getTolllist() != null && !unpaidbill.getTolllist().equals("")) {
					for (Toll tol : unpaidbill.getTolllist()) {
						if (tol.getTabId() != null) {
							tol.setTablemanager(tablemanagerService.selectid(tol.getTabId()));
						}
						if (tol.getPriceid() != null) {
							tol.setPriceproject(priceprojectService.Selectpriceid(tol.getPriceid()));
						}
					}
					bandingjion(unpaidbill.getTolllist());
				}
			}
		}
		model.addAttribute("unpaid", unlist);
		return "qtpage/payment";
	}

	@RequestMapping("/payment") // ȷ���շ�
	public String cashierid(HttpServletRequest request, Unpaidbills unpaidbills) {
		Owners owners = (Owners) request.getSession().getAttribute("owners");
		if (unpaidbills.getTotalYc() > 0) {
			Predeposit predeposit = new Predeposit();
			String remark = "�ɷѵֿ�:" + unpaidbills.getTotalYc() + " ҵ��:" + owners.getOwername() + " ��ע:"
					+ unpaidbills.getRemark();
			predeposit.setPredRemark(remark);
			predeposit.setPredOid(owners.getOid());
			predeposit.setPredDisId(owners.getDisid());
			predeposit.setPredMoney(-unpaidbills.getTotalYc());
			predeposit.setPredType(3);// ����ֿ�
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
		return "redirect:jffw";
	}

	// �˲�����
	@RequestMapping("rcln")
	public String rcln() {
		return "qtpage/career";
	}

	// У԰��Ƹ
	@RequestMapping("xyzp")
	public String xyzp() {
		return "qtpage/xiaoyuan";
	}

	// �����Ƹ
	@RequestMapping("shzp")
	public String shzp() {
		return "qtpage/shehui";
	}

	// �޸�����
	@RemoteMethod
	public int updatepwd(String opass, HttpServletRequest request) {
		Owners owner = (Owners) request.getSession().getAttribute("owners");
		owner.setOpass(opass);
		int count = ownersService.updateowpass(owner);
		request.getSession().removeAttribute("owners");
		return count;
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
		int size = 8;
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
