package com.sve.shiro.util;

import java.util.concurrent.atomic.AtomicInteger;

import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.ehcache.EhCacheManager;

public class RetryLimitHashedCredentialsMatcher extends HashedCredentialsMatcher {
	// ����һ������ӿڣ�����ӿ���Shiro��������һ���֣����ľ���ʵ�ֿ���ͨ���ⲿ����ע��
    private Cache<String, AtomicInteger> passwordRetryCache;
    private EhCacheManager cacheManager;
    public RetryLimitHashedCredentialsMatcher(EhCacheManager cacheManager) {
    	this.cacheManager=cacheManager;
        passwordRetryCache = cacheManager.getCache("passwordRetryCache");
    }

	@Override
    public boolean doCredentialsMatch(AuthenticationToken token, AuthenticationInfo info) {
        String username = (String) token.getPrincipal();
        AtomicInteger retryCount = passwordRetryCache.get(username);
        Long lockTime=cacheManager.getCacheManager().getCache("passwordRetryCache")
        		.getCacheConfiguration().getTimeToLiveSeconds();
        if (retryCount == null) {
            retryCount = new AtomicInteger(0);
            passwordRetryCache.put(username, retryCount);
        }
        // �Զ���һ����֤���̣����û����������������5�����Ͻ�ֹ�û���¼һ��ʱ��
        if (retryCount.incrementAndGet() > 5) {
        	System.out.println("�˻�������,����" + lockTime / 60 + "�ֺ����µ�¼");
            throw new ExcessiveAttemptsException();
        }
        boolean match = super.doCredentialsMatch(token, info);
        if (match) {
            passwordRetryCache.remove(username);
        }
        return match;
    }
}
