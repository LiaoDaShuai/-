package com.sve.controller;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sve.datacenter.model.Owners;
import com.sve.datacenter.service.OwnersService;
import com.sve.util.Config;
import com.sve.util.HttpUtil;

/**
 * 验证码通知短信接口
 * 
 * @ClassName: IndustrySMS
 * @Description: 验证码通知短信接口
 *
 */
@Controller
@RemoteProxy(name="industryController")
public class IndustryController{
	private static String operation = "/industrySMS/sendSMS";
	private static String accountSid = Config.ACCOUNT_SID;
	private static String smsContent = "一位大帅哥给你发来验证码，内容为：{0},记得在5分钟内正确输入！打死都不要告诉别人哦！";
	private static String templateid = "61183920";
	
	@Autowired
	private OwnersService ownersService;
	//短信验证
	/**
	 * 生成随机验证码
	 * */
	public static String randYan(HttpServletRequest request){
		Random rs=new Random();
		int ss=0;String ma="";
		for(int i=0;i<4;i++){
			ss=rs.nextInt(10);
			ma+=ss;
		}
		request.getSession().setAttribute("yanzheng", ma);
		System.out.println(ma);
		return ma;
	}
	/*
	 * 验证码通知知短信
	 */
	@RemoteMethod
	public int duanxin(String phone,HttpServletRequest request){
		int status=0;
		String url = Config.BASE_URL + operation;
		String body = "accountSid=" + accountSid + "&to=" + phone + "&smsContent=" + smsContent
				+"&templateid="+templateid+"&param="+randYan(request)+ HttpUtil.createCommonParam();
		// 提交请求
		String results = HttpUtil.post(url, body);
		if(results!=null){
			status=1;
		}
		System.out.println("result:" + System.lineSeparator() + results);
		return status ;
	}
	@RemoteMethod
	public int isphonelogin(Owners owners,HttpServletRequest request){
		int status=1;
		String yzma=(String) request.getSession().getAttribute("yanzheng");
		if(owners.getKeywords().equals(yzma)){
			Owners owner=ownersService.selectPhone(owners.getOwnerphone());
			request.getSession().setAttribute("owners", owner);
		}else{
			status=0;
		}
		return status;
	}
	@RemoteMethod
	public int ispasslogin(Owners owners,HttpServletRequest request){
		int status=1;
		Owners owner=ownersService.selectPasslogin(owners);
		if(owner!=null){
			request.getSession().setAttribute("owners", owner);
		}else{
			status=0;
		}
		return status;
	}
}
