package com.etoak.book.books.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.apache.struts2.ServletActionContext;

import com.etoak.book.books.po.scott.Book;
import com.etoak.book.books.po.scott.Bookpic;
import com.etoak.book.books.po.scott.Category;
import com.etoak.book.books.service.BookService;
import com.etoak.book.commons.page.Page;
import com.opensymphony.xwork2.ActionSupport;

public class BookAction extends ActionSupport {
	
	private String flag;
	
	public String getFlag() {
		return flag;
	}
	
	private String pid;

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String deletePic(){
		bs.deletePicById(pid);
		flag="success";
		return "deletePic_success";
	}
	
	
	
	private String queryid;
	
	public void setQueryid(String queryid) {
		this.queryid = queryid;
	}
	
	private Book b;
	private List<Bookpic> bps;

	public Book getB() {
		return b;
	}

	public List<Bookpic> getBps() {
		return bps;
	}

	public String queryBookInfo(){
		b = bs.queryBookById(queryid);
		Category c = bs.queryCaById(b.getCategoryid());
		b.setCategory(c);
		bps = bs.queryBpsByBookid(queryid);
		return "queryBookInfo_success";
	}
	
	
	
	
	private String bid;
	
	public void setBid(String bid) {
		this.bid = bid;
	}

	public String delbook(){
		List<Bookpic> bps = bs.queryBpsByBookid(bid);
		for(Bookpic bp:bps){
			String bpid = bp.getId();
			bs.deletePicById(bpid);
		}
		bs.deleteBookById(bid);
		return "delbook_success";
	}
	
	
	

	private Page<Book> page;

	public Page<Book> getPage() {
		return page;
	}
	
	private int currentPage;
	private int pageSize;
	private String name;
	private String caid;
	

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setCaid(String caid) {
		this.caid = caid;
	}

	public String querySome() {
		page = new Page<Book>();
		page.setCurrentPage(currentPage);
		page.setPageSize(pageSize);
		if(name.equals("")){name=null;}
		if(caid.equals("")||caid.equals("-1")){caid=null;}
		int total = bs.countBook(name, caid);
		page.setTotal(total);
		List<Book> rows = bs.querySome(name, caid, page.getStart(), page.getPageSize());
		for(Book b:rows){
			Category category = bs.queryCaById(b.getCategoryid());
			b.setCategory(category);
		}
		page.setRows(rows);
		return "querySome_success";
	}
	
	
	
	

	private Book book;

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	private File[] pic;
	private String[] picFileName;
	private String[] picContentType;

	private int fm;

	public void setPic(File[] pic) {
		this.pic = pic;
	}

	public void setPicFileName(String[] picFileName) {
		this.picFileName = picFileName;
	}

	public void setPicContentType(String[] picContentType) {
		this.picContentType = picContentType;
	}

	public void setFm(int fm) {
		this.fm = fm;
	}

	BookService bs = new BookService();

	public String addbook() {
		// System.out.println(book);
		// System.out.println(pic[0]);
		// System.out.println(picFileName);
		// System.out.println(picContentType);
		String id = bs.registerBook(book);
		for (int i = 0; i < pic.length; i++) {
			File f = pic[i];
			String showname = picFileName[i];
			String ext = showname.substring(showname.lastIndexOf("."));
			String newName = UUID.randomUUID().toString().replaceAll("-", "")
					+ ext;
			try {
				InputStream is = new FileInputStream(pic[i]);
				ServletContext application = ServletActionContext
						.getServletContext();
				String path = application.getRealPath("/myfiles/" + newName);
				OutputStream os = new FileOutputStream(new File(path));
				int len = 0;
				byte[] data = new byte[1024 << 3];
				while ((len = is.read(data)) != -1) {
					os.write(data, 0, len);
				}
				is.close();
				os.close();

				Bookpic bp = new Bookpic();
				bp.setBookid(id);
				if (fm == i) {
					bp.setFm("1");
				} else {
					bp.setFm("0");
				}
				bp.setSavepath("/myfiles/" + newName);
				bp.setShowname(showname);
				bs.registerPic(bp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "addbook_success";
	}
}
