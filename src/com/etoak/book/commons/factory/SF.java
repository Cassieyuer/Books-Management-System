package com.etoak.book.commons.factory;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SF {
	private static SqlSessionFactory f;

	private SF() {
	}

	static {
		try {
			Reader reader = Resources.getResourceAsReader("config.xml");
			f = new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static SqlSession getSession() {
		return f.openSession();
	}

	public static void main(String[] args) {
		System.out.println(SF.getSession());
	}
}
