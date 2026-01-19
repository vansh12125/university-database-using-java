package com.utilities;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class Test {

	public static void main(String[] args) {
		Configuration configuration=new Configuration();
		configuration.configure("hibernate.cfg.xml");
		SessionFactory factory=configuration.buildSessionFactory();
		Session session=factory.openSession();
		Transaction transaction=session.beginTransaction();
		Course course=new Course("BCOM", 120, 120);
		Course c1=new Course("BBA",120,120);
		Course c2=new Course("BCA",120,120);
		Course c3=new Course("MCA",120,120);
		session.persist(course);
		session.persist(c3);
		session.persist(c2);
		session.persist(c1);
		transaction.commit();
		session.close();

	}

}
