package com.sve.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.subject.Subject;
import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sve.auto.model.Menu;
import com.sve.auto.model.Permission;
import com.sve.auto.model.User;
import com.sve.auto.model.UserPerm;
import com.sve.auto.service.MenuService;
import com.sve.auto.service.PermissionService;
import com.sve.auto.service.UserPermService;
import com.sve.auto.service.UserService;
import com.sve.util.VerifyCodeUtils;

@Controller
@RequestMapping("/auth")
@RemoteProxy(name = "autoController")
public class AutoController {
	private String algorithmName = "md5";
	private final int hashIterations = 3;// 3次迭代

	@Autowired
	private UserService userService;
	@Autowired
	private PermissionService permissionService;
	@Autowired
	private UserPermService userPermService;
	@Autowired
	private MenuService menuService;

	@RequestMapping("/register")
	public String register(User user) {
		encryptPassword(user);
		userService.insertSelective(user);
		return "redirect:index/index";
	}
	//没有该页面
	@RequestMapping("/nopage")
	public String nopage(Model model){
		return "acs_list.wy";
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

	@RequestMapping("/login")
	public String login() {
		return "index/login";
	}

	@RemoteMethod
	public String islogin(User user,HttpServletRequest request) {
		UsernamePasswordToken token = new UsernamePasswordToken(user.getUserName(), user.getUserPass());
		Subject subject = SecurityUtils.getSubject();
		String error = "";
		try {
			subject.login(token);
		} catch (IncorrectCredentialsException ice) {
			// 捕获密码错误异常
			error = "0";// 密码错误！";
		} catch (UnknownAccountException uae) {
			// 捕获未知用户名异常
			error = "1";// 用户错误！";
		} catch (ExcessiveAttemptsException e) {
			error = "2";// 登录失败多次，账户锁定10分钟";
		}
		//转为小写比较
		if(!user.getYzm().toLowerCase().equals(request.getSession().getAttribute("_code").toString().toLowerCase())){
			error="3";
		}
		if (error != "") {
			return error;
		}
		User users = userService.findisUser(user);
		subject.getSession().setAttribute("user", users);
		return token.getCredentials().toString();
	}
	
	@RemoteMethod
	public int updatePwd(String password){
		String userName=SecurityUtils.getSubject().getPrincipal().toString();
		User user=userService.findUsername(userName);
		user.setUserPass(password);
		encryptPassword(user);
		SecurityUtils.getSubject().logout();
		return userService.updateByPrimaryKeySelective(user);
	}

	@RequestMapping("/logins")
	public String logins() {
		return "redirect:/index/index";
	}

	// 验证码
	@RequestMapping("/getYzm")
	public void getYzm(HttpServletResponse response, HttpServletRequest request) {
		try {
			response.setHeader("Pragma", "No-cache");
			response.setHeader("Cache-Control", "no-cache");
			response.setDateHeader("Expires", 0);
			response.setContentType("image/jpeg");

			// 生成随机字串
			String verifyCode = VerifyCodeUtils.generateVerifyCode(4);
			// 存入会话session
			HttpSession session = request.getSession(true);
			session.setAttribute("_code", verifyCode.toLowerCase());
			// 生成图片
			int w = 146, h = 33;
			VerifyCodeUtils.outputImage(w, h, response.getOutputStream(), verifyCode);
		} catch (Exception e) {
			System.out.println("获取验证码异常：" + e.getMessage());
		}
	}

	// //没有权限
	@RequestMapping("/noauth")
	public String noAuth() {
		return "index/noauth";
	}
	//查看全部权限
	@RequestMapping("/authAll/{userId}")
	public String authAll(@PathVariable("userId")int userId,Model model){
		User user=userService.selectByPrimaryKey(userId);
		List<Menu> menulist=menuService.selectMenuPermUsname(user.getUserName());
		List<Menu> menuall=menuService.selectAllMenuPerm();
		List<String> permlist=new ArrayList<String>();
		for(Menu menu : menulist){
			for(Permission perm:menu.getPermlist()){
				permlist.add(perm.getPermName());
			}
		}
		model.addAttribute("menuAll",menuall);
		model.addAttribute("myperm", permlist);
		model.addAttribute("user", user);
		return "auth.wy";
	}
	
	//添加权限
	@RemoteMethod
	public int addAuth(UserPerm userPerm){
		int count=userPermService.insertSelective(userPerm);
		return count;
	}
	//删除权限
	@RemoteMethod
	public int delAuth(UserPerm userPerm){
		int count=userPermService.deleteUserPerm(userPerm);
		return count;
	}
	
	@RemoteMethod
	public int isUser(User user){
		return userService.isUserphone(user);
	}
	//初始化權限
//	@RequestMapping("/AddpermRole")
//	public String AddPermRole() {
//		List<Permission> list = permissionService.selectAll();
//		UserPerm userPerm=new UserPerm();
//		for (Permission perm : list) {
//			userPerm.setUpUserId(1);
//			userPerm.setUpPermId(perm.getPermId());
//			userPermService.insertSelective(userPerm);
//		}
//		return "";
//	}
}
