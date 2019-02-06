package com.spring.helper.vo.BoardVO;

import java.sql.Timestamp;

public class MessageVO {
    private String fromId;
    private String sendId;
    private String content;
    private Timestamp reg_date;
    private int temp1;
    private String temp2;
    private String temp3;
	public String getFromId() {
		return fromId;
	}
	public void setFromId(String fromId) {
		this.fromId = fromId;
	}
	public String getSendId() {
		return sendId;
	}
	public void setSendId(String sendId) {
		this.sendId = sendId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public int getTemp1() {
		return temp1;
	}
	public void setTemp1(int temp1) {
		this.temp1 = temp1;
	}
	public String getTemp2() {
		return temp2;
	}
	public void setTemp2(String temp2) {
		this.temp2 = temp2;
	}
	public String getTemp3() {
		return temp3;
	}
	public void setTemp3(String temp3) {
		this.temp3 = temp3;
	}
	@Override
	public String toString() {
		return "MessageVO [fromId=" + fromId + ", sendId=" + sendId + ", content=" + content + ", reg_date=" + reg_date
				+ ", temp1=" + temp1 + ", temp2=" + temp2 + ", temp3=" + temp3 + "]";
	}
    
    
}
