package com.sve.shiro.util;

import java.text.MessageFormat;
import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.config.Ini;
import org.apache.shiro.config.Ini.Section;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.CollectionUtils;
import org.apache.shiro.web.config.IniFilterChainResolverFactory;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.FactoryBean;
import org.springframework.beans.factory.annotation.Autowired;

import com.sve.auto.model.Permission;
import com.sve.auto.model.User;
import com.sve.auto.service.impl.PermissionServiceImpl;
import com.sve.auto.service.impl.UserServiceImpl;

public class ShiroPermissionFactory extends ShiroFilterFactoryBean {
	//Ϊ�ӽ�ȥ����û���ƺ�
	@Autowired
	private PermissionServiceImpl permissionService;
	/** �����еĹ����� */
	public static String filterChainDefinitions;

	/**
	 * �����ݿ⶯̬��ȡȨ��
	 */
	@Override
	public void setFilterChainDefinitions(String definitions) {
		ShiroPermissionFactory.filterChainDefinitions = definitions;
		// ���ݿ⶯̬Ȩ��
		List<Permission> permlist = permissionService.selectAll();
		if (permlist != null && permlist.size() != 0) {
			for (Permission perm : permlist) {
				// �ַ���ƴ��Ȩ��
				if (perm.getPermUrl() != null&&perm.getPermCode()!=null 
						&&!perm.getPermCode().equals("") && !"".equals(perm.getPermUrl() )) {
					definitions = definitions +perm.getPermUrl() + " = " + "authc,perms["+perm.getPermCode()+"]\n";
				}
			}
			definitions+="/**=authc";
		}
		// �������ļ�����Ȩ������
		Ini ini = new Ini();
		ini.load(definitions);
		Ini.Section section = ini.getSection(IniFilterChainResolverFactory.URLS);
		if (CollectionUtils.isEmpty(section)) {
			section = ini.getSection(Ini.DEFAULT_SECTION_NAME);
		}
		// ����Ȩ�޼���
		setFilterChainDefinitionMap(section);
	}

}
