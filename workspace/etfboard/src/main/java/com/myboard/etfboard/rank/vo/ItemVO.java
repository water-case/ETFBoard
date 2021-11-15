package com.myboard.etfboard.rank.vo;

import org.springframework.stereotype.Component;

@Component("itemVO")
public class ItemVO {
	private String name;
	private String itemcode;
	private int havenum;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getItemcode() {
		return itemcode;
	}
	public void setItemcode(String itemcode) {
		this.itemcode = itemcode;
	}
	public int getHavenum() {
		return havenum;
	}
	public void setHavenum(int havenum) {
		this.havenum = havenum;
	}
	
}
