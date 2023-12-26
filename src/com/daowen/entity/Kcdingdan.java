package com.daowen.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.util.Date;

@Entity
public class Kcdingdan {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	private String ddno;

	public String getDdno() {
		return ddno;
	}

	public void setDdno(String ddno) {
		this.ddno = ddno;
	}

	private String kcname;

	public String getKcname() {
		return kcname;
	}

	public void setKcname(String kcname) {
		this.kcname = kcname;
	}

	private int kcid;

	public int getKcid() {
		return kcid;
	}

	public void setKcid(int kcid) {
		this.kcid = kcid;
	}

	private String skaddress;

	public String getSkaddress() {
		return skaddress;
	}

	public void setSkaddress(String skaddress) {
		this.skaddress = skaddress;
	}

	private String jlaccount;

	public String getJlaccount() {
		return jlaccount;
	}

	public void setJlaccount(String jlaccount) {
		this.jlaccount = jlaccount;
	}

	private String jlname;

	public String getJlname() {
		return jlname;
	}

	public void setJlname(String jlname) {
		this.jlname = jlname;
	}

	private int renshu;

	public int getRenshu() {
		return renshu;
	}

	public void setRenshu(int renshu) {
		this.renshu = renshu;
	}

	private Double totalfee;

	public Double getTotalfee() {
		return totalfee;
	}

	public void setTotalfee(Double totalfee) {
		this.totalfee = totalfee;
	}

	private Double fee;

	public Double getFee() {
		return fee;
	}

	public void setFee(Double fee) {
		this.fee = fee;
	}

	private Date xdtime;

	public Date getXdtime() {
		return xdtime;
	}

	public void setXdtime(Date xdtime) {
		this.xdtime = xdtime;
	}

	private int state;

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	private String mobile;

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	private String hyaccount;

	public String getHyaccount() {
		return hyaccount;
	}

	public void setHyaccount(String hyaccount) {
		this.hyaccount = hyaccount;
	}

	private String hyname;

	public String getHyname() {
		return hyname;
	}

	public void setHyname(String hyname) {
		this.hyname = hyname;
	}
}
