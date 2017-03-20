package com.lianluo.hefeng;

import java.util.List;

/**
 * 
 * TODO {和风天气实体类}
 *
 * @author mao.ru
 * @version 
 * @since JDK 1.7
 */
public class Heweather {

	/**
	 * 查询天气的基本信息
	 */
	private Basic basic;
	
	/**
	 * 天气预报
	 */
	private List<DailyForecast> daily_forecast;
	
	/**
	 * 当天每小时天气预报
	 */
	private List<HourlyForecast> hourly_forecast;
	/**
	 * 实况天气
	 */
	private Now now;
	/**
	 * 接口状态
	 */
	private String status;

	public void setBasic(Basic basic) {
		this.basic = basic;
	}

	public Basic getBasic() {
		return basic;
	}

	public List<DailyForecast> getDaily_forecast() {
		return daily_forecast;
	}

	public void setDaily_forecast(List<DailyForecast> daily_forecast) {
		this.daily_forecast = daily_forecast;
	}

	public List<HourlyForecast> getHourly_forecast() {
		return hourly_forecast;
	}

	public void setHourly_forecast(List<HourlyForecast> hourly_forecast) {
		this.hourly_forecast = hourly_forecast;
	}

	public void setNow(Now now) {
		this.now = now;
	}

	public Now getNow() {
		return now;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getStatus() {
		return status;
	}

}