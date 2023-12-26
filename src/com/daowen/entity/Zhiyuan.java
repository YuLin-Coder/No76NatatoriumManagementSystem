package com.daowen.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Zhiyuan {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	private String accountname;

	public String getAccountname() {
		return accountname;
	}

	public void setAccountname(String accountname) {
		this.accountname = accountname;
	}

	private String password;

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	private String name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	private String sex;

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	private String lianxiren;

	public String getLianxiren() {
		return lianxiren;
	}

	public void setLianxiren(String lianxiren) {
		this.lianxiren = lianxiren;
	}

	private String jiguan;

	public String getJiguan() {
		return jiguan;
	}

	public void setJiguan(String jiguan) {
		this.jiguan = jiguan;
	}

	private String nation;

	public String getNation() {
		return nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	private String bumen;

	public String getBumen() {
		return bumen;
	}

	public void setBumen(String bumen) {
		this.bumen = bumen;
	}

	private String zhiwu;

	public String getZhiwu() {
		return zhiwu;
	}

	public void setZhiwu(String zhiwu) {
		this.zhiwu = zhiwu;
	}

	private String mobile;

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	private String qq;

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	private String des;

	public String getDes() {
		return des;
	}

	public void setDes(String des) {
		this.des = des;
	}

	private String photo;

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}
}
