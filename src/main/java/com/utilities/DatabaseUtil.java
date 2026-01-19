package com.utilities;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class DatabaseUtil {
	public static SessionFactory sessionFactory;
	static {
		if(sessionFactory==null) {
			sessionFactory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Student.class).buildSessionFactory();
			
		}
		
	}
	public static SessionFactory getSessionFactory() {
		
		return sessionFactory;
	}
	public static Student setStudent(SessionFactory database,Student obj) {
		Session session=database.openSession();
		
			Transaction tx=session.beginTransaction();
		session.persist(obj);
		tx.commit();
		
		return obj;
	}
}
