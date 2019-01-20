package com.spring.helper.vo.BoardVO;

//페이지 판단용 페이지 정보VO
public class PageVO {
	
	private int pageSize = 15; 		// 한 페이지 당 출력 할 글 갯수
	private	int pageBlock = 10; 		// 한 블럭 당 페이지 갯수

	private	int totalCount = 0 ; 			// 글 갯수
	private	int startNumber = 0; 			// 현재 페이지 시작 글 번호
	private	int endNumber = 0; 			// 현재 페이지 마지막 글 번호
	private int articleNumber = 0;	 		// DB와 별도의 화면 출력 용 글 번호

	private	String pageNum = null;	// 페이지 번호
	private	int currentPage = 0;	// 현재 페이지

	private	int pageCount = 0;		// 페이지 갯수
	private	int startPage = 0;		// 시작 페이지
	private	int endPage = 0; 		// 마지막 페이지
	
	@Override
	public String toString() {
		return "PageVO [pageSize=" + pageSize + ", pageBlock=" + pageBlock + ", totalCount=" + totalCount
				+ ", startNumber=" + startNumber + ", endNumber=" + endNumber + ", articleNumber=" + articleNumber
				+ ", pageNum=" + pageNum + ", currentPage=" + currentPage + ", pageCount=" + pageCount + ", startPage="
				+ startPage + ", endPage=" + endPage + "]";
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getPageBlock() {
		return pageBlock;
	}
	public void setPageBlock(int pageBlock) {
		this.pageBlock = pageBlock;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getStartNumber() {
		return startNumber;
	}
	public void setStartNumber(int startNumber) {
		this.startNumber = startNumber;
	}
	public int getEndNumber() {
		return endNumber;
	}
	public void setEndNumber(int endNumber) {
		this.endNumber = endNumber;
	}
	public int getArticleNumber() {
		return articleNumber;
	}
	public void setArticleNumber(int articleNumber) {
		this.articleNumber = articleNumber;
	}
	public String getPageNum() {
		return pageNum;
	}
	public void setPageNum(String pageNum) {
		this.pageNum = pageNum;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
}
