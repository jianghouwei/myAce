<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:forEach var="menu" items="${menuList}" varStatus="vs">  
  <c:set var="index" value="${index + 1}" scope="request" /><!-- 每一次循环，index+1 -->  
   <li class="" id="menu${menu.id}">
		<c:choose>
			<c:when test="${not empty menu.subMenu}">
				<a href="${menu.menuUrl == null ? '#' : menu.menuUrl}" class="dropdown-toggle" 
				<c:if test="${menu.menuUrl != null && menu.menuUrl !='#'}"> target="mainFrame" </c:if> > 
					<i class="${menu.menuIcon == null ? 'fa fa-list' : menu.menuIcon}"></i> 
					<span class="menu-text">${menu.menuName }</span>
					<b class="arrow fa fa-angle-down"></b>
				</a>
				<b class="arrow"></b>
			</c:when>
			<c:otherwise>
				<a href="${menu.menuUrl == null ? '#' : menu.menuUrl}" 
					<c:if test="${menu.menuUrl != null && menu.menuUrl !='#'}">target="mainFrame" onclick="siMenu('menu${menu.id}','menu${menu.levelPid }');"</c:if> > 
					<i class="menu-icon fa fa-leaf"></i>
					<i class="${menu.menuIcon == null ? 'fa fa-list' : menu.menuIcon}"></i>
					<span class="menu-text"> ${menu.menuName }</span>
				</a>
				<b class="arrow"></b>
			</c:otherwise>
		</c:choose>
	<c:if test="${not empty menu.subMenu}">
		<ul class="submenu" id="menu${menu.id }">
			<c:set var="level" value="${level + 1}" scope="request" /><!-- 循环一次子列表，level+1 -->  
    		<c:set var="menuList" value="${menu.subMenu}" scope="request" /><!-- 注意此处，子列表覆盖treeList，在request作用域 -->  
			<jsp:include page="menu_tree.jsp" />
		</ul>
	</c:if>				
  </li> 
</c:forEach>  
<c:set var="level" value="${level - 1}" scope="request" /><!-- 退出时，level-1 -->  
