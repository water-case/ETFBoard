package com.myboard.etfboard.etfkorea.vo;

import org.springframework.stereotype.Component;

@Component("etfVO")
public class EtfVO implements Comparable<EtfVO>{
	
	private String itemcode;
	private String itemname;
	private int nowVal;
	private int changeVal;
	private double changeRate;
	private int nav;
	private int quant;
	private int marketSum;
	
	public EtfVO() {
	}
	public EtfVO(String itemcode, String itemname, int nowVal, int changeVal, double changeRate, int nav, int quant,
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

	public String getItemcode() {
		return itemcode;
	}

	public void setItemcode(String itemcode) {
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

	public int getChangeVal() {
		return changeVal;
	}

	public void setChangeVal(int changeVal) {
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
