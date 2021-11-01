package com.myboard.etfboard.etfkorea.vo;

import org.springframework.stereotype.Component;

@Component("mockVO")
public class MockVO {
	private String name;
	private String itemcode;
	private int havenum;
	private int buymoney;
	private String itemName;
	private String nowPrice;
	private String savePrice;
	private String buyNum;
	private int buyTotalPrice;
	
	public MockVO() {
	}
	public MockVO(String name, String itemcode) {
		this.name = name;
		this.itemcode = itemcode;
	}
	public MockVO(String name, String itemcode, String nowPrice, String buyNum) {
		this.name = name;
		this.itemcode = itemcode;
		this.nowPrice = nowPrice;
		this.buyNum = buyNum;
		this.buyTotalPrice = Integer.parseInt(nowPrice) * Integer.parseInt(buyNum);
	}
	
	public int getBuyTotalPrice() {
		return buyTotalPrice;
	}
	public void setBuyTotalPrice(int buyTotalPrice) {
		this.buyTotalPrice = buyTotalPrice;
	}
	public String getBuyNum() {
		return buyNum;
	}
	public void setBuyNum(String buyNum) {
		this.buyNum = buyNum;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getNowPrice() {
		return nowPrice;
	}
	public void setNowPrice(String nowPrice) {
		this.nowPrice = nowPrice;
	}
	public String getSavePrice() {
		return savePrice;
	}
	public void setSavePrice(String savePrice) {
		this.savePrice = savePrice;
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
