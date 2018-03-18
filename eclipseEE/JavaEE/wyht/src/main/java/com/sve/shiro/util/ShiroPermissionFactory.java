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
	//为加进去，还没完善好
	@Autowired
	private PermissionServiceImpl permissionService;
	/** 配置中的过滤链 */
	public static String filterChainDefinitions;

	/**
	 * 从数据库动态读取权限
	 */
	@Override
	public void setFilterChainDefinitions(String definitions) {
		ShiroPermissionFactory.filterChainDefinitions = definitions;
		// 数据库动态权限
		List<Permission> permlist = permissionService.selectAll();
		if (permlist != null && permlist.size() != 0) {
			for (Permission perm : permlist) {
				// 字符串拼接权限
				if (perm.getPermUrl() != null&&perm.getPermCode()!=null 
						&&!perm.getPermCode().equals("") && !"".equals(perm.getPermUrl() )) {
					definitions = definitions +perm.getPermUrl() + " = " + "authc,perms["+perm.getPermCode()+"]\n";
				}
			}
			definitions+="/**=authc";
		}
		// 从配置文件加载权限配置
		Ini ini = new Ini();
		ini.load(definitions);
		Ini.Section section = ini.getSection(IniFilterChainResolverFactory.URLS);
		if (CollectionUtils.isEmpty(section)) {
			section = ini.getSection(Ini.DEFAULT_SECTION_NAME);
		}
		// 加入权限集合
		setFilterChainDefinitionMap(section);
	}

}
