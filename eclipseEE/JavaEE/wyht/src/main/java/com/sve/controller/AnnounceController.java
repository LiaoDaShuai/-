package com.sve.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sve.datacenter.model.District;
import com.sve.lifeservice.model.AnnDis;
import com.sve.lifeservice.model.Announce;
import com.sve.lifeservice.service.AnnDisService;
import com.sve.lifeservice.service.AnnounceService;
import com.sve.util.PageInfo2;

@Controller
@RemoteProxy(name = "announceController")
@RequestMapping("/lifeservice")
public class AnnounceController {

	@Autowired
	public AnnounceService announceService;
	@Autowired
	public AnnDisService annDisService;

	@RequestMapping("/show_announce")
	public String ShowAnnounce(HttpServletRequest request, Model model) {
		String pageNum = request.getParameter("pageNum");
		String pageSize = request.getParameter("pageSize");
		String key = request.getParameter("key");
		List<Announce> list = null;
		PageHelper.startPage(getPageNum(pageNum), getPageSize(pageSize));
		if (key != null && !key.equals("")) {
			list = announceService.selectAnnounceByKey(key);
		} else {
			list = announceService.selectAD();
		}
		PageInfo page = new PageInfo(list);
		page.setPageNum(getPageNum(pageNum));
		thisEndSizeNum(pageNum, pageSize);
		PageInfo2 page2 = new PageInfo2(page, page.getPageNum());// 分页条，及下拉框工具类
		int selectnum[] = { 6, 8, 10, 12 };// 设置下来框里的数
		page2.setSelectnum(selectnum);
		page2.setSize(page.getPageSize());
		model.addAttribute("page", page);
		model.addAttribute("key", key);
		model.addAttribute("page2", page2);
		return "wservice/notice_list";
	}

	@RequestMapping("/show_all")
	public String Show_all(int id, Model model) {
		Announce announce = announceService.selectAnnounceById(id);
		model.addAttribute("ann", announce);
		return "wservice/show_all";
	}

	@RequestMapping("/InsertOrUpdate/{type}")
	public String InsertAnnounce(@PathVariable("type") int type, HttpServletRequest request, Model model) {
		if (type == 1) {
			model.addAttribute("announce", new Announce());
		} else if (type == 2) {
			String id = request.getParameter("id");
			Announce announce = announceService.selectAnnounceById(Integer.parseInt(id));
			model.addAttribute("announce", announce);
		}
		model.addAttribute("type", type);
		return "wservice/add_notice";
	}

	@RequestMapping("/InsertOrUpdate/{type}/{btn}")
	public String UpdateAnnounce(Announce announce, @PathVariable("type") int type, @PathVariable("btn") int btn,
			Model model) {
//		String context = announce.getAnnContext().replaceAll("</?[^>]+>", "");
//		announce.setAnnContext(context.replaceAll("<a>\\s*|\t|\r|\n</a>", ""));
		if (type == 1) {
			announce.setAnnAnnouncer(SecurityUtils.getSubject().getPrincipal().toString());
			announceService.insertAnnounce(announce);
			if (btn == 1) {
				return "redirect:/lifeservice/InsertOrUpdate/" + type;
			} else {
				return "redirect:/lifeservice/show_announce";
			}
		} else if (type == 2) {
			announceService.updateAnnounce(announce);
			if (btn == 1) {
				return "redirect:/lifeservice/InsertOrUpdate/" + type + "?id=" + announce.getAnnId();
			} else {
				return "redirect:/lifeservice/show_announce";
			}
		}
		return "error";

	}

	@RequestMapping("/delete_announce/{id}")
	public String DeleteAnnounce(@PathVariable("id")int id) {
		if (announceService.deleteAnnounce(id)) {
			return "redirect:/lifeservice/show_announce";
		}
		return "error";
	}
	//绑定小区
	@RequestMapping("/BanAnnDis")
	public String BandingAnnDis(AnnDis anndis) {
		for (int i = 0; i < anndis.getAdsDids().length; i++) {
			AnnDis ann = new AnnDis();
			ann.setAdsAnnid(anndis.getAdsAnnid());
			ann.setAdsDid(anndis.getAdsDids()[i]);
			annDisService.insertSelective(ann);
		}
		return "redirect:show_announce";
	}

	@RemoteMethod
	public List<District> selectAnnid(int id) {
		return announceService.selectGuanDis(id);
	}

	@RemoteMethod
	public int delDisAnn(AnnDis annDis) {
		return annDisService.deldis(annDis);
	}
	@RemoteMethod//更改置顶，默认3天
	public int UpdateZhiding(Announce announce){
		Date date=new Date();
		Calendar ct=Calendar.getInstance();
		ct.setTime(date);
		ct.add(Calendar.DATE, +3);
		announce.setAnnZhidingend(ct.getTime());
		return announceService.updateAnnounce(announce);
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

	public void thisEndSizeNum(String num, String size) {// 将当前页数覆给最后页数
		endPageNum = getPageNum(num);
		endPageSize = getPageSize(size);
	}
}
