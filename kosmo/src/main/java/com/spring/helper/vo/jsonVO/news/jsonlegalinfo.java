package com.spring.helper.vo.jsonVO.news;

import java.util.Arrays;

public class jsonlegalinfo {
	private String a;
	private String[] b;
	private String[] c;
	public String getA() {
		return a;
	}
	public void setA(String a) {
		this.a = a;
	}
	public String[] getB() {
		return b;
	}
	public void setB(String[] b) {
		this.b =b;
	}
	public String[] getC() {
		return c;
	}
	public void setC(String[] c) {
		this.c = c;
	}
	
	@Override
	public String toString() {
		return "jsonlegalinfo [a=" + a + ", ff=" + Arrays.toString(b) + ", c=" + Arrays.toString(c) + "]";
	}
	
	
	
	

}
