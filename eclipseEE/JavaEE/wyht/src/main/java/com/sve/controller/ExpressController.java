package com.sve.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sve.datacenter.service.DistrictService;
import com.sve.lifeservice.model.Courier;
import com.sve.lifeservice.model.Express;
import com.sve.lifeservice.model.ExpressCompany;
import com.sve.lifeservice.model.FundingDetails;
import com.sve.lifeservice.model.Storages;
import com.sve.lifeservice.service.CourierService;
import com.sve.lifeservice.service.ExpressCompanyService;
import com.sve.lifeservice.service.ExpressService;
import com.sve.lifeservice.service.FundingDetailsService;
import com.sve.lifeservice.service.StoragesService;
import com.sve.util.PageInfo2;

@Controller
@RemoteProxy(name="expressController")
public class ExpressController {
	@Autowired
	private ExpressService expressService;//快递代收
	
	@Autowired
	private ExpressCompanyService expressCompanyService;//快递公司
	
	@Autowired
	private CourierService courierService;//快递员
	
	@Autowired
	private FundingDetailsService fundingDetailsService;//资金明细
	
	@Autowired
	private StoragesService storagesService;//快递入库
	
	@Autowired
	private DistrictService districtService;//小区
	
	//资金明细
	@RequestMapping(value="/express/funds/{couId}")
	public String showFunds(HttpServletRequest request,Model model,@PathVariable("couId")int couId,int keywords){
		String pageNum=request.getParameter("pageNum");
		String pageSize=request.getParameter("pageSize");
		FundingDetails fds=new FundingDetails();
		fds.setFundingCouId(couId);
		fds.setKeywords(keywords);
		PageHelper.startPage(getPageNum(pageNum),getPageSize(pageSize));
		List<FundingDetails> list=fundingDetailsService.selectA(fds);
		int[] l = {4,6,8,10};
		PageInfo page=new PageInfo(list);
		page.setPageNum(getPageNum(pageNum));
		page.setPageSize(getPageSize(pageSize));
		thisEndSizeNum(pageNum,pageSize);
		PageInfo2 page2=new PageInfo2(page,page.getPageNum());
		page2.setSelectnum(l);
		page2.setSize(getPageSize(pageSize));
		model.addAttribute("page", page);
		model.addAttribute("page2", page2);
		model.addAttribute("keywords", keywords);
		model.addAttribute("cer", courierService.selectByPrimaryKey(couId));
		return "staff/kd_money";
	}
	
	//快递员
	@RequestMapping(value="/express/courier")
	public String showCourier(HttpServletRequest request,Courier cer,Model model){
		String pageNum=request.getParameter("pageNum");
		String pageSize=request.getParameter("pageSize");
		PageHelper.startPage(getPageNum(pageNum),getPageSize(pageSize));
		List<Courier> list=courierService.selectAll(cer);
		int[] l = {4,6,8,10};
		PageInfo page=new PageInfo(list);
		page.setPageNum(getPageNum(pageNum));
		page.setPageSize(getPageSize(pageSize));
		thisEndSizeNum(pageNum,pageSize);
		PageInfo2 page2=new PageInfo2(page,page.getPageNum());
		page2.setSelectnum(l);
		page2.setSize(page.getPageSize());
		model.addAttribute("page", page);
		model.addAttribute("page2", page2);
		model.addAttribute("cer", cer);
		return "staff/courier";
	}
	
	//初始化快递公司下拉框
	@RemoteMethod
	public List<ExpressCompany> selectECAll(){
		return expressCompanyService.selectECAll();
	}
	
	//添加快递员页面
	@RequestMapping(value="/express/addcourier")
	public String addCourier(){
		return "staff/add_courier";
	}
	
	//添加快递员
	@RequestMapping(value="/express/insertcourier")
	public String insertcourier(Courier cer){
		int i=courierService.insertSelective(cer);
		if(i!=0){
			i+=expressCompanyService.updateEC(cer.getCouExpgsId());
		}
		return "redirect:courier";
	}
	
	//查询快递员名称是否已存在
	@RemoteMethod
	public int select_couName(String couName){
		return courierService.selectCourierName(couName);
	}
	
	//查询快递员手机号是否已存在
	@RemoteMethod
	public int select_couPhone(String couPhone){
		return courierService.selectCourierPhone(couPhone);
	}
	
	//充值信息
	@RemoteMethod
	public Courier reCourier(int couId){
		return courierService.selectByPrimaryKey(couId);
	}
	
	//充值
	@RequestMapping(value="/express/courier_recharge")
	public String CRecharge(Courier cer){
		courierService.updateBalance(cer);
		FundingDetails fds=new FundingDetails();
		fds.setFundingCouId(cer.getCouId());
		fds.setFundingPrice(cer.getCouBalance());
		fundingDetailsService.insertSelective(fds);
		return "redirect:courier";
	}
	
	//编辑快递员页面
	@RequestMapping(value="/express/editcourier")
	public String editCourier(int couId,Model model){
		Courier cer=courierService.selectByPrimaryKey(couId);
		model.addAttribute("cer", cer);
		return "staff/edit_courier";
	}
	
	//修改快递员
	@RequestMapping(value="/express/updatecourier")
	public String updateCourier(Courier cer){
		courierService.updateByPrimaryKeySelective(cer);
		return "redirect:courier";
	}
	
	
	//删除快递员之前查询入库表是否有数据
	@RemoteMethod
	public int before_deleteCourier(int couId){
		return storagesService.delete_selectStorage2(couId);
	}
	
	//删除快递员
	@RemoteMethod
	public int deleteCourier(int couId){
		Courier c=courierService.selectByPrimaryKey(couId);
		int i=fundingDetailsService.deleteFd(couId);//删除外键关系
		i+=courierService.deleteByPrimaryKey(couId);//删除快递员
		i+=expressCompanyService.updateEC2(c.getCouExpgsId());//快递公司人数减1
		return i;
	}
	
	/*****************************快递公司***************************************/
	
	//快递公司
	@RequestMapping(value="/express/company")
	public String showExpressCompany(HttpServletRequest request,ExpressCompany ec,Model model){
		String pageNum=request.getParameter("pageNum");
		String pageSize=request.getParameter("pageSize");
		PageHelper.startPage(getPageNum(pageNum),getPageSize(pageSize));
		List<ExpressCompany> list=expressCompanyService.selectAll(ec);
		int[] l = {4,6,8,10};
		PageInfo page=new PageInfo(list);
		page.setPageNum(getPageNum(pageNum));
		page.setPageSize(getPageSize(pageSize));
		thisEndSizeNum(pageNum,pageSize);
		PageInfo2 page2=new PageInfo2(page,page.getPageNum());
		page2.setSelectnum(l);
		page2.setSize(page.getPageSize());
		model.addAttribute("page", page);
		model.addAttribute("page2", page2);
		model.addAttribute("ecompany", ec);
		return "staff/express_co";
	}
	
	
	//添加快递公司
	@RequestMapping(value="/express/addCompany")
	public String insertCompany(ExpressCompany ec){
		expressCompanyService.insertSelective(ec);
		return "redirect:company";
	}
	
	//编辑快递公司
	@RemoteMethod
	public ExpressCompany editCompany(int expgsId){
		return expressCompanyService.selectByPrimaryKey(expgsId);
	}
	
	//修改快递公司
	@RequestMapping(value="/express/updateCompany")
	public String updateCompany(ExpressCompany ec){
		expressCompanyService.updateByPrimaryKeySelective(ec);
		return "redirect:company";
	}
	
	//判断快递公司名称是否已存在
	@RemoteMethod
	public int selectECname(String expgsName){
		return expressCompanyService.selectECname(expgsName);
	}
	
	//删除快递公司前判断是否有外键
	@RemoteMethod
	public int delete_selectECompany(int expgsId){
		return expressCompanyService.delete_selectECompany(expgsId);
	}
	
	//删除快递公司
	@RemoteMethod
	public int deleteECompany(int expgsId){
		return expressCompanyService.deleteByPrimaryKey(expgsId);
	}
	
	/***************************快递代收**********************************/
	//快递代收
	@RequestMapping(value="/express/all")
	public String showExpress(HttpServletRequest request,Express ex,Model model){
		String pageNum=request.getParameter("pageNum");
		String pageSize=request.getParameter("pageSize");
		PageHelper.startPage(getPageNum(pageNum),getPageSize(pageSize));
		List<Express> list=expressService.selectAll(ex);
		int[] l = {4,6,8,10};
		PageInfo page=new PageInfo(list);
		page.setPageNum(getPageNum(pageNum));
		page.setPageSize(getPageSize(pageSize));
		thisEndSizeNum(pageNum,pageSize);
		PageInfo2 page2=new PageInfo2(page,page.getPageNum());
		page2.setSelectnum(l);
		page2.setSize(page.getPageSize());
		model.addAttribute("page", page);
		model.addAttribute("page2", page2);
		model.addAttribute("express",ex);
		return "lifeservice/express";
	}
	
	
	//取件:入库:列表
	@RequestMapping(value="/express/action/{op}/{eid}")
	public String showExpressAction(HttpServletRequest request,Storages sto,Model model,@PathVariable("op") String op, @PathVariable("eid") int eid){
		Express ex=expressService.selectByPrimaryKey(eid);
		model.addAttribute("ex", ex);
		if(op.equals("1")){
			return "lifeservice/add_express";
		}else if(op.equals("2")){
			return "lifeservice/send_express";
		}else {
			String pageNum=request.getParameter("pageNum");
			String pageSize=request.getParameter("pageSize");
			sto.setStorExpId(eid);
			PageHelper.startPage(getPageNum(pageNum),getPageSize(pageSize));
			List<Storages> list=storagesService.selectAll(sto);
			for(Storages stor:list){
				stor.setDistrict(districtService.selectByPrimaryKey(stor.getEx().getExpDisid()));
			}
			int[] l = {4,6,8,10};
			PageInfo page=new PageInfo(list);
			page.setPageNum(getPageNum(pageNum));
			page.setPageSize(getPageSize(pageSize));
			thisEndSizeNum(pageNum,pageSize);
			PageInfo2 page2=new PageInfo2(page,page.getPageNum());
			page2.setSelectnum(l);
			page2.setSize(page.getPageSize());
			model.addAttribute("page", page);
			model.addAttribute("page2", page2);
			model.addAttribute("stor", sto);
			return "lifeservice/express_list";
		}
	}
	
	//编辑快递页面
	@RequestMapping(value="/express/editstorage")
	public String editStorage(int eid,int storId,Model model){
		Express ex=expressService.selectByPrimaryKey(eid);
		model.addAttribute("ex", ex);
		Storages stor=storagesService.selectByPrimaryKey(storId);
		model.addAttribute("stor", stor);
		return "lifeservice/edit_express";
	}
	
	//修改快递
	@RequestMapping(value="/express/updatestorage")
	public String updateStorage(Storages stor,int eid){
		storagesService.updateByPrimaryKeySelective(stor);
		return "forward:/express/action";
	}
	
	//删除快递
	@RemoteMethod
	public int deleteStorage(int storId){
		return storagesService.deleteByPrimaryKey(storId);
	}
	
	//查询快递员和快递公司
	@RemoteMethod
	public List<Courier> selectCourier(){
		return courierService.selectA();
	}
	
	//入库
	@RequestMapping(value="/express/addstorage")
	public String addSto(Storages sto){
		storagesService.insertSelective(sto);
		Courier cou=courierService.selectByPrimaryKey(sto.getStorCouId());//查询快递员信息
		Double price=0.0;//存放快递费
		//判断包裹大小
		if(sto.getStorIssize().equals(0)){
			price=cou.getCouCostsmall();
		}else if(sto.getStorIssize().equals(1)){
			price=cou.getCouCostbig();
		}
		cou.setCouBalance(price);
		courierService.updateBalance2(cou);//扣取快递员余额
		FundingDetails fds=new FundingDetails();
		fds.setFundingCouId(cou.getCouId());
		fds.setFundingPrice(price);
		fds.setFundingRemark("花费");
		fundingDetailsService.insertSelective(fds);//添加资金明细记录
		return "redirect:all";
	}
	
	//添加取件点页面
	@RequestMapping(value="/express/qujian")
	public String showQuJian(){
		return "lifeservice/express_address";
	}
	
	//添加取件点
	@RequestMapping(value="/express/addexpress")
	public String addExpress(Express ex){
		expressService.insertSelective(ex);
		return "redirect:all";
	}
	
	//编辑取件点页面
	@RequestMapping(value="/express/editexpress")
	public String editExpress(int expId,Model model){
		Express exp=expressService.selectByPrimaryKey(expId);
		model.addAttribute("exp", exp);
		return "lifeservice/express_address_edit";
	}
	
	//修改取件点
	@RequestMapping(value="/express/updateexpress")
	public String updateExpress(Express exp){
		expressService.updateByPrimaryKeySelective(exp);
		return "redirect:all";
	}
	
	//删除取件点，先判断快递入库表是否有数据
	@RemoteMethod
	public int delete_selectStorages(int expId){
		return storagesService.delete_selectStorage(expId);
	}
	
	//删除取件点
	@RemoteMethod
	public int deleteExpress(int expId){
		int i=storagesService.delete_Storage(expId);
		if(i!=0){
			i+=expressService.deleteByPrimaryKey(expId);
		}
		return i;
	}
	
	//根据手机号后4位获取入库的快递信息
	@RemoteMethod
	public List<Storages> selectStorages(String str,int exid){
		Storages sto=new Storages();
		sto.setStorExpId(exid);
		sto.setNumber(str);
		return storagesService.selectByPhone4(sto);
	}
	
	//根据快递编号查询快递的详细信息(入库)
	@RemoteMethod
	public Storages selectStorage(int storId){
		return storagesService.selectByPrimaryKey(storId);
	}
	
	//取快递
	@RemoteMethod
	public int updateStorage(int storId){
		return storagesService.updateStorage(storId);
	}
	
	//查询快递单号是否已存在
	@RemoteMethod
	public int selectStornum(String num){
		return storagesService.selectStorNum(num);
	}
	
	//查询取件点地址是否已存在
	@RemoteMethod
	public int selectExpaddress(String address){
		return expressService.selectExpAddress(address);
	}
	
	//查询取件点服务电话是否已存在
	@RemoteMethod
	public int selectExpservicephone(String phone){
		return expressService.selectExpServicePhone(phone);
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
