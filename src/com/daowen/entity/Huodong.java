package com.daowen.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Huodong {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	private String title;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	private int totalfee;

	public int getTotalfee() {
		return totalfee;
	}

	public void setTotalfee(int totalfee) {
		this.totalfee = totalfee;
	}

	private int youhui;

	public int getYouhui() {
		return youhui;
	}

	public void setYouhui(int youhui) {
		this.youhui = youhui;
	}

	private int state;

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}
}
