package com.admin;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class AdminFactory {
	static Configuration configuration = new Configuration().configure("hibernate.cfg.xml");
	static SessionFactory factory = configuration.buildSessionFactory();
	
	public static Session getSession() {
		return factory.openSession();
	}
}
