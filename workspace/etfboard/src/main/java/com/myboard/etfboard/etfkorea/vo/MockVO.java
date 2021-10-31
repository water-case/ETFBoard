package com.myboard.etfboard.etfkorea.vo;

import org.springframework.stereotype.Component;

@Component("mockVO")
public class MockVO {
	private String name;
	private String itemcode;
	private int havenum;
	private int buymoney;
	
	public MockVO() {
	}

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

	public int getBuymoney() {
		return buymoney;
	}

	public void setBuymoney(int buymoney) {
		this.buymoney = buymoney;
	}
	
	
}
