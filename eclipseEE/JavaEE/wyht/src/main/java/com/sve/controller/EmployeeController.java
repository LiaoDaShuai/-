package com.sve.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sve.auto.model.User;
import com.sve.auto.service.UserPermService;
import com.sve.auto.service.UserService;
import com.sve.datacenter.model.HouseFan;
import com.sve.datacenter.model.Owners;
import com.sve.datacenter.service.HouseFanService;
import com.sve.datacenter.service.OwnersService;
import com.sve.staff.model.Cmplaints;
import com.sve.staff.model.Cmptype;
import com.sve.staff.model.Department;
import com.sve.staff.model.Employee;
import com.sve.staff.model.Internal;
import com.sve.staff.model.Internalnotice;
import com.sve.staff.model.Message;
import com.sve.staff.model.Post;
import com.sve.staff.model.Task;
import com.sve.staff.model.Tasktype;
import com.sve.staff.model.Warranty;
import com.sve.staff.model.Wartype;
import com.sve.staff.service.CmplaintsService;
import com.sve.staff.service.CmptypeService;
import com.sve.staff.service.DepartmentService;
import com.sve.staff.service.EmployeeService;
import com.sve.staff.service.InternalService;
import com.sve.staff.service.InternalnoticeService;
import com.sve.staff.service.MessageService;
import com.sve.staff.service.PostService;
import com.sve.staff.service.TaskService;
import com.sve.staff.service.TasktypeService;
import com.sve.staff.service.WarrantyService;
import com.sve.staff.service.WartypeService;
import com.sve.util.PageInfo2;

@Controller
@RequestMapping("/staff")
@RemoteProxy(name = "employeeController")
public class EmployeeController {
	private String algorithmName = "md5";
	private final int hashIterations = 3;// 3�ε���
	// ------------Ա��
	@Autowired
	private EmployeeService employeeService;
	// ------------����
	@Autowired
	private DepartmentService departmentService;
	// ------------��λ
	@Autowired
	private PostService postService;
	@Autowired
	private InternalnoticeService internalnoticeService;
	// ------------�ڲ�Ա��ͨ��
	@Autowired
	private TaskService taskService;
	@Autowired
	private MessageService messageService;
	// ------------�������
	@Autowired
	private TasktypeService tasktypeService;
	// ------------�ڲ�����
	@Autowired
	private InternalService internalService;
	// ------------�ڲ����� (������ҵ�������ڲ������ҵ���ͷ���)
	@Autowired
	private OwnersService ownersService;
	@Autowired
	private HouseFanService houseFanService;
	@Autowired
	private CmplaintsService cmplaintsService;
	@Autowired
	private CmptypeService cmptypeService;
	@Autowired
	private WarrantyService warrantyService;
	@Autowired
	private WartypeService wartypeService;
	@Autowired
	private UserService userService;
	@Autowired
	private UserPermService userPermService;

	// ------------�������Ա��
	@RequestMapping("/all")
	public String showAll(Employee emp, HttpServletRequest request, Model model) {
		String pageNum = request.getParameter("pageNum");
		String pageSize = request.getParameter("pageSize");
		PageHelper.startPage(getPageNum(pageNum), getPageSize(pageSize));
		List<Employee> list = employeeService.mohu(emp);
		int[] selectnum = { 6, 8, 12, 15 };
		PageInfo page = new PageInfo(list);
		page.setPageNum(getPageNum(pageNum));
		thisEndSizeNum(pageNum, pageSize);
		PageInfo2 page2 = new PageInfo2(page, getPageNum(pageNum));// ��ҳ��������
		page2.setSelectnum(selectnum);
		page2.setSize(getPageSize(pageSize));// �����ڵ�ҳ�����ȥ
		model.addAttribute("page", page);
		model.addAttribute("page2", page2);
		model.addAttribute("emphomu", emp.getMohu());
		model.addAttribute("dephomu", emp.getDepmohu());
		// �鿴���еĲ���
		List<Department> department = departmentService.selectAll();
		model.addAttribute("dep", department);
		return "staff/mail_list";
	}

	// ------------�鿴Ա��������
	@RemoteMethod
	public Employee emp_selectKey(int empid) {
		Employee employee = employeeService.selectByPrimaryKey(empid);
		return employee;
	}

	// ------------���Ա����ɾ��ʱ�Ķ�������
	@RemoteMethod
	public List<Post> selectPost(int depid) {
		List<Post> Post = postService.selectPost(depid);
		return Post;
	}

	// ------------��װ�ϴ�ͼƬ
	public String upload(HttpServletRequest request, MultipartFile input_file) throws Exception {
		String name = input_file.getOriginalFilename();// ��ȡͼƬ����
		String url = "E:/Y2��/eclipseEE/JavaEE/wyht/src/main/webapp/img/";// ����·��
		File file = new File(url);
		if (!file.exists()) {// ���Ŀ¼������
			file.mkdirs();// ����Ŀ¼
		}
		input_file.transferTo(new File(url + name));// �����ļ�
		return name;// ����ͼƬ����
	}

	// ------------���Ա��
	@RequestMapping(value = "/staff_add")
	public String EmployeeAdd(HttpServletRequest request, MultipartFile input_file, Employee employee)
			throws Exception {
		if (!input_file.isEmpty()) {
			employee.setEmpPhoto(upload(request, input_file));
		}
		employeeService.insertSelective(employee);
		return "redirect:all";
	}

	// ------------ɾ��Ա��
	@RemoteMethod
	public String EmployeeDelete(int empid) {
		employeeService.deleteByPrimaryKey(empid);
		return "redirect:all";
	}

	// ------------�޸�Ա��
	@RequestMapping("/staff_update")
	public String EmployeeUpdate(HttpServletRequest request, MultipartFile input_file, Employee employee)
			throws Exception {
		if (!input_file.isEmpty()) {
			employee.setEmpPhoto(upload(request, input_file));
		} else {
			Employee emp = employeeService.selectByPrimaryKey(employee.getEmpId());
			System.out.println(emp.getEmpEmail() + "---------" + emp.getEmpId() + "-------" + emp.getEmpPhoto());
			employee.setEmpPhoto(emp.getEmpPhoto());
		}
		employeeService.updateByPrimaryKey(employee);
		return "redirect:all";
	}

	// ------------�����޸ĺ͸߼���ѯʱ�������
	@RemoteMethod
	public List<Department> selectAll_dep(int depid) {
		List<Department> department = departmentService.selectAll();
		return department;
	}

	@RemoteMethod
	public List<Post> selectAll_post(int empPostId, int postDepId) {
		List<Post> post = postService.selectAll(empPostId);
		return post;
	}

	// --------------------------�鿴���еĲ���
	@RequestMapping("/department_all")
	public String DepartmentAll(HttpServletRequest request, Model model) {
		String pageNum = request.getParameter("pageNum");
		String pageSize = request.getParameter("pageSize");
		PageHelper.startPage(getPageNum(pageNum), getPageSize(pageSize));
		List<Department> list = departmentService.selectAll();
		int[] selectnum = { 6, 8, 12, 15 };
		PageInfo page = new PageInfo(list);
		page.setPageNum(getPageNum(pageNum));
		thisEndSizeNum(pageNum, pageSize);
		PageInfo2 page2 = new PageInfo2(page, getPageNum(pageNum));// ��ҳ��������
		page2.setSelectnum(selectnum);
		page2.setSize(getPageSize(pageSize));// �����ڵ�ҳ�����ȥ
		// ����λ����
		List<Integer> dpostcount = new ArrayList<Integer>();
		List<Integer> demployeecount = new ArrayList<Integer>();
		for (Department l : list) {
			int dcount = postService.selectDpostcount(l.getDepId());
			int dempcount = employeeService.selectDemployeecount(l.getDepId());
			l.setDepCount(dcount);
			l.setDepEmpCount(dempcount);
		}
		model.addAttribute("page", page);
		model.addAttribute("page2", page2);
		return "staff/index";
	}

	// ------------��Ӳ���
	@RequestMapping("/department_add")
	public String department_add(HttpServletRequest request, Department dep) {
		departmentService.insertSelective(dep);
		return "redirect:department_all";
	}

	// -----------��ԃ���в��T������֤
	@RemoteMethod
	public int yz_depName(String depName) {
		int flag = departmentService.yanzheng(depName);
		return flag;
	}

	// ------------ɾ������ ��һ����a��ǩ��ֵ��û���첽��
	// @RequestMapping("/department_del/{depId}")
	// public String DepartmentDelete(@PathVariable("depId") int depId){
	// departmentService.deleteByPrimaryKey(depId);
	// return "redirect:../department_all";
	// }
	@RemoteMethod
	public String DepartmentDelete(int depId) {
		departmentService.deleteByPrimaryKey(depId);
		return "redirect:department_all";
	}

	// ------------��ѯ��λ
	@RequestMapping("/department_edit/{depId}")
	public String DepartmentEdit(@PathVariable("depId") int depId, Model model) {
		Department depart = departmentService.selectByPrimaryKey(depId);
		List<Post> list = postService.selectAll(depId);
		List<Integer> postcount = new ArrayList<Integer>();
		for (Post l : list) {
			int dcount = employeeService.selectPostcount(l.getPostId());
			l.setPostCount(dcount);
		}
		model.addAttribute("list", list);
		model.addAttribute("dep", depart);
		return "staff/edit_department";
	}

	// -----------��Ӹ�λ
	@RequestMapping("/post_add")
	public String PostAdd(Post post) {
		postService.insertSelective(post);
		return "redirect:department_edit/" + post.getPostDepId();
	}

	// -----------��ԃ���в��T������֤
	@RemoteMethod
	public int yz_postName(String postName) {
		int flag = postService.yanzheng(postName);
		return flag;
	}

	// -----------ɾ����λ (֮ǰAjax��)
	// @RequestMapping("/post_del/{postId}")
	@RemoteMethod
	public String departmentDelete(int postId) {
		Post post = postService.selectByPrimaryKey(postId);
		postService.deleteByPrimaryKey(postId);
		return "redirect:department_edit/" + post.getPostDepId();
	}

	// -----------�༭��λ (֮ǰAjax��)// @RequestMapping("/post_edit")// @ResponseBody
	@RemoteMethod
	public Post PostEdit(int postid) {
		Post post = postService.selectByPrimaryKey(postid);
		return post;
	}

	// -----------�޸ĸ�λ
	@RequestMapping("/post_update")
	public String PostUpdate(@ModelAttribute("post") Post post) {
		postService.updateByPrimaryKeySelective(post);
		return "redirect:department_edit/" + post.getPostDepId();
	}

	// -----------�������Ա����ͨ��-----------------
	@RequestMapping("/internal_notice")
	public String internalnoticeAll(HttpServletRequest request, Model model, String mohu) {
		String pageNum = request.getParameter("pageNum");
		String pageSize = request.getParameter("pageSize");
		System.out.println(pageNum + "  " + pageSize);
		PageHelper.startPage(getPageNum(pageNum), getPageSize(pageSize));
		List<Internalnotice> list = internalnoticeService.selectAll(mohu);
		int[] selectnum = { 6, 8, 12, 15 };
		PageInfo page = new PageInfo(list);
		page.setPageNum(getPageNum(pageNum));
		thisEndSizeNum(pageNum, pageSize);
		PageInfo2 page2 = new PageInfo2(page, getPageNum(pageNum));// ��ҳ��������
		page2.setSelectnum(selectnum);
		page2.setSize(getPageSize(pageSize));// �����ڵ�ҳ�����ȥ
		model.addAttribute("mohu", mohu);
		model.addAttribute("page", page);
		model.addAttribute("page2", page2);
		return "staff/notice_emp";
	}

	// -----------���ͨ��
	@RequestMapping("/notice_add")
	public String InternalnoticeAdd(Internalnotice notice) {
		internalnoticeService.insertSelective(notice);
		return "redirect:internal_notice";
	}

	// ------------һ��ʼ��ʱ������в��Ų����������֪ͨ������������
	@RemoteMethod
	public List<Department> selectAllDepartment() {
		List<Department> dep = departmentService.selectAll();
		return dep;
	}

	// ------------���֪ͨʱ��������������������
	@RemoteMethod
	public List<Employee> selectEmployee(int postid) {
		List<Employee> emp = employeeService.selectEmployee(postid);
		return emp;
	}

	// -----------�鿴ͨ������
	@RemoteMethod
	public Internalnotice internalnotice_selectKey(int intnotId) {
		Internalnotice internalnotice = internalnoticeService.selectByPrimaryKey(intnotId);
		return internalnotice;
	}

	// -----------ɾ��ͨ��
	@RemoteMethod
	public String Internalnoticedel(int intnotId) {
		internalnoticeService.deleteByPrimaryKey(intnotId);
		return "redirect:internal_notice";
	}

	// ----------------------------�������ҵ����ͨ��---------------------
	@RequestMapping("/message_all")
	public String MessageAll(HttpServletRequest request, Model model, String mohu) {
		String pageNum = request.getParameter("pageNum");
		String pageSize = request.getParameter("pageSize");
		PageHelper.startPage(getPageNum(pageNum), getPageSize(pageSize));
		List<Message> list = messageService.selectAll(mohu);
		int[] selectnum = { 6, 8, 12, 15 };
		PageInfo page = new PageInfo(list);
		page.setPageNum(getPageNum(pageNum));
		thisEndSizeNum(pageNum, pageSize);
		PageInfo2 page2 = new PageInfo2(page, getPageNum(pageNum));// ��ҳ��������
		page2.setSelectnum(selectnum);
		page2.setSize(getPageSize(pageSize));// �����ڵ�ҳ�����ȥ
		model.addAttribute("mohu", mohu);
		model.addAttribute("page", page);
		model.addAttribute("page2", page2);
		return "staff/message_all";
	}

	// -----------�鿴ͨ������
	@RemoteMethod
	public List<Owners> selectownersname() {
		// ����һ����䣬��ȥ�����Ŀ�����Dao���һ����� ��״̬����2�ĳ���fanid>0
		List<Owners> Owners = ownersService.selectAllName();
		return Owners;
	}

	// -----------�������
	@RequestMapping("/message_add")
	public String messageAdd(Message message) {
		messageService.insertSelective(message);
		return "redirect:message_all";
	}

	// -----------�鿴������Ϣ
	@RemoteMethod
	public Message message_selectKey(int mesId) {
		Message mes = messageService.selectByPrimaryKey(mesId);
		return mes;
	}

	// -----------ɾ������
	@RemoteMethod
	public String messageDel(int mesId) {
		messageService.deleteByPrimaryKey(mesId);
		return "redirect:message_all";
	}

	// -----------�鿴�����ڲ�����
	@RequestMapping("/internal_all")
	public String internalAll(Internal internal, HttpServletRequest request, Model model) {
		String pageNum = request.getParameter("pageNum");
		String pageSize = request.getParameter("pageSize");
		PageHelper.startPage(getPageNum(pageNum), getPageSize(pageSize));
		List<Internal> list = internalService.selectAll(internal);
		int[] selectnum = { 6, 8, 12, 15 };
		PageInfo page = new PageInfo(list);
		page.setPageNum(getPageNum(pageNum));
		thisEndSizeNum(pageNum, pageSize);
		PageInfo2 page2 = new PageInfo2(page, page.getPageNum());// ��ҳ��������
		page2.setSelectnum(selectnum);
		page2.setSize(getPageSize(pageSize));// �����ڵ�ҳ�����ȥ
		model.addAttribute("page", page);
		model.addAttribute("page2", page2);
		;
		return "staff/internal_all";
	}

	// ----------------------------�鿴�ڲ�����---------------------
	@RequestMapping("/internal_add")
	public String internalAdd(HttpServletRequest request, MultipartFile input_file, Internal internal)
			throws Exception {
		if (!input_file.isEmpty()) {
			internal.setInterIntimg(upload(request, input_file));
		}
		internalService.insertSelective(internal);
		return "redirect:internal_all";
	}

	// -----------�鿴�ڲ���������
	@RemoteMethod
	public Internal internal_selectKey(int interId) {
		Internal internal = internalService.selectByPrimaryKey(interId);
		return internal;
	}

	// -----------ɾ���ڲ�����
	@RemoteMethod
	public String internalDel(int interId) {
		internalService.deleteByPrimaryKey(interId);
		return "redirect:../internal_all";
	}

	// -----------�޸��ڲ����µ�״̬
	@RequestMapping("/internal_update")
	public String internalUpdate(Internal internal) {
		internalService.updateByPrimaryKeySelective(internal);
		return "redirect:internal_all";
	}

	// ----------------------------�鿴����Ͷ��---------------------
	@RequestMapping("/cmplaints_all")
	public String cmplaintsAll(Cmplaints cmp, HttpServletRequest request, Model model) {
		String pageNum = request.getParameter("pageNum");
		String pageSize = request.getParameter("pageSize");
		PageHelper.startPage(getPageNum(pageNum), getPageSize(pageSize));
		List<Cmplaints> list = cmplaintsService.selectAll(cmp);
		for (int i = 0; i < list.size(); i++) {
			HouseFan fan = houseFanService.selectFandid(list.get(i).getOwners().getFanid());
			list.get(i).setHnum(fan.getHnum());
			System.out.println(fan.getHnum() + "====------------------");
		}
		int[] selectnum = { 6, 8, 12, 15 };
		PageInfo page = new PageInfo(list);
		page.setPageNum(getPageNum(pageNum));
		thisEndSizeNum(pageNum, pageSize);
		PageInfo2 page2 = new PageInfo2(page, page.getPageNum());// ��ҳ��������
		page2.setSelectnum(selectnum);
		page2.setSize(getPageSize(pageSize));// �����ڵ�ҳ�����ȥ
		model.addAttribute("page", page);
		model.addAttribute("page2", page2);
		;
		return "staff/cmplaints_all";
	}

	// -----------�������Ͷ������
	@RemoteMethod
	public List<Cmptype> selectAllcmptype() {
		List<Cmptype> cmptype = cmptypeService.selectAll();
		return cmptype;
	}

	// -----------���Ͷ������
	@RequestMapping("/cmplaints_add")
	public String implaintsAdd(HttpServletRequest request, MultipartFile input_file, Cmplaints cmplaints)
			throws Exception {
		if (!input_file.isEmpty()) {
			cmplaints.setCmpImg(upload(request, input_file));
		}
		cmplaintsService.insertSelective(cmplaints);
		return "redirect:cmplaints_all";
	}

	@RemoteMethod
	public Cmplaints cmplaints_selectKey(int cmpId) {
		Cmplaints cmp = cmplaintsService.selectByPrimaryKey(cmpId);
		// HouseFan fan = houseFanService.selectFandid(cmpId);
		// cmp.setHnum(fan.getHnum());
		return cmp;
	}

	// -----------ɾ���ڲ�����
	@RemoteMethod
	public String cmplaintsDel(int cid) {
		cmplaintsService.deleteByPrimaryKey(cid);
		return "redirect:../cmplaints_all";
	}

	// -----------�޸ĸ�λ
	@RequestMapping("/cmplaints_update")
	public String CmplaintsUpdate(Cmplaints cmp) {
		cmplaintsService.updateByPrimaryKeySelective(cmp);
		return "redirect:../staff/cmplaints_all";
	}

	// ----------------------------�鿴���г�������---------------------
	@RequestMapping("/task_all")
	public String taskAll(Task task, HttpServletRequest request, Model model) {
		System.out.println("--------------------------//" + task.getTaskTapeTid() + "-----" + task.getTaskDepId());
		String pageNum = request.getParameter("pageNum");
		String pageSize = request.getParameter("pageSize");
		PageHelper.startPage(getPageNum(pageNum), getPageSize(pageSize));
		List<Task> list = taskService.selectAll(task);
		int[] selectnum = { 6, 8, 12, 15 };
		PageInfo page = new PageInfo(list);
		page.setPageNum(getPageNum(pageNum));
		thisEndSizeNum(pageNum, pageSize);
		PageInfo2 page2 = new PageInfo2(page, getPageNum(pageNum));// ��ҳ��������
		page2.setSelectnum(selectnum);
		page2.setSize(getPageSize(pageSize));// �����ڵ�ҳ�����ȥ
		model.addAttribute("page", page);
		model.addAttribute("page2", page2);
		;
		return "staff/task_all";
	}

	// -----------�鿴ͨ������
	@RequestMapping("/select_key/{taskId}")
	public String taskAll(@PathVariable("taskId") int taskId, Model model) {
		Task task = taskService.selectByPrimaryKey(taskId);
		model.addAttribute("task", task);
		return "staff/task";
	}

	// -----------������е���������
	@RemoteMethod
	public List<Tasktype> task_all() {
		List<Tasktype> Tasktype = tasktypeService.selectAll();
		return Tasktype;
	}

	// ------------�����������ʱ�Ķ�������
	@RemoteMethod
	public List<Employee> selectEmployeeDep(int depid) {
		List<Employee> emp = employeeService.selectEmployeeDep(depid);
		return emp;
	}

	// ��ת���������ҳ��
	@RequestMapping("/task-add")
	public String taskAdd() {
		return "staff/add_task";
	}

	// -----------�������
	@RequestMapping("/task_add")
	public String taskAdd(Task task) {
		taskService.insertSelective(task);
		return "redirect:task_all";
	}

	// -----------ɾ������
	@RemoteMethod
	public String taskDel(int taskId) {
		taskService.deleteByPrimaryKey(taskId);
		return "redirect:../task_all";
	}

	// ----------------------------�鿴�����б�---------------------
	@RequestMapping("/warranty_all")
	public String warrantyAll(Warranty war, HttpServletRequest request, Model model) {
		String pageNum = request.getParameter("pageNum");
		String pageSize = request.getParameter("pageSize");
		PageHelper.startPage(getPageNum(pageNum), getPageSize(pageSize));
		List<Warranty> list = warrantyService.selectAll(war);
		for (int i = 0; i < list.size(); i++) {
			HouseFan fan = houseFanService.selectFandid(list.get(i).getOwners().getFanid());
			list.get(i).setHnum(fan.getHnum());
		}
		int[] selectnum = { 6, 8, 12, 15 };
		PageInfo page = new PageInfo(list);
		page.setPageNum(getPageNum(pageNum));
		thisEndSizeNum(pageNum, pageSize);
		PageInfo2 page2 = new PageInfo2(page, getPageNum(pageNum));// ��ҳ��������
		page2.setSelectnum(selectnum);
		page2.setSize(getPageSize(pageSize));// �����ڵ�ҳ�����ȥ
		model.addAttribute("page", page);
		model.addAttribute("page2", page2);
		return "staff/warranty_all";
	}

	// -----------�鿴��������
	@RemoteMethod
	public List<Wartype> selectAllwartype() {
		List<Wartype> wartype = wartypeService.selectAll();
		return wartype;
	}

	// -----------��ӱ�������
	@RequestMapping("/warranty_add")
	public String warrantyAdd(HttpServletRequest request, MultipartFile input_file, Warranty warranty)
			throws Exception {
		if (!input_file.isEmpty()) {
			warranty.setWarImg(upload(request, input_file));
		}
		warrantyService.insertSelective(warranty);
		return "redirect:warranty_all";
	}

	// -----------�鿴��������
	@RemoteMethod
	public Warranty warranty_selectKey(int warId) {
		Warranty war = warrantyService.selectByPrimaryKey(warId);
		// HouseFan fan = houseFanService.selectFandid(warId);
		// war.setHnum(fan.getHnum());
		return war;
	}

	// -----------ɾ����������
	@RemoteMethod
	public String warrantyDel(int warId) {
		warrantyService.deleteByPrimaryKey(warId);
		return "redirect:../cmplaints_all";
	}

	// -----------�޸ĸ�λ
	@RequestMapping("/war_update")
	public String WarrantyUpdate(Warranty war) {
		warrantyService.updateByPrimaryKeySelective(war);
		return "redirect:../staff/warranty_all";
	}

	// ����Աȫ��
	@RequestMapping("/admin")
	public String Admin(HttpServletRequest request, Model model) {
		String pageNum = request.getParameter("pageNum");
		String pageSize = request.getParameter("pageSize");
		PageHelper.startPage(getPageNum(pageNum), getPageSize(pageSize));
		List<User> list = userService.selectUserLevelAll();
		int[] selectnum = { 6, 8, 12, 15 };
		PageInfo page = new PageInfo(list);
		page.setPageNum(getPageNum(pageNum));
		thisEndSizeNum(pageNum, pageSize);
		PageInfo2 page2 = new PageInfo2(page, getPageNum(pageNum));// ��ҳ��������
		page2.setSelectnum(selectnum);
		page2.setSize(getPageSize(pageSize));// �����ڵ�ҳ�����ȥ
		model.addAttribute("page", page);
		model.addAttribute("page2", page2);
		return "staff/admin";
	}

	// ��ӹ���Ա
	@RequestMapping("/addAdmin")
	public String addAdmin(User user) {
		encryptPassword(user);
		userService.insertSelective(user);
		return "redirect:admin";
	}

	// ɾ������Ա
	@RemoteMethod
	public int delAdmin(int userId) {
		int count = userPermService.deleteUserId(userId);
		count += userService.deleteByPrimaryKey(userId);
		return count;
	}

	// �޸�����
	@RemoteMethod
	public int updatePwd(User user) {
		User users = userService.selectByPrimaryKey(user.getUserId());
		users.setUserPass(user.getUserPass());
		encryptPassword(users);
		int count = userService.updateByPrimaryKeySelective(users);
		return count;
	}

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

	// �o�ܴa����
	public void encryptPassword(User user) {
		System.out.println(user.getUserName() + "  " + user.getUserPass());
		// User���������������ֶ�Username��Password
		String salt1 = user.getUserName();
		String salt2 = new SecureRandomNumberGenerator().nextBytes().toHex();
		user.setUserSalt(salt2);
		// ���û���ע�����뾭��ɢ���㷨�滻��һ��������������뱣������ݣ�ɢ�й���ʹ������
		String newPassword = new SimpleHash(algorithmName, user.getUserPass(), salt1 + salt2, hashIterations).toHex();
		user.setUserPass(newPassword);
	}
}
