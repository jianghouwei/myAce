package com.org.shiro.model;

import java.io.Serializable;
import java.util.Set;

import com.google.common.base.Objects;

/**
 * 自定义Authentication对象，使得Subject除了携带用户的登录名外还可以携带更多信息.
 */
public class ShiroUser implements Serializable {

	/**
	 * serialVersionUID:TODO(用一句话描述这个变量表示什么).
	 * 
	 * @since JDK 1.7
	 */
	private static final long serialVersionUID = 8255683668102181982L;

	private Integer id;
	private String loginName;
	private String name;
	private Integer userType;
	private Set<String> roles;
	private Set<String> stringPermissions;

	private static String superRole = "admin";

	public ShiroUser(Integer id, String loginName, String name) {
		this.id = id;
		this.loginName = loginName;
		this.name = name;
	}

	public ShiroUser(Integer id, String loginName, String name, Integer userType) {
		super();
		this.id = id;
		this.loginName = loginName;
		this.name = name;
		this.userType = userType;
	}
	/**
	 * 
	 *
	 * TODO(是否有超级管理员权限)
	 *
	 * @author mao.ru
	 * @return
	 * @since JDK 1.7
	 * 
	 */
	public Boolean hasSuperUser(){
		if(roles != null && roles.contains(superRole)){
			return Boolean.TRUE;
		}else{
			return Boolean.FALSE;
		}
	}

	public String getSuperRole() {
		return superRole;
	}

	public Set<String> getRoles() {
		return roles;
	}

	public Set<String> getStringPermissions() {
		return stringPermissions;
	}

	public Integer getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public Integer getUserType() {
		return userType;
	}

	public String getLoginName() {
		return loginName;
	}

	/**
	 * 本函数输出将作为默认的<shiro:principal/>输出.
	 */
	@Override
	public String toString() {
		return loginName;
	}

	/**
	 * 重载hashCode,只计算loginName;
	 */
	@Override
	public int hashCode() {
		return Objects.hashCode(loginName);
	}

	/**
	 * 重载equals,只计算loginName;
	 */
	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (obj == null) {
			return false;
		}
		if (getClass() != obj.getClass()) {
			return false;
		}
		ShiroUser other = (ShiroUser) obj;
		if (loginName == null) {
			if (other.loginName != null) {
				return false;
			}
		} else if (!loginName.equals(other.loginName)) {
			return false;
		}
		return true;
	}

}
