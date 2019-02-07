package com.spring.helper.vo.jsonVO.news;

public class ExchangerateVO {
		private Integer	RESULT;				//조회 결과	1 : 성공, 2 : DATA코드 오류, 3 : 인증코드 오류, 4 : 일일제한횟수 마감
		private String CUR_UNIT;			//통화코드	？
		private String CUR_NM;				//국가/통화명	？
		private String TTB;					//전신환(송금) ,받으실때
		private String TTS;					//전신환(송금) ,보내실때
		private String DEAL_BAS_R;			//매매 기준율	？
		private String BKPR;				//장부가격	？
		private String YY_EFEE_R;			//년환가료율	？
		private String TEN_DD_EFEE_R;		//10일환가료율	？
		private String KFTC_DEAL_BAS_R;		//서울외국환중계, 매매기준율	
		private String KFTC_BKPR;			//서울외국환중계, 장부가격
		public Integer getRESULT() {
			return RESULT;
		}
		public void setRESULT(Integer rESULT) {
			RESULT = rESULT;
		}
		public String getCUR_UNIT() {
			return CUR_UNIT;
		}
		public void setCUR_UNIT(String cUR_UNIT) {
			CUR_UNIT = cUR_UNIT;
		}
		public String getCUR_NM() {
			return CUR_NM;
		}
		public void setCUR_NM(String cUR_NM) {
			CUR_NM = cUR_NM;
		}
		public String getTTB() {
			return TTB;
		}
		public void setTTB(String tTB) {
			TTB = tTB;
		}
		public String getTTS() {
			return TTS;
		}
		public void setTTS(String tTS) {
			TTS = tTS;
		}
		public String getDEAL_BAS_R() {
			return DEAL_BAS_R;
		}
		public void setDEAL_BAS_R(String dEAL_BAS_R) {
			DEAL_BAS_R = dEAL_BAS_R;
		}
		public String getBKPR() {
			return BKPR;
		}
		public void setBKPR(String bKPR) {
			BKPR = bKPR;
		}
		public String getYY_EFEE_R() {
			return YY_EFEE_R;
		}
		public void setYY_EFEE_R(String yY_EFEE_R) {
			YY_EFEE_R = yY_EFEE_R;
		}
		public String getTEN_DD_EFEE_R() {
			return TEN_DD_EFEE_R;
		}
		public void setTEN_DD_EFEE_R(String tEN_DD_EFEE_R) {
			TEN_DD_EFEE_R = tEN_DD_EFEE_R;
		}
		public String getKFTC_DEAL_BAS_R() {
			return KFTC_DEAL_BAS_R;
		}
		public void setKFTC_DEAL_BAS_R(String kFTC_DEAL_BAS_R) {
			KFTC_DEAL_BAS_R = kFTC_DEAL_BAS_R;
		}
		public String getKFTC_BKPR() {
			return KFTC_BKPR;
		}
		public void setKFTC_BKPR(String kFTC_BKPR) {
			KFTC_BKPR = kFTC_BKPR;
		}
		@Override
		public String toString() {
			return "ExchangerateVO [RESULT=" + RESULT + ", CUR_UNIT=" + CUR_UNIT + ", CUR_NM=" + CUR_NM + ", TTB=" + TTB
					+ ", TTS=" + TTS + ", DEAL_BAS_R=" + DEAL_BAS_R + ", BKPR=" + BKPR + ", YY_EFEE_R=" + YY_EFEE_R
					+ ", TEN_DD_EFEE_R=" + TEN_DD_EFEE_R + ", KFTC_DEAL_BAS_R=" + KFTC_DEAL_BAS_R + ", KFTC_BKPR="
					+ KFTC_BKPR + "]";
		}
		

}
