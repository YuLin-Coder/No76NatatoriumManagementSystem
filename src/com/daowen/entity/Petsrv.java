package com.daowen.entity;

import java.util.Date;
import javax.persistence.*;

@Entity
public class Petsrv {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	private String srvname;

	public String getSrvname() {
		return srvname;
	}

	public void setSrvname(String srvname) {
		this.srvname = srvname;
	}

	private int srvtype;

	public int getSrvtype() {
		return srvtype;
	}

	public void setSrvtype(int srvtype) {
		this.srvtype = srvtype;
	}

	private int price;

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	private Date begintime;

	public Date getBegintime() {
		return begintime;
	}

	public void setBegintime(Date begintime) {
		this.begintime = begintime;
	}

	private Date endtime;

	public Date getEndtime() {
		return endtime;
	}

	public void setEndtime(Date endtime) {
		this.endtime = endtime;
	}

	private String des;

	public String getDes() {
		return des;
	}

	public void setDes(String des) {
		this.des = des;
	}

	private String tupian;

	public String getTupian() {
		return tupian;
	}

	public void setTupian(String tupian) {
		this.tupian = tupian;
	}
	
	private String pubren;

	public String getPubren() {
		return pubren;
	}

	public void setPubren(String pubren) {
		this.pubren = pubren;
	}
}
