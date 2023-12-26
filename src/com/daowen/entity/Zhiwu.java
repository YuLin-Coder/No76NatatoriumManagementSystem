package com.daowen.entity;

import java.util.Date;
import javax.persistence.*;

@Entity
public class Zhiwu {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	private String zhiwuming;

	public String getZhiwuming() {
		return zhiwuming;
	}

	public void setZhiwuming(String zhiwuming) {
		this.zhiwuming = zhiwuming;
	}

	private String des;

	public String getDes() {
		return des;
	}

	public void setDes(String des) {
		this.des = des;
	}
}
