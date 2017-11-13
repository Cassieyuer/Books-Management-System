package com.etoak.book.books.action;

import java.util.List;

import com.etoak.book.books.po.scott.Category;
import com.etoak.book.books.service.BookService;
import com.opensymphony.xwork2.ActionSupport;

public class CategoryAction extends ActionSupport {

	private String name;

	public void setName(String name) {
		this.name = name;
	}

	BookService bs = new BookService();

	public String addca() {
		Category ca = new Category();
		ca.setName(name);
		bs.registerCa(ca);
		return "addca_success";
	}

	private List<Category> data;

	public List<Category> getData() {
		return data;
	}

	public String queryAllCas() {
		data = bs.queryAllCas();
		return "queryAllCas_success";
	}
}
