package com.org.shiro.info;

import java.util.Set;

import javax.annotation.PostConstruct;

import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.org.common.utils.Encodes;
import com.org.shiro.exception.CaptchaException;
import com.org.shiro.exception.UserInfoNullException;
import com.org.shiro.model.ShiroUser;
import com.org.shiro.utils.UserUtil;
import com.org.sys.model.Users;
import com.org.sys.service.CommonService;

/**
 * 用户登录授权service(shrioRealm)
 */
@Service
public class UserRealm extends AuthorizingRealm {

	protected static Logger logger = Logger.getLogger(UserRealm.class);

	@Autowired
	private CommonService commonService;

	/**
	 * 认证回调函数,登录时调用.
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken authcToken) throws AuthenticationException {
		UsernamePasswordCaptchaToken token = (UsernamePasswordCaptchaToken) authcToken;
		Users user = commonService.selectUsersByLoginName(token.getUsername());
		if (user != null && doCaptchaValidate(token)) {
			token.setUserId(user.getId());
			byte[] salt = Encodes.decodeHex(user.getSalt());
			// 设置用户session
			setSession("users", user);
			return new SimpleAuthenticationInfo(user.getUserName(),
					user.getPassword(), ByteSource.Util.bytes(salt), user.getNikeName()!= null ? user.getNikeName():user.getUserName() );
		} else {
			throw new UserInfoNullException("用户不存在！");
		}
	}

	/**
	 * 授权查询回调函数, 进行鉴权但缓存中无用户的授权信息时调用.
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(
			PrincipalCollection principals) {
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		ShiroUser shiroUser = (ShiroUser) principals.getPrimaryPrincipal();
		SecurityUtils.getSubject().getSession().setAttribute(String.valueOf(shiroUser.getId()),
						SecurityUtils.getSubject().getPrincipals());
		Users user = (Users) getSession("users");
		Set<String> stringPermissions = null;// 权限
		Set<String> roles = commonService.selectRoleByUserId(user.getId());// 角色
		if (!roles.isEmpty()) {
			stringPermissions = commonService.selectAuthByUserId(user.getId());
		}
		// 赋予角色
		for (String role : roles) {
			info.addRole(role);
		}
		// 赋予权限
		for (String permission : stringPermissions) {
			// 判断是否有 del view addf edit addc jurisdiction
			info.addStringPermission(permission);
		}
		/***************************/
		/* 设置一些用户登录记录
		 * 登录记录		   */	
		/***************************/
		return info;
	}

	protected static void setSession(Object key, Object value) {
		Subject currentUser = SecurityUtils.getSubject();
		if (null != currentUser) {
			Session session = currentUser.getSession();
			if (null != session) {
				session.setAttribute(key, value);
			}
		}
	}
	
	protected static Object getSession(Object key) {
		Subject currentUser = SecurityUtils.getSubject();
		if (null != currentUser) {
			Session session = currentUser.getSession();
			if (null != session) {
				return session.getAttribute(key);
			}
		}
		return null;
	}

	/**
	 * 验证码校验
	 * 
	 * @param token
	 * @return boolean
	 */
	protected boolean doCaptchaValidate(UsernamePasswordCaptchaToken token) {
		String captcha = (String) SecurityUtils
				.getSubject()
				.getSession()
				.getAttribute(
						com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
		if (captcha != null && !captcha.equalsIgnoreCase(token.getCaptcha())) {
			throw new CaptchaException("验证码错误！");
		}
		return true;
	}

	/**
	 * 设定Password校验的Hash算法与迭代次数.
	 */
	@PostConstruct
	public void initCredentialsMatcher() {
		HashedCredentialsMatcher matcher = new HashedCredentialsMatcher(
				UserUtil.HASH_ALGORITHM);
		matcher.setHashIterations(UserUtil.HASH_INTERATIONS);
		setCredentialsMatcher(matcher);
	}

	@Override
	public void clearCachedAuthorizationInfo(PrincipalCollection principals) {
		super.clearCachedAuthorizationInfo(principals);
	}

	@Override
	public void clearCachedAuthenticationInfo(PrincipalCollection principals) {
		super.clearCachedAuthenticationInfo(principals);
	}

	@Override
	public void clearCache(PrincipalCollection principals) {
		super.clearCache(principals);
	}

	public void clearAllCachedAuthorizationInfo() {
		getAuthorizationCache().clear();
	}

	public void clearAllCachedAuthenticationInfo() {
		getAuthenticationCache().clear();
	}

	public void clearAllCache() {
		clearAllCachedAuthenticationInfo();
		clearAllCachedAuthorizationInfo();
	}
}
