package com.spring.helper.vo.BoardVO;

import java.sql.Timestamp;

public class MessageVO {
	private String messageNumber;
	private String memberEmail;
    private String messageFromId;
    private String messageSendId;
    private String messageContent;
    private Timestamp messageRegdate;
    private int messageAlarm;
    private int messageTemp1;
    private String messageTemp2;
    private String messageTemp3;
	public String getMessageNumber() {
		return messageNumber;
	}
	public void setMessageNumber(String messageNumber) {
		this.messageNumber = messageNumber;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getMessageFromId() {
		return messageFromId;
	}
	public void setMessageFromId(String messageFromId) {
		this.messageFromId = messageFromId;
	}
	public String getMessageSendId() {
		return messageSendId;
	}
	public void setMessageSendId(String messageSendId) {
		this.messageSendId = messageSendId;
	}
	public String getMessageContent() {
		return messageContent;
	}
	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}
	public Timestamp getMessageRegdate() {
		return messageRegdate;
	}
	public void setMessageRegdate(Timestamp messageRegdate) {
		this.messageRegdate = messageRegdate;
	}
	public int getMessageAlarm() {
		return messageAlarm;
	}
	public void setMessageAlarm(int messageAlarm) {
		this.messageAlarm = messageAlarm;
	}
	public int getMessageTemp1() {
		return messageTemp1;
	}
	public void setMessageTemp1(int messageTemp1) {
		this.messageTemp1 = messageTemp1;
	}
	public String getMessageTemp2() {
		return messageTemp2;
	}
	public void setMessageTemp2(String messageTemp2) {
		this.messageTemp2 = messageTemp2;
	}
	public String getMessageTemp3() {
		return messageTemp3;
	}
	public void setMessageTemp3(String messageTemp3) {
		this.messageTemp3 = messageTemp3;
	}
	@Override
	public String toString() {
		return "MessageVO [messageNumber=" + messageNumber + ", memberEmail=" + memberEmail + ", messageFromId="
				+ messageFromId + ", messageSendId=" + messageSendId + ", messageContent=" + messageContent
				+ ", messageRegdate=" + messageRegdate + ", messageAlarm=" + messageAlarm + ", messageTemp1="
				+ messageTemp1 + ", messageTemp2=" + messageTemp2 + ", messageTemp3=" + messageTemp3 + "]";
	}
	
    
}
