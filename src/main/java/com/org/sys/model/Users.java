package com.org.sys.model;

import java.util.Date;

public class Users {
    private Integer id;

    private String uid;

    private String userName;

    private String password;
    
    private String salt;

    private String sex;

    private String nikeName;

    private String phone;
    
    private String picUrl;

    private String birthday;

    private String email;

    private String txQq;

    private String wyWb;

    private String txWx;

    private String maxim;

    private Date joined;
    
    private String isDel;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public String getNikeName() {
        return nikeName;
    }

    public void setNikeName(String nikeName) {
        this.nikeName = nikeName == null ? null : nikeName.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getPicUrl() {
        return picUrl;
    }

    public void setPicUrl(String picUrl) {
        this.picUrl = picUrl == null ? null : picUrl.trim();
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday == null ? null : birthday.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getTxQq() {
        return txQq;
    }

    public void setTxQq(String txQq) {
        this.txQq = txQq == null ? null : txQq.trim();
    }

    public String getWyWb() {
        return wyWb;
    }

    public void setWyWb(String wyWb) {
        this.wyWb = wyWb == null ? null : wyWb.trim();
    }

    public String getTxWx() {
        return txWx;
    }

    public void setTxWx(String txWx) {
        this.txWx = txWx == null ? null : txWx.trim();
    }

    public String getMaxim() {
        return maxim;
    }

    public void setMaxim(String maxim) {
        this.maxim = maxim == null ? null : maxim.trim();
    }

    public Date getJoined() {
        return joined;
    }

    public void setJoined(Date joined) {
        this.joined = joined;
    }

	public String getIsDel() {
		return isDel;
	}

	public void setIsDel(String isDel) {
		this.isDel = isDel;
	}
    
    
}