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
		// �����û�����ѯ��ǰ�û�ӵ�еĽ�ɫ
		User user = userService.selectUserPermName(username);
		Set<String> permissionNames = new HashSet<String>();// ��ȡȨ������
		if (user != null) {
			for (Permission perm : user.getPermlist()) {
				if (perm != null&&perm.getPermCode()!=null&&!perm.getPermCode().equals("")) {
					permissionNames.add(perm.getPermCode());
				}
			}
		}
		// ����ɫ���ṩ��info
//		authorizationInfo.setRoles(rolename);
		// ��Ȩ���ṩ��info
		authorizationInfo.setStringPermissions(permissionNames);
		return authorizationInfo;
	}

	/**
	 * �ṩ�˻���Ϣ������֤��Ϣ
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken)
			throws AuthenticationException {
		String username = (String) authenticationToken.getPrincipal();
		User user = userService.findUsername(username);
		if (user == null) {
			// �û����������׳��쳣
			throw new UnknownAccountException();
		}
		if (user.getUserStatus() == 1) {// 1����
			// �û�������Ա�����׳��쳣
			throw new LockedAccountException();
		}
		// ���ıȶ���Ҫ������ȫ������
		// �����������г����ļ���֤��Ϣ����İ�װ
		// ����AuthenticatingRealmʹ��CredentialsMatcher��������ƥ��
		SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(user.getUserName(), // �û���
				user.getUserPass(), // ����
				ByteSource.Util.bytes(user.getCredentialsSalt()), // salt=username+salt
				getName() // realm name
		);
		return authenticationInfo;
	}

	public void clearAuthz() {
		this.clearCachedAuthorizationInfo(SecurityUtils.getSubject().getPrincipals());
	}
}
