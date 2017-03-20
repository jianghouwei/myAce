package com.lianluo.hefeng;

/**
 * 
 * TODO {天气状况}
 *
 * @author mao.ru
 * @version
 * @since JDK 1.7
 */
public class Cond {
	/* 天气状况代码 */
	private String code;
	/* 天气状况描述 */
	private String txt;

	public void setCode(String code) {
		this.code = code;
	}

	public String getCode() {
		return code;
	}

	public void setTxt(String txt) {
		this.txt = txt;
	}

	public String getTxt() {
		return txt;
	}

}