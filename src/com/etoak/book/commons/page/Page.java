package com.etoak.book.commons.page;

import java.util.List;

public class Page<T> {
	private int currentPage;
	private int total;
	private int pageSize=3;
	private int pageCount;
	
	private int next;
	private int pre;
	private int start;
	private List<T> rows;
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getPageCount() {
		return (total+pageSize-1)/pageSize;
	}

	public int getNext() {
		if(currentPage<getPageCount())
		return currentPage+1;
		return getPageCount();
	}
	
	public int getPre() {
		if(currentPage>1)
		return currentPage-1;
		return 1;
	}
	
	public int getStart() {
		return (currentPage-1)*pageSize;
	}

	public List<T> getRows() {
		return rows;
	}
	public void setRows(List<T> rows) {
		this.rows = rows;
	}
	
	
}
