package com.etoak.book.books.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.etoak.book.books.dao.scott.BookMapper;
import com.etoak.book.books.dao.scott.BookpicMapper;
import com.etoak.book.books.dao.scott.CategoryMapper;
import com.etoak.book.books.po.scott.Book;
import com.etoak.book.books.po.scott.BookExample;
import com.etoak.book.books.po.scott.BookExample.Criteria;
import com.etoak.book.books.po.scott.Bookpic;
import com.etoak.book.books.po.scott.BookpicExample;
import com.etoak.book.books.po.scott.Category;
import com.etoak.book.commons.factory.SF;

public class BookService {
	SqlSession session = null;

	public void registerCa(Category ca) {
		try {
			session = SF.getSession();
			CategoryMapper dao = session.getMapper(CategoryMapper.class);
			dao.insert(ca);
			session.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			if(session!=null)
				session.rollback();
		}finally{
			if(session!=null)
				session.close();
		}
	}

	public String registerBook(Book book) {
		try {
			session = SF.getSession();
			BookMapper dao = session.getMapper(BookMapper.class);
			dao.insert(book);
			session.commit();
			return book.getId();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			if(session!=null)
				session.rollback();
			return null;
		}finally{
			if(session!=null)
				session.close();
		}
	}

	public void registerPic(Bookpic bp) {
		try {
			session = SF.getSession();
			BookpicMapper dao = session.getMapper(BookpicMapper.class);
			dao.insert(bp);
			session.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			if(session!=null)
				session.rollback();
		}finally{
			if(session!=null)
				session.close();
		}
	}
	
	public List<Category> queryAllCas() {
		try {
			session = SF.getSession();
			CategoryMapper dao = session.getMapper(CategoryMapper.class);
			List<Category> data = dao.selectByExample(null);
			session.commit();
			return data;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			if(session!=null)
				session.rollback();
			return null;
		}finally{
			if(session!=null)
				session.close();
		}
	}
	
	public int countBook(String name, String caid){
		try {
			session = SF.getSession();
			BookMapper dao = session.getMapper(BookMapper.class);
			BookExample example = new BookExample();
			Criteria cri = example.createCriteria();
			if(name!=null){
				cri.andNAMELike(name);
			}
			if(caid!=null){
				cri.andCATEGORYIDLike(caid);
			}
			int count = dao.countByExample(example);
			session.commit();
			return count;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			if(session!=null)
				session.rollback();
			return 0;
		}finally{
			if(session!=null)
				session.close();
		}
	}
	
	public List<Book> querySome(String name, String caid, int start, int pageSize){
		try {
			session = SF.getSession();
			BookMapper dao = session.getMapper(BookMapper.class);
			Map<String, Object> map = new HashMap<String, Object>();
			if(name!=null){
				map.put("name", name);
			}
			if(caid!=null){
				map.put("caid", caid);
			}
			map.put("start", start);
			map.put("max", start+pageSize);
			List<Book> data = dao.selectSome(map);
			session.commit();
			return data;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			if(session!=null)
				session.rollback();
			return null;
		}finally{
			if(session!=null)
				session.close();
		}
	}

	public Category queryCaById(String categoryid) {
		// TODO Auto-generated method stub
		try {
			session = SF.getSession();
			CategoryMapper dao = session.getMapper(CategoryMapper.class);
			Category ca = dao.selectByPrimaryKey(categoryid);
			session.commit();
			return ca;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			if(session!=null)
				session.rollback();
			return null;
		}finally{
			if(session!=null)
				session.close();
		}
	}

	public Book queryBookById(String id) {
		// TODO Auto-generated method stub
		try {
			session = SF.getSession();
			BookMapper dao = session.getMapper(BookMapper.class);
			Book book = dao.selectByPrimaryKey(id);
			session.commit();
			return book;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			if(session!=null)
				session.rollback();
			return null;
		}finally{
			if(session!=null)
				session.close();
		}
	}

	public List<Bookpic> queryBpsByBookid(String id) {
		// TODO Auto-generated method stub
		try {
			session = SF.getSession();
			BookpicMapper dao = session.getMapper(BookpicMapper.class);
			BookpicExample example = new BookpicExample();
			com.etoak.book.books.po.scott.BookpicExample.Criteria cri = example.createCriteria();
			cri.andBOOKIDEqualTo(id);
			List<Bookpic> data = dao.selectByExample(example);
			session.commit();
			return data;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			if(session!=null)
				session.rollback();
			return null;
		}finally{
			if(session!=null)
				session.close();
		}
	}

	public Bookpic queryBpById(String id) {
		// TODO Auto-generated method stub
		try {
			session = SF.getSession();
			BookpicMapper dao = session.getMapper(BookpicMapper.class);
			Bookpic bookpic = dao.selectByPrimaryKey(id);
			session.commit();
			return bookpic;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			if(session!=null)
				session.rollback();
			return null;
		}finally{
			if(session!=null)
				session.close();
		}
	}
	
	public void deleteBookById(String id){
		try {
			session = SF.getSession();
			BookMapper dao = session.getMapper(BookMapper.class);
			dao.deleteByPrimaryKey(id);
			session.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			if(session!=null)
				session.rollback();
		}finally{
			if(session!=null)
				session.close();
		}
	}

	public void deletePicById(String id) {
		// TODO Auto-generated method stub
		try {
			session = SF.getSession();
			BookpicMapper dao = session.getMapper(BookpicMapper.class);
			dao.deleteByPrimaryKey(id);
			session.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			if(session!=null)
				session.rollback();
		}finally{
			if(session!=null)
				session.close();
		}
	}

//	public void setfmByid(String id, String bookid) {
//		// TODO Auto-generated method stub
//		try {
//			session = SF.getSession();
//			BookpicMapper dao = session.getMapper(BookpicMapper.class);
//			dao.deleteByPrimaryKey(id);
//			session.commit();
//		} catch (Exception e) {
//			// TODO: handle exception
//			e.printStackTrace();
//			if(session!=null)
//				session.rollback();
//		}finally{
//			if(session!=null)
//				session.close();
//		}
//	}
//
//	public List<Book> queryByTJS(String name, String caid) {
//		// TODO Auto-generated method stub
//		try {
//			session = SF.getSession();
//			BookMapper dao = session.getMapper(BookMapper.class);
//			Map<String, Object> map = new HashMap<String, Object>();
//			if(name!=null){
//				map.put("name", name);
//			}
//			if(caid!=null){
//				map.put("caid", caid);
//			}
//			List<Book> data = dao.selectSome(map);
//			session.commit();
//			return data;
//		} catch (Exception e) {
//			// TODO: handle exception
//			e.printStackTrace();
//			if(session!=null)
//				session.rollback();
//			return null;
//		}finally{
//			if(session!=null)
//				session.close();
//		}
//	}
}
