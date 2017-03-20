package com.lianluo.hefeng;

/**
 * 
 * TODO {当天每小时天气预报}
 *
 * @author mao.ru
 * @version 
 * @since JDK 1.7
 */
public class HourlyForecast {
	/* 天气状况 */
	private Cond cond;
	/* 时间 */
	private String date;
	/* 相对湿度（%） */
	private String hum;
	/* 降水概率 */
	private String pop;
	/* 气压 */
	private String pres;
	/* 温度 */
	private String tmp;
	/* 风力风向 */
	private Wind wind;

	public void setCond(Cond cond) {
		this.cond = cond;
	}

	public Cond getCond() {
		return cond;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getDate() {
		return date;
	}

	public void setHum(String hum) {
		this.hum = hum;
	}

	public String getHum() {
		return hum;
	}

	public void setPop(String pop) {
		this.pop = pop;
	}

	public String getPop() {
		return pop;
	}

	public void setPres(String pres) {
		this.pres = pres;
	}

	public String getPres() {
		return pres;
	}

	public void setTmp(String tmp) {
		this.tmp = tmp;
	}

	public String getTmp() {
		return tmp;
	}

	public void setWind(Wind wind) {
		this.wind = wind;
	}

	public Wind getWind() {
		return wind;
	}

}