package com.utilities;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class StudentEnroll {
	public static void main(String []a) {
 Student s1=new Student("Ashish","Bca","Lucknow");
  SessionFactory database=new DatabaseUtil().getSessionFactory();
 
  Student save=DatabaseUtil.setStudent(database, s1);
  System.out.println(save.toString());
 
}
}