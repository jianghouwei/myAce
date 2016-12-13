package com.org.common.model;

import java.util.List;

/**
 * 
 * TODO {Jquery DataTable Page Model}
 *
 * @author mao.ru
 * @version
 * @since JDK 1.7
 */
public class DtPage<T> {

	/*
	 * sEcho=1&iColumns=13&sColumns=&iDisplayStart=0&
	 * iDisplayLength=10&mDataProp_0=0&
	 * mDataProp_1=1&mDataProp_2=2&mDataProp_3=3&
	 * mDataProp_4=4&mDataProp_5=5&mDataProp_6=6&
	 * mDataProp_7=7&mDataProp_8=8&mDataProp_9=9&
	 * mDataProp_10=10&mDataProp_11=11&mDataProp_12=12&
	 * sSearch=&bRegex=false&sSearch_0=& bRegex_0=false&bSearchable_0=true&
	 * sSearch_1=&bRegex_1=false&bSearchable_1=true&
	 * sSearch_2=&bRegex_2=false&bSearchable_2=true&
	 * sSearch_3=&bRegex_3=false&bSearchable_3=true&
	 * sSearch_4=&bRegex_4=false&bSearchable_4=true&
	 * sSearch_5=&bRegex_5=false&bSearchable_5=true&
	 * sSearch_6=&bRegex_6=false&bSearchable_6=true&
	 * sSearch_7=&bRegex_7=false&bSearchable_7=true&
	 * sSearch_8=&bRegex_8=false&bSearchable_8=true&
	 * sSearch_9=&bRegex_9=false&bSearchable_9=true&
	 * sSearch_10=&bRegex_10=false&bSearchable_10=true&sSearch_11=&
	 * bRegex_11=false&bSearchable_11=true&sSearch_12=&bRegex_12=false&
	 * bSearchable_12=true&iSortCol_0=0&sSortDir_0=asc&iSortingCols=1&
	 * bSortable_0=true&bSortable_1=true&bSortable_2=true&bSortable_3=true&
	 * bSortable_4=true&bSortable_5=true&bSortable_6=true&bSortable_7=true&
	 * bSortable_8=true &bSortable_9=true&bSortable_10=true&
	 * bSortable_11=true&bSortable_12=true
	 */
	private List<T> aaData;
	private Long sEcho;// 页码
	private Long iTotalRecords; // 总长度
	private Long iTotalDisplayRecords;// 总长度
	private Long iDisplayStart;// 每次查询的起始记录
	private Long iDisplayLength;// 长度
	private T param;//存放参数
	
	public List<T> getAaData() {
		return aaData;
	}

	public void setAaData(List<T> aaData) {
		this.aaData = aaData;
	}

	public Long getsEcho() {
		return sEcho;
	}

	public void setsEcho(Long sEcho) {
		this.sEcho = sEcho;
	}

	public Long getiTotalRecords() {
		return iTotalRecords;
	}

	public void setiTotalRecords(Long iTotalRecords) {
		this.iTotalRecords = iTotalRecords;
	}

	public Long getiTotalDisplayRecords() {
		return iTotalDisplayRecords;
	}

	public void setiTotalDisplayRecords(Long iTotalDisplayRecords) {
		this.iTotalDisplayRecords = iTotalDisplayRecords;
	}

	public Long getiDisplayStart() {
		return iDisplayStart;
	}

	public void setiDisplayStart(Long iDisplayStart) {
		this.iDisplayStart = iDisplayStart;
	}

	public Long getiDisplayLength() {
		return iDisplayLength;
	}

	public void setiDisplayLength(Long iDisplayLength) {
		this.iDisplayLength = iDisplayLength;
	}

	public T getParam() {
		return param;
	}

	public void setParam(T param) {
		this.param = param;
	}
	

}
