package com.daowen.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.util.Date;

@Entity
public class Srvorder {
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

	private String ydren;

	public String getYdren() {
		return ydren;
	}

	public void setYdren(String ydren) {
		this.ydren = ydren;
	}

	private Date yddate;

	public Date getYddate() {
		return yddate;
	}

	public void setYddate(Date yddate) {
		this.yddate = yddate;
	}

	private Date xdtime;

	public Date getXdtime() {
		return xdtime;
	}

	public void setXdtime(Date xdtime) {
		this.xdtime = xdtime;
	}

	private int srvtype;

	public int getSrvtype() {
		return srvtype;
	}

	public void setSrvtype(int srvtype) {
		this.srvtype = srvtype;
	}

	private Double payfee;

	public Double getPayfee() {
		return payfee;
	}

	public void setPayfee(Double payfee) {
		this.payfee = payfee;
	}

	private String srvname;

	public String getSrvname() {
		return srvname;
	}

	public void setSrvname(String srvname) {
		this.srvname = srvname;
	}

	private int state;

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	private String ydrname;

	public String getYdrname() {
		return ydrname;
	}

	public void setYdrname(String ydrname) {
		this.ydrname = ydrname;
	}

	private String ydridcardno;

	public String getYdridcardno() {
		return ydridcardno;
	}

	public void setYdridcardno(String ydridcardno) {
		this.ydridcardno = ydridcardno;
	}

	private String mobile;

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	private int srvid;

	public int getSrvid() {
		return srvid;
	}

	public void setSrvid(int srvid) {
		this.srvid = srvid;
	}

	private String des;

	public String getDes() {
		return des;
	}

	public void setDes(String des) {
		this.des = des;
	}
	
	private  String srvdes;
	
	public String getSrvdes() {
		return srvdes;
	}

	public void setSrvdes(String srvdes) {
		this.srvdes = srvdes;
	}

	public String getCommentdes() {
		return commentdes;
	}

	public void setCommentdes(String commentdes) {
		this.commentdes = commentdes;
	}

	private String   commentdes;
	
	private  String   comres;

	public String getComres() {
		return comres;
	}

	public void setComres(String comres) {
		this.comres = comres;
	}
	
	private String shaccount;

	public String getShaccount() {
		return shaccount;
	}

	public void setShaccount(String shaccount) {
		this.shaccount = shaccount;
	}
	
}
