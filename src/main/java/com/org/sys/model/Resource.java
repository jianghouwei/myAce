package com.org.sys.model;

import java.util.List;


public class Resource {
	private Integer id;

	private String menuName;

	private String menuIcon;

	private Integer levelPid;

	private String leveSort;

	private String menuMsg;

	private String menuUrl;

	/**
	 * 是否含有子节点
	 */
	private Boolean hasSubNode;
	
	/**
	 * 子节点菜单
	 */
	private List<Resource> subMenu;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName == null ? null : menuName.trim();
	}

	public String getMenuIcon() {
		return menuIcon;
	}

	public void setMenuIcon(String menuIcon) {
		this.menuIcon = menuIcon == null ? null : menuIcon.trim();
	}

	public Integer getLevelPid() {
		return levelPid;
	}

	public void setLevelPid(Integer levelPid) {
		this.levelPid = levelPid;
	}

	public String getLeveSort() {
		return leveSort;
	}

	public void setLeveSort(String leveSort) {
		this.leveSort = leveSort == null ? null : leveSort.trim();
	}

	public String getMenuMsg() {
		return menuMsg;
	}

	public void setMenuMsg(String menuMsg) {
		this.menuMsg = menuMsg == null ? null : menuMsg.trim();
	}

	public String getMenuUrl() {
		return menuUrl;
	}

	public void setMenuUrl(String menuUrl) {
		this.menuUrl = menuUrl == null ? null : menuUrl.trim();
	}

	public Boolean getHasSubNode() {
		return hasSubNode;
	}

	public void setHasSubNode(Boolean hasSubNode) {
		this.hasSubNode = hasSubNode;
	}

	public List<Resource> getSubMenu() {
		return subMenu;
	}

	public void setSubMenu(List<Resource> subMenu) {
		this.subMenu = subMenu;
	}
	
	
}