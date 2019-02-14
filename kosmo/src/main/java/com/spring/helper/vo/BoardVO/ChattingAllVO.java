package com.spring.helper.vo.BoardVO;

import java.sql.Timestamp;

public class ChattingAllVO {
		
		private int chattingAllNumber;
	    private String chattingAllMemberId;
	    private String chattingAllContent;
	    private Timestamp chattingAllRegdate;
	    private String chattingAllContry;
	    private int chattingAllTemp1;
	    private String chattingAllTemp2;
	    private String chattingAllTemp3;
		
	    public int getChattingAllNumber() {
			return chattingAllNumber;
		}
		public void setChattingAllNumber(int chattingAllNumber) {
			this.chattingAllNumber = chattingAllNumber;
		}
		public String getchattingAllMemberId() {
			return chattingAllMemberId;
		}
		public void setchattingAllMemberId(String chattingAllMemberId) {
			this.chattingAllMemberId = chattingAllMemberId;
		}
		public String getChattingAllContent() {
			return chattingAllContent;
		}
		public void setChattingAllContent(String chattingAllContent) {
			this.chattingAllContent = chattingAllContent;
		}
		public Timestamp getChattingAllRegdate() {
			return chattingAllRegdate;
		}
		public void setChattingAllRegdate(Timestamp chattingAllRegdate) {
			this.chattingAllRegdate = chattingAllRegdate;
		}
		public String getChattingAllContry() {
			return chattingAllContry;
		}
		public void setChattingAllContry(String chattingAllContry) {
			this.chattingAllContry = chattingAllContry;
		}
		public int getChattingAllTemp1() {
			return chattingAllTemp1;
		}
		public void setChattingAllTemp1(int chattingAllTemp1) {
			this.chattingAllTemp1 = chattingAllTemp1;
		}
		public String getChattingAllTemp2() {
			return chattingAllTemp2;
		}
		public void setChattingAllTemp2(String chattingAllTemp2) {
			this.chattingAllTemp2 = chattingAllTemp2;
		}
		public String getChattingAllTemp3() {
			return chattingAllTemp3;
		}
		public void setChattingAllTemp3(String chattingAllTemp3) {
			this.chattingAllTemp3 = chattingAllTemp3;
		}
		@Override
		public String toString() {
			return "ChattingAll [chattingAllNumber=" + chattingAllNumber + ", chattingAllMemberId=" + chattingAllMemberId
					+ ", chattingAllContent=" + chattingAllContent + ", chattingAllRegdate=" + chattingAllRegdate
					+ ", chattingAllContry=" + chattingAllContry + ", chattingAllTemp1=" + chattingAllTemp1
					+ ", chattingAllTemp2=" + chattingAllTemp2 + ", chattingAllTemp3=" + chattingAllTemp3 + "]";
		}
	    
	}
