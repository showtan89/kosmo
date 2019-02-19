package com.spring.helper.vo.jsonVO.weather;

public class EarthQuakeVO {

	
    private int eqnum; // number;// primary key,
    private int fcTp; // number, --통보종류
    private String img; // varchar2(200), --이미지
    private double lat; //number, --위도
    private double lon; //number, --경도
    private String loc; // varchar2(200), --위치
    private String mt; // varchar2(20), -- 크기
    private String rem; //varchar2(200), --분석내용
    private String tmEqk; // number, --발생시간
    private String tmFc; // number, -- 발표시간
    private int tmSeq; // number --월별순번
	
    public int getEqnum() {
		return eqnum;
	}
	public void setEqnum(int eqnum) {
		this.eqnum = eqnum;
	}
	public int getFcTp() {
		return fcTp;
	}
	public void setFcTp(int fcTp) {
		this.fcTp = fcTp;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public double getLat() {
		return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	public double getLon() {
		return lon;
	}
	public void setLon(double lon) {
		this.lon = lon;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	public String getMt() {
		return mt;
	}
	public void setMt(String mt) {
		this.mt = mt;
	}
	public String getRem() {
		return rem;
	}
	public void setRem(String rem) {
		this.rem = rem;
	}
	public String getTmEqk() {
		return tmEqk;
	}
	public void setTmEqk(String tmEqk) {
		this.tmEqk = tmEqk;
	}
	public String getTmFc() {
		return tmFc;
	}
	public void setTmFc(String tmFc) {
		this.tmFc = tmFc;
	}
	public int getTmSeq() {
		return tmSeq;
	}
	public void setTmSeq(int tmSeq) {
		this.tmSeq = tmSeq;
	}
	@Override
	public String toString() {
		return "EarthQuakeVO [eqnum=" + eqnum + ", fcTp=" + fcTp + ", img=" + img + ", lat=" + lat + ", lon=" + lon
				+ ", loc=" + loc + ", mt=" + mt + ", rem=" + rem + ", tmEqk=" + tmEqk + ", tmFc=" + tmFc + ", tmSeq="
				+ tmSeq + "]";
	}
	public EarthQuakeVO(int eqnum, int fcTp, String img, double lat, double lon, String loc, String mt, String rem,
			String tmEqk, String tmFc, int tmSeq) {
		super();
		this.eqnum = eqnum;
		this.fcTp = fcTp;
		this.img = img;
		this.lat = lat;
		this.lon = lon;
		this.loc = loc;
		this.mt = mt;
		this.rem = rem;
		this.tmEqk = tmEqk;
		this.tmFc = tmFc;
		this.tmSeq = tmSeq;
	}
    
    public EarthQuakeVO() {
    	
    }
    
}
