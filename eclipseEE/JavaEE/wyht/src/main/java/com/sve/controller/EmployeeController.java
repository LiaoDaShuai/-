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
	private final int hashIterations = 3;// 3次迭代
	// ------------员工
	@Autowired
	private EmployeeService employeeService;
	// ------------部门
	@Autowired
	private DepartmentService departmentService;
	// ------------岗位
	@Autowired
	private PostService postService;
	@Autowired
	private InternalnoticeService internalnoticeService;
	// ------------内部员工通告
	@Autowired
	private TaskService taskService;
	@Autowired
	private MessageService messageService;
	// ------------任务管理
	@Autowired
	private TasktypeService tasktypeService;
	// ------------内部报表
	@Autowired
	private InternalService internalService;
	// ------------内部报表 (晓欣的业主，用于查出所有业主和房间)
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

	// ------------查出所有员工
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
		PageInfo2 page2 = new PageInfo2(page, getPageNum(pageNum));// 分页导航条，
		page2.setSelectnum(selectnum);
		page2.setSize(getPageSize(pageSize));// 将当期的页数存进去
		model.addAttribute("page", page);
		model.addAttribute("page2", page2);
		model.addAttribute("emphomu", emp.getMohu());
		model.addAttribute("dephomu", emp.getDepmohu());
		// 查看所有的部门
		List<Department> department = departmentService.selectAll();
		model.addAttribute("dep", department);
		return "staff/mail_list";
	}

	// ------------查看员工的资料
	@RemoteMethod
	public Employee emp_selectKey(int empid) {
		Employee employee = employeeService.selectByPrimaryKey(empid);
		return employee;
	}

	// ------------添加员工和删除时的二级联动
	@RemoteMethod
	public List<Post> selectPost(int depid) {
		List<Post> Post = postService.selectPost(depid);
		return Post;
	}

	// ------------封装上传图片
	public String upload(HttpServletRequest request, MultipartFile input_file) throws Exception {
		String name = input_file.getOriginalFilename();// 获取图片名称
		String url = "E:/Y2总/eclipseEE/JavaEE/wyht/src/main/webapp/img/";// 保存路径
		File file = new File(url);
		if (!file.exists()) {// 如果目录不存在
			file.mkdirs();// 创建目录
		}
		input_file.transferTo(new File(url + name));// 保存文件
		return name;// 返回图片名称
	}

	// ------------添加员工
	@RequestMapping(value = "/staff_add")
	public String EmployeeAdd(HttpServletRequest request, MultipartFile input_file, Employee employee)
			throws Exception {
		if (!input_file.isEmpty()) {
			employee.setEmpPhoto(upload(request, input_file));
		}
		employeeService.insertSelective(employee);
		return "redirect:all";
	}

	// ------------删除员工
	@RemoteMethod
	public String EmployeeDelete(int empid) {
		employeeService.deleteByPrimaryKey(empid);
		return "redirect:all";
	}

	// ------------修改员工
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

	// ------------用于修改和高级查询时查出所有
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

	// --------------------------查看所有的部门
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
		PageInfo2 page2 = new PageInfo2(page, getPageNum(pageNum));// 分页导航条，
		page2.setSelectnum(selectnum);
		page2.setSize(getPageSize(pageSize));// 将当期的页数存进去
		// 传岗位数量
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

	// ------------添加部门
	@RequestMapping("/department_add")
	public String department_add(HttpServletRequest request, Department dep) {
		departmentService.insertSelective(dep);
		return "redirect:department_all";
	}

	// -----------查詢所有部門用于验证
	@RemoteMethod
	public int yz_depName(String depName) {
		int flag = departmentService.yanzheng(depName);
		return flag;
	}

	// ------------删除部门 第一种是a标签传值且没有异步的
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

	// ------------查询岗位
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

	// -----------添加岗位
	@RequestMapping("/post_add")
	public String PostAdd(Post post) {
		postService.insertSelective(post);
		return "redirect:department_edit/" + post.getPostDepId();
	}

	// -----------查詢所有部門用于验证
	@RemoteMethod
	public int yz_postName(String postName) {
		int flag = postService.yanzheng(postName);
		return flag;
	}

	// -----------删除岗位 (之前Ajax的)
	// @RequestMapping("/post_del/{postId}")
	@RemoteMethod
	public String departmentDelete(int postId) {
		Post post = postService.selectByPrimaryKey(postId);
		postService.deleteByPrimaryKey(postId);
		return "redirect:department_edit/" + post.getPostDepId();
	}

	// -----------编辑岗位 (之前Ajax的)// @RequestMapping("/post_edit")// @ResponseBody
	@RemoteMethod
	public Post PostEdit(int postid) {
		Post post = postService.selectByPrimaryKey(postid);
		return post;
	}

	// -----------修改岗位
	@RequestMapping("/post_update")
	public String PostUpdate(@ModelAttribute("post") Post post) {
		postService.updateByPrimaryKeySelective(post);
		return "redirect:department_edit/" + post.getPostDepId();
	}

	// -----------查出所有员工的通告-----------------
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
		PageInfo2 page2 = new PageInfo2(page, getPageNum(pageNum));// 分页导航条，
		page2.setSelectnum(selectnum);
		page2.setSize(getPageSize(pageSize));// 将当期的页数存进去
		model.addAttribute("mohu", mohu);
		model.addAttribute("page", page);
		model.addAttribute("page2", page2);
		return "staff/notice_emp";
	}

	// -----------添加通告
	@RequestMapping("/notice_add")
	public String InternalnoticeAdd(Internalnotice notice) {
		internalnoticeService.insertSelective(notice);
		return "redirect:internal_notice";
	}

	// ------------一开始的时候把所有部门查出来（用于通知的三级联动）
	@RemoteMethod
	public List<Department> selectAllDepartment() {
		List<Department> dep = departmentService.selectAll();
		return dep;
	}

	// ------------添加通知时的三级级联动（三级）
	@RemoteMethod
	public List<Employee> selectEmployee(int postid) {
		List<Employee> emp = employeeService.selectEmployee(postid);
		return emp;
	}

	// -----------查看通告详情
	@RemoteMethod
	public Internalnotice internalnotice_selectKey(int intnotId) {
		Internalnotice internalnotice = internalnoticeService.selectByPrimaryKey(intnotId);
		return internalnotice;
	}

	// -----------删除通告
	@RemoteMethod
	public String Internalnoticedel(int intnotId) {
		internalnoticeService.deleteByPrimaryKey(intnotId);
		return "redirect:internal_notice";
	}

	// ----------------------------查出所有业主的通告---------------------
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
		PageInfo2 page2 = new PageInfo2(page, getPageNum(pageNum));// 分页导航条，
		page2.setSelectnum(selectnum);
		page2.setSize(getPageSize(pageSize));// 将当期的页数存进去
		model.addAttribute("mohu", mohu);
		model.addAttribute("page", page);
		model.addAttribute("page2", page2);
		return "staff/message_all";
	}

	// -----------查看通告详情
	@RemoteMethod
	public List<Owners> selectownersname() {
		// 多了一条语句，得去晓欣的控制器Dao里加一条语句 把状态等于2改成了fanid>0
		List<Owners> Owners = ownersService.selectAllName();
		return Owners;
	}

	// -----------添加任务
	@RequestMapping("/message_add")
	public String messageAdd(Message message) {
		messageService.insertSelective(message);
		return "redirect:message_all";
	}

	// -----------查看详情信息
	@RemoteMethod
	public Message message_selectKey(int mesId) {
		Message mes = messageService.selectByPrimaryKey(mesId);
		return mes;
	}

	// -----------删除任务
	@RemoteMethod
	public String messageDel(int mesId) {
		messageService.deleteByPrimaryKey(mesId);
		return "redirect:message_all";
	}

	// -----------查看所有内部报表
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
		PageInfo2 page2 = new PageInfo2(page, page.getPageNum());// 分页导航条，
		page2.setSelectnum(selectnum);
		page2.setSize(getPageSize(pageSize));// 将当期的页数存进去
		model.addAttribute("page", page);
		model.addAttribute("page2", page2);
		;
		return "staff/internal_all";
	}

	// ----------------------------查看内部报表---------------------
	@RequestMapping("/internal_add")
	public String internalAdd(HttpServletRequest request, MultipartFile input_file, Internal internal)
			throws Exception {
		if (!input_file.isEmpty()) {
			internal.setInterIntimg(upload(request, input_file));
		}
		internalService.insertSelective(internal);
		return "redirect:internal_all";
	}

	// -----------查看内部报表详情
	@RemoteMethod
	public Internal internal_selectKey(int interId) {
		Internal internal = internalService.selectByPrimaryKey(interId);
		return internal;
	}

	// -----------删除内部报事
	@RemoteMethod
	public String internalDel(int interId) {
		internalService.deleteByPrimaryKey(interId);
		return "redirect:../internal_all";
	}

	// -----------修改内部报事的状态
	@RequestMapping("/internal_update")
	public String internalUpdate(Internal internal) {
		internalService.updateByPrimaryKeySelective(internal);
		return "redirect:internal_all";
	}

	// ----------------------------查看所有投诉---------------------
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
		PageInfo2 page2 = new PageInfo2(page, page.getPageNum());// 分页导航条，
		page2.setSelectnum(selectnum);
		page2.setSize(getPageSize(pageSize));// 将当期的页数存进去
		model.addAttribute("page", page);
		model.addAttribute("page2", page2);
		;
		return "staff/cmplaints_all";
	}

	// -----------查出所有投诉类型
	@RemoteMethod
	public List<Cmptype> selectAllcmptype() {
		List<Cmptype> cmptype = cmptypeService.selectAll();
		return cmptype;
	}

	// -----------添加投诉内容
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

	// -----------删除内部报事
	@RemoteMethod
	public String cmplaintsDel(int cid) {
		cmplaintsService.deleteByPrimaryKey(cid);
		return "redirect:../cmplaints_all";
	}

	// -----------修改岗位
	@RequestMapping("/cmplaints_update")
	public String CmplaintsUpdate(Cmplaints cmp) {
		cmplaintsService.updateByPrimaryKeySelective(cmp);
		return "redirect:../staff/cmplaints_all";
	}

	// ----------------------------查看所有常规任务---------------------
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
		PageInfo2 page2 = new PageInfo2(page, getPageNum(pageNum));// 分页导航条，
		page2.setSelectnum(selectnum);
		page2.setSize(getPageSize(pageSize));// 将当期的页数存进去
		model.addAttribute("page", page);
		model.addAttribute("page2", page2);
		;
		return "staff/task_all";
	}

	// -----------查看通告详情
	@RequestMapping("/select_key/{taskId}")
	public String taskAll(@PathVariable("taskId") int taskId, Model model) {
		Task task = taskService.selectByPrimaryKey(taskId);
		model.addAttribute("task", task);
		return "staff/task";
	}

	// -----------查出所有的任务类型
	@RemoteMethod
	public List<Tasktype> task_all() {
		List<Tasktype> Tasktype = tasktypeService.selectAll();
		return Tasktype;
	}

	// ------------用于添加任务时的二级联动
	@RemoteMethod
	public List<Employee> selectEmployeeDep(int depid) {
		List<Employee> emp = employeeService.selectEmployeeDep(depid);
		return emp;
	}

	// 跳转到添加任务页面
	@RequestMapping("/task-add")
	public String taskAdd() {
		return "staff/add_task";
	}

	// -----------添加任务
	@RequestMapping("/task_add")
	public String taskAdd(Task task) {
		taskService.insertSelective(task);
		return "redirect:task_all";
	}

	// -----------删除任务
	@RemoteMethod
	public String taskDel(int taskId) {
		taskService.deleteByPrimaryKey(taskId);
		return "redirect:../task_all";
	}

	// ----------------------------查看报修列表---------------------
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
		PageInfo2 page2 = new PageInfo2(page, getPageNum(pageNum));// 分页导航条，
		page2.setSelectnum(selectnum);
		page2.setSize(getPageSize(pageSize));// 将当期的页数存进去
		model.addAttribute("page", page);
		model.addAttribute("page2", page2);
		return "staff/warranty_all";
	}

	// -----------查看报修类型
	@RemoteMethod
	public List<Wartype> selectAllwartype() {
		List<Wartype> wartype = wartypeService.selectAll();
		return wartype;
	}

	// -----------添加报修内容
	@RequestMapping("/warranty_add")
	public String warrantyAdd(HttpServletRequest request, MultipartFile input_file, Warranty warranty)
			throws Exception {
		if (!input_file.isEmpty()) {
			warranty.setWarImg(upload(request, input_file));
		}
		warrantyService.insertSelective(warranty);
		return "redirect:warranty_all";
	}

	// -----------查看报修详情
	@RemoteMethod
	public Warranty warranty_selectKey(int warId) {
		Warranty war = warrantyService.selectByPrimaryKey(warId);
		// HouseFan fan = houseFanService.selectFandid(warId);
		// war.setHnum(fan.getHnum());
		return war;
	}

	// -----------删除报修内容
	@RemoteMethod
	public String warrantyDel(int warId) {
		warrantyService.deleteByPrimaryKey(warId);
		return "redirect:../cmplaints_all";
	}

	// -----------修改岗位
	@RequestMapping("/war_update")
	public String WarrantyUpdate(Warranty war) {
		warrantyService.updateByPrimaryKeySelective(war);
		return "redirect:../staff/warranty_all";
	}

	// 管理员全部
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
		PageInfo2 page2 = new PageInfo2(page, getPageNum(pageNum));// 分页导航条，
		page2.setSelectnum(selectnum);
		page2.setSize(getPageSize(pageSize));// 将当期的页数存进去
		model.addAttribute("page", page);
		model.addAttribute("page2", page2);
		return "staff/admin";
	}

	// 添加管理员
	@RequestMapping("/addAdmin")
	public String addAdmin(User user) {
		encryptPassword(user);
		userService.insertSelective(user);
		return "redirect:admin";
	}

	// 删除管理员
	@RemoteMethod
	public int delAdmin(int userId) {
		int count = userPermService.deleteUserId(userId);
		count += userService.deleteByPrimaryKey(userId);
		return count;
	}

	// 修改密码
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

	public void thisEndSizeNum(String num, String size) {// 将当前页数覆给最后页数
		endPageNum = getPageNum(num);
		endPageSize = getPageSize(size);
	}

	// 給密碼加密
	public void encryptPassword(User user) {
		System.out.println(user.getUserName() + "  " + user.getUserPass());
		// User对象包含最基本的字段Username和Password
		String salt1 = user.getUserName();
		String salt2 = new SecureRandomNumberGenerator().nextBytes().toHex();
		user.setUserSalt(salt2);
		// 将用户的注册密码经过散列算法替换成一个不可逆的新密码保存进数据，散列过程使用了盐
		String newPassword = new SimpleHash(algorithmName, user.getUserPass(), salt1 + salt2, hashIterations).toHex();
		user.setUserPass(newPassword);
	}
}
