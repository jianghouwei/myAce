package com.lianluo.hefeng;

/**
 * 
 * TODO {风力风向}
 *
 * @author mao.ru
 * @version
 * @since JDK 1.7
 */
public class Wind {
	
	/* 风向（360度） */
	private String deg;
	/* 风向 */
	private String dir;
	/* 风力 */
	private String sc;
	/* 风速（kmph） */
	private String spd;

	public void setDeg(String deg) {
		this.deg = deg;
	}

	public String getDeg() {
		return deg;
	}

	public void setDir(String dir) {
		this.dir = dir;
	}

	public String getDir() {
		return dir;
	}

	public void setSc(String sc) {
		this.sc = sc;
	}

	public String getSc() {
		return sc;
	}

	public void setSpd(String spd) {
		this.spd = spd;
	}

	public String getSpd() {
		return spd;
	}

}