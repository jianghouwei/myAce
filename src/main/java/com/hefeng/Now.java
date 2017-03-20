package com.lianluo.hefeng;

/**
 * 
 * TODO {实况天气}
 *
 * @author mao.ru
 * @version 
 * @since JDK 1.7
 */
public class Now {

	/*天气状况 */
	private Cond cond;
	/*体感温度 */
	private String fl;
	/*相对湿度（%） */
	private String hum;
	/*降水量（mm） */
	private String pcpn;
	/*气压 */
	private String pres;
	/*温度 */
	private String tmp;
	/*能见度（km） */
	private String vis;
	/* 风力风向 */
	private Wind wind;
	
	public void setCond(Cond cond) {
		this.cond = cond;
	}

	public Cond getCond() {
		return cond;
	}

	public void setFl(String fl) {
		this.fl = fl;
	}

	public String getFl() {
		return fl;
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