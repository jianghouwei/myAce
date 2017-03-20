package com.lianluo.hefeng;

import java.util.Date;

/**
 * 
 * TODO { 天气预报 }
 *
 * @author mao.ru
 * @version
 * @since JDK 1.7
 */
public class DailyForecast {

	/* 天文数值 */
	private Astro astro;
	/* 天气状况 */
	private Cond cond;
	/* 预报日期 */
	private Date date;
	/* 相对湿度（%） */
	private String hum;
	/* 降水量（mm） */
	private String pcpn;
	/* 降水概率 */
	private String pop;
	/* 气压 */
	private String pres;
	/* 温度 */
	private Tmp tmp;
	/* 紫外线指数 */
	private String uv;
	/* 能见度（km） */
	private String vis;
	/* 风力风向 */
	private Wind wind;

	public void setAstro(Astro astro) {
		this.astro = astro;
	}

	public Astro getAstro() {
		return astro;
	}

	public void setCond(Cond cond) {
		this.cond = cond;
	}

	public Cond getCond() {
		return cond;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Date getDate() {
		return date;
	}

	public void setHum(String hum) {
		this.hum = hum;
	}

	public String getHum() {
		return hum;
	}

	public void setPcpn(String pcpn) {
		this.pcpn = pcpn;
	}

	public String getPcpn() {
		return pcpn;
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

	public void setTmp(Tmp tmp) {
		this.tmp = tmp;
	}

	public Tmp getTmp() {
		return tmp;
	}

	public void setUv(String uv) {
		this.uv = uv;
	}

	public String getUv() {
		return uv;
	}

	public void setVis(String vis) {
		this.vis = vis;
	}

	public String getVis() {
		return vis;
	}

	public void setWind(Wind wind) {
		this.wind = wind;
	}

	public Wind getWind() {
		return wind;
	}

}