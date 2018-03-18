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
	private ExpressService expressService;//��ݴ���
	
	@Autowired
	private ExpressCompanyService expressCompanyService;//��ݹ�˾
	
	@Autowired
	private CourierService courierService;//���Ա
	
	@Autowired
	private FundingDetailsService fundingDetailsService;//�ʽ���ϸ
	
	@Autowired
	private StoragesService storagesService;//������
	
	@Autowired
	private DistrictService districtService;//С��
	
	//�ʽ���ϸ
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
	
	//���Ա
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
	
	//��ʼ����ݹ�˾������
	@RemoteMethod
	public List<ExpressCompany> selectECAll(){
		return expressCompanyService.selectECAll();
	}
	
	//��ӿ��Աҳ��
	@RequestMapping(value="/express/addcourier")
	public String addCourier(){
		return "staff/add_courier";
	}
	
	//��ӿ��Ա
	@RequestMapping(value="/express/insertcourier")
	public String insertcourier(Courier cer){
		int i=courierService.insertSelective(cer);
		if(i!=0){
			i+=expressCompanyService.updateEC(cer.getCouExpgsId());
		}
		return "redirect:courier";
	}
	
	//��ѯ���Ա�����Ƿ��Ѵ���
	@RemoteMethod
	public int select_couName(String couName){
		return courierService.selectCourierName(couName);
	}
	
	//��ѯ���Ա�ֻ����Ƿ��Ѵ���
	@RemoteMethod
	public int select_couPhone(String couPhone){
		return courierService.selectCourierPhone(couPhone);
	}
	
	//��ֵ��Ϣ
	@RemoteMethod
	public Courier reCourier(int couId){
		return courierService.selectByPrimaryKey(couId);
	}
	
	//��ֵ
	@RequestMapping(value="/express/courier_recharge")
	public String CRecharge(Courier cer){
		courierService.updateBalance(cer);
		FundingDetails fds=new FundingDetails();
		fds.setFundingCouId(cer.getCouId());
		fds.setFundingPrice(cer.getCouBalance());
		fundingDetailsService.insertSelective(fds);
		return "redirect:courier";
	}
	
	//�༭���Աҳ��
	@RequestMapping(value="/express/editcourier")
	public String editCourier(int couId,Model model){
		Courier cer=courierService.selectByPrimaryKey(couId);
		model.addAttribute("cer", cer);
		return "staff/edit_courier";
	}
	
	//�޸Ŀ��Ա
	@RequestMapping(value="/express/updatecourier")
	public String updateCourier(Courier cer){
		courierService.updateByPrimaryKeySelective(cer);
		return "redirect:courier";
	}
	
	
	//ɾ�����Ա֮ǰ��ѯ�����Ƿ�������
	@RemoteMethod
	public int before_deleteCourier(int couId){
		return storagesService.delete_selectStorage2(couId);
	}
	
	//ɾ�����Ա
	@RemoteMethod
	public int deleteCourier(int couId){
		Courier c=courierService.selectByPrimaryKey(couId);
		int i=fundingDetailsService.deleteFd(couId);//ɾ�������ϵ
		i+=courierService.deleteByPrimaryKey(couId);//ɾ�����Ա
		i+=expressCompanyService.updateEC2(c.getCouExpgsId());//��ݹ�˾������1
		return i;
	}
	
	/*****************************��ݹ�˾***************************************/
	
	//��ݹ�˾
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
	
	
	//��ӿ�ݹ�˾
	@RequestMapping(value="/express/addCompany")
	public String insertCompany(ExpressCompany ec){
		expressCompanyService.insertSelective(ec);
		return "redirect:company";
	}
	
	//�༭��ݹ�˾
	@RemoteMethod
	public ExpressCompany editCompany(int expgsId){
		return expressCompanyService.selectByPrimaryKey(expgsId);
	}
	
	//�޸Ŀ�ݹ�˾
	@RequestMapping(value="/express/updateCompany")
	public String updateCompany(ExpressCompany ec){
		expressCompanyService.updateByPrimaryKeySelective(ec);
		return "redirect:company";
	}
	
	//�жϿ�ݹ�˾�����Ƿ��Ѵ���
	@RemoteMethod
	public int selectECname(String expgsName){
		return expressCompanyService.selectECname(expgsName);
	}
	
	//ɾ����ݹ�˾ǰ�ж��Ƿ������
	@RemoteMethod
	public int delete_selectECompany(int expgsId){
		return expressCompanyService.delete_selectECompany(expgsId);
	}
	
	//ɾ����ݹ�˾
	@RemoteMethod
	public int deleteECompany(int expgsId){
		return expressCompanyService.deleteByPrimaryKey(expgsId);
	}
	
	/***************************��ݴ���**********************************/
	//��ݴ���
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
	
	
	//ȡ��:���:�б�
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
	
	//�༭���ҳ��
	@RequestMapping(value="/express/editstorage")
	public String editStorage(int eid,int storId,Model model){
		Express ex=expressService.selectByPrimaryKey(eid);
		model.addAttribute("ex", ex);
		Storages stor=storagesService.selectByPrimaryKey(storId);
		model.addAttribute("stor", stor);
		return "lifeservice/edit_express";
	}
	
	//�޸Ŀ��
	@RequestMapping(value="/express/updatestorage")
	public String updateStorage(Storages stor,int eid){
		storagesService.updateByPrimaryKeySelective(stor);
		return "forward:/express/action";
	}
	
	//ɾ�����
	@RemoteMethod
	public int deleteStorage(int storId){
		return storagesService.deleteByPrimaryKey(storId);
	}
	
	//��ѯ���Ա�Ϳ�ݹ�˾
	@RemoteMethod
	public List<Courier> selectCourier(){
		return courierService.selectA();
	}
	
	//���
	@RequestMapping(value="/express/addstorage")
	public String addSto(Storages sto){
		storagesService.insertSelective(sto);
		Courier cou=courierService.selectByPrimaryKey(sto.getStorCouId());//��ѯ���Ա��Ϣ
		Double price=0.0;//��ſ�ݷ�
		//�жϰ�����С
		if(sto.getStorIssize().equals(0)){
			price=cou.getCouCostsmall();
		}else if(sto.getStorIssize().equals(1)){
			price=cou.getCouCostbig();
		}
		cou.setCouBalance(price);
		courierService.updateBalance2(cou);//��ȡ���Ա���
		FundingDetails fds=new FundingDetails();
		fds.setFundingCouId(cou.getCouId());
		fds.setFundingPrice(price);
		fds.setFundingRemark("����");
		fundingDetailsService.insertSelective(fds);//����ʽ���ϸ��¼
		return "redirect:all";
	}
	
	//���ȡ����ҳ��
	@RequestMapping(value="/express/qujian")
	public String showQuJian(){
		return "lifeservice/express_address";
	}
	
	//���ȡ����
	@RequestMapping(value="/express/addexpress")
	public String addExpress(Express ex){
		expressService.insertSelective(ex);
		return "redirect:all";
	}
	
	//�༭ȡ����ҳ��
	@RequestMapping(value="/express/editexpress")
	public String editExpress(int expId,Model model){
		Express exp=expressService.selectByPrimaryKey(expId);
		model.addAttribute("exp", exp);
		return "lifeservice/express_address_edit";
	}
	
	//�޸�ȡ����
	@RequestMapping(value="/express/updateexpress")
	public String updateExpress(Express exp){
		expressService.updateByPrimaryKeySelective(exp);
		return "redirect:all";
	}
	
	//ɾ��ȡ���㣬���жϿ�������Ƿ�������
	@RemoteMethod
	public int delete_selectStorages(int expId){
		return storagesService.delete_selectStorage(expId);
	}
	
	//ɾ��ȡ����
	@RemoteMethod
	public int deleteExpress(int expId){
		int i=storagesService.delete_Storage(expId);
		if(i!=0){
			i+=expressService.deleteByPrimaryKey(expId);
		}
		return i;
	}
	
	//�����ֻ��ź�4λ��ȡ���Ŀ����Ϣ
	@RemoteMethod
	public List<Storages> selectStorages(String str,int exid){
		Storages sto=new Storages();
		sto.setStorExpId(exid);
		sto.setNumber(str);
		return storagesService.selectByPhone4(sto);
	}
	
	//���ݿ�ݱ�Ų�ѯ��ݵ���ϸ��Ϣ(���)
	@RemoteMethod
	public Storages selectStorage(int storId){
		return storagesService.selectByPrimaryKey(storId);
	}
	
	//ȡ���
	@RemoteMethod
	public int updateStorage(int storId){
		return storagesService.updateStorage(storId);
	}
	
	//��ѯ��ݵ����Ƿ��Ѵ���
	@RemoteMethod
	public int selectStornum(String num){
		return storagesService.selectStorNum(num);
	}
	
	//��ѯȡ�����ַ�Ƿ��Ѵ���
	@RemoteMethod
	public int selectExpaddress(String address){
		return expressService.selectExpAddress(address);
	}
	
	//��ѯȡ�������绰�Ƿ��Ѵ���
	@RemoteMethod
	public int selectExpservicephone(String phone){
		return expressService.selectExpServicePhone(phone);
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
