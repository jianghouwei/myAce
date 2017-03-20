package com.lianluo.hefeng;

/**
 * 
 * TODO {更新时间}
 *
 * @author mao.ru
 * @version
 * @since JDK 1.7
 */
public class Update {

	/* 当地时间 */
	private String loc;
	/* UTC时间 */
	private String utc;

	public void setLoc(String loc) {
		this.loc = loc;
	}

	public String getLoc() {
		return loc;
	}

	public void setUtc(String utc) {
		this.utc = utc;
	}

	public String getUtc() {
		return utc;
	}

}