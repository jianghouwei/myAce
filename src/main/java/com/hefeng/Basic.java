package com.lianluo.hefeng;

public class Basic {

	/* 城市名称 */
	private String city;
	/* 国家 */
	private String cnty;
	/* 城市ID */
	private String id;
	/* 城市纬度 */
	private String lat;
	/* 城市经度 */
	private String lon;
	/* 更新时间 */
	private Update update;

	public void setCity(String city) {
		this.city = city;
	}

	public String getCity() {
		return city;
	}

	public void setCnty(String cnty) {
		this.cnty = cnty;
	}

	public String getCnty() {
		return cnty;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getId() {
		return id;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getLat() {
		return lat;
	}

	public void setLon(String lon) {
		this.lon = lon;
	}

	public String getLon() {
		return lon;
	}

	public void setUpdate(Update update) {
		this.update = update;
	}

	public Update getUpdate() {
		return update;
	}

}