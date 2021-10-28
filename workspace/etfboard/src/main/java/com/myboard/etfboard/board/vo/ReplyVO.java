package com.myboard.etfboard.board.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("replyVO")
public class ReplyVO {
	private int boardIndex;
	private int replyIndex;
	private int groupIndex;
	private int grade;
	private String name;
	private String text;
	private Date writtenDate;
	
	public ReplyVO() {
	}
	
	public ReplyVO(int boardIndex, int grade, String name, String text) {
		this.boardIndex = boardIndex;
		this.grade = grade;
		this.name = name;
		this.text = text;
	}
	public int getBoardIndex() {
		return boardIndex;
	}
	public void setBoardIndex(int boardIndex) {
		this.boardIndex = boardIndex;
	}
	
	public int getReplyIndex() {
		return replyIndex;
	}
	public void setReplyIndex(int replyIndex) {
		this.replyIndex = replyIndex;
	}
	public int getGroupIndex() {
		return groupIndex;
	}
	public void setGroupIndex(int groupIndex) {
		this.groupIndex = groupIndex;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public Date getWrittenDate() {
		return writtenDate;
	}
	public void setWrittenDate(Date writtenDate) {
		this.writtenDate = writtenDate;
	}
	
	
}
