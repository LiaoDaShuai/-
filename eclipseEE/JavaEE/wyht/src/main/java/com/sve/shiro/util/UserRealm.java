package com.sve.shiro.util;

import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import com.sve.auto.model.Permission;
import com.sve.auto.model.User;
import com.sve.auto.service.impl.UserServiceImpl;

public class UserRealm extends AuthorizingRealm {

	@Autowired
	private UserServiceImpl userService;

	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		String username = (String) principals.getPrimaryPrincipal();
		SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
		// 根据用户名查询当前用户拥有的角色
		User user = userService.selectUserPermName(username);
		Set<String> permissionNames = new HashSet<String>();// 获取权限名称
		if (user != null) {
			for (Permission perm : user.getPermlist()) {
				if (perm != null&&perm.getPermCode()!=null&&!perm.getPermCode().equals("")) {
					permissionNames.add(perm.getPermCode());
				}
			}
		}
		// 将角色名提供给info
//		authorizationInfo.setRoles(rolename);
		// 将权限提供给info
		authorizationInfo.setStringPermissions(permissionNames);
		return authorizationInfo;
	}

	/**
	 * 提供账户信息返回认证信息
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken)
			throws AuthenticationException {
		String username = (String) authenticationToken.getPrincipal();
		User user = userService.findUsername(username);
		if (user == null) {
			// 用户名不存在抛出异常
			throw new UnknownAccountException();
		}
		if (user.getUserStatus() == 1) {// 1锁定
			// 用户被管理员锁定抛出异常
			throw new LockedAccountException();
		}
		// 最后的比对需要交给安全管理器
		// 三个参数进行初步的简单认证信息对象的包装
		// 交给AuthenticatingRealm使用CredentialsMatcher进行密码匹配
		SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(user.getUserName(), // 用户名
				user.getUserPass(), // 密码
				ByteSource.Util.bytes(user.getCredentialsSalt()), // salt=username+salt
				getName() // realm name
		);
		return authenticationInfo;
	}

	public void clearAuthz() {
		this.clearCachedAuthorizationInfo(SecurityUtils.getSubject().getPrincipals());
	}
}
