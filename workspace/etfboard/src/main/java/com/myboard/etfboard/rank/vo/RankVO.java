package com.myboard.etfboard.rank.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("rankVO")
public class RankVO implements Comparable<RankVO>{
	private String name;
	private int money;
	private Date joinDate;
	private String top3[];
	private int top3val[];
	
	public RankVO() {
		top3 = new String[3];
		for(int i=0; i<top3.length; i++) {
			top3[i] = "";
		}
		top3val = new int[3];
		for(int i=0; i<top3val.length ;i++) {
			top3val[i] = 0;
		}
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	public String[] getTop3() {
		return top3;
	}

	public void setTop3(String[] top3) {
		this.top3 = top3;
	}

	public int[] getTop3val() {
		return top3val;
	}

	public void setTop3val(int[] top3val) {
		this.top3val = top3val;
	}
	
	@Override
	public int compareTo(RankVO rankVO) {
		if(rankVO.getMoney() > money) {
			return 1;
		} else if(rankVO.getMoney() < money) {
			return -1;
		}
		return 0;
	}
}