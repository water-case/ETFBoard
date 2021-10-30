package com.myboard.etfboard.etfkorea.vo;

import org.springframework.stereotype.Component;

@Component("etfVO")
public class EtfVO implements Comparable<EtfVO>{
	
	private int itemcode;
	private String itemname;
	private int nowVal;
	private double changeVal;
	private double changeRate;
	private int nav;
	private int quant;
	private int marketSum;
	
	public EtfVO() {
	}
	public EtfVO(int itemcode, String itemname, int nowVal, double changeVal, double changeRate, int nav, int quant,
		int marketSum) {
		this.itemcode = itemcode;
		this.itemname = itemname;
		this.nowVal = nowVal;
		this.changeVal = changeVal;
		this.changeRate = changeRate;
		this.nav = nav;
		this.quant = quant;
		this.marketSum = marketSum;
	}

	public int getItemcode() {
		return itemcode;
	}

	public void setItemcode(int itemcode) {
		this.itemcode = itemcode;
	}

	public String getItemname() {
		return itemname;
	}

	public void setItemname(String itemname) {
		this.itemname = itemname;
	}

	public int getNowVal() {
		return nowVal;
	}

	public void setNowVal(int nowVal) {
		this.nowVal = nowVal;
	}

	public double getChangeVal() {
		return changeVal;
	}

	public void setChangeVal(double changeVal) {
		this.changeVal = changeVal;
	}

	public double getChangeRate() {
		return changeRate;
	}

	public void setChangeRate(double changeRate) {
		this.changeRate = changeRate;
	}

	public int getNav() {
		return nav;
	}

	public void setNav(int nav) {
		this.nav = nav;
	}

	public int getQuant() {
		return quant;
	}

	public void setQuant(int quant) {
		this.quant = quant;
	}

	public int getMarketSum() {
		return marketSum;
	}

	public void setMarketSum(int marketSum) {
		this.marketSum = marketSum;
	}

	@Override
	public int compareTo(EtfVO etfVO) {
		if (etfVO.getQuant() < quant) {
			return 1;
		} else if (etfVO.getQuant() > quant) {
			return -1;
		}
		return 0;
	}
	
}
