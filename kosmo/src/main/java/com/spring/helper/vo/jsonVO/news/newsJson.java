package com.spring.helper.vo.jsonVO.news;

public class newsJson {

	private int totalCount;
	private int pageTotal;
	private String searchType;
	
	private jsonBoardGroup jsonBoardGroup;
	private jsonBoardList jsonBoardList;
	private koccDataList koccDataList;
	private koccList koccList;
	
	public newsJson() {}
	
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getPageTotal() {
		return pageTotal;
	}
	public void setPageTotal(int pageTotal) {
		this.pageTotal = pageTotal;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public jsonBoardGroup getJsonBoardGroup() {
		return jsonBoardGroup;
	}
	public void setJsonBoardGroup(jsonBoardGroup jsonBoardGroup) {
		this.jsonBoardGroup = jsonBoardGroup;
	}
	public jsonBoardList getJsonBoardList() {
		return jsonBoardList;
	}
	public void setJsonBoardList(jsonBoardList jsonBoardList) {
		this.jsonBoardList = jsonBoardList;
	}
	public koccDataList getKoccDataList() {
		return koccDataList;
	}
	public void setKoccDataList(koccDataList koccDataList) {
		this.koccDataList = koccDataList;
	}
	public koccList getKoccList() {
		return koccList;
	}
	public void setKoccList(koccList koccList) {
		this.koccList = koccList;
	}
	@Override
	public String toString() {
		return "newsJson [totalCount=" + totalCount + ", pageTotal=" + pageTotal + ", searchType=" + searchType
				+ ", jsonBoardGroup=" + jsonBoardGroup + ", jsonBoardList=" + jsonBoardList + ", koccDataList="
				+ koccDataList + ", koccList=" + koccList + "]";
	}
	
	public newsJson(int totalCount, int pageTotal, String searchType,
			com.spring.helper.vo.jsonVO.news.jsonBoardGroup jsonBoardGroup,
			com.spring.helper.vo.jsonVO.news.jsonBoardList jsonBoardList,
			com.spring.helper.vo.jsonVO.news.koccDataList koccDataList,
			com.spring.helper.vo.jsonVO.news.koccList koccList) {
		super();
		this.totalCount = totalCount;
		this.pageTotal = pageTotal;
		this.searchType = searchType;
		this.jsonBoardGroup = jsonBoardGroup;
		this.jsonBoardList = jsonBoardList;
		this.koccDataList = koccDataList;
		this.koccList = koccList;
	}
	
	
}
