package com.utilities;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/fetchCourse")
public class FetchCourse extends HttpServlet {
 protected void doGet(HttpServletRequest request,HttpServletResponse response) {
	 System.out.println("Servlet get hit");
	 String course=request.getParameter("course");
	 String date=request.getParameter("date");
	 
	 Session session=StudentRegistrationServlet.factory.openSession();
	 Transaction tx=null;
	 try {
		 tx=session.beginTransaction();
		 String hql="FROM Student s WHERE s.course = :course ";
		 Query<Student> query=session.createQuery(hql,Student.class);
		 query.setParameter("course", course);
		 List<Student> students=query.list();
		 
		 request.setAttribute("students", students);
		 request.getRequestDispatcher("/Pages/showStudent.jsp").forward(request, response);
		 tx.commit();
	 }
	 catch(Exception e) {
		 e.printStackTrace();
	 }
	 finally {
		 session.close();
	 }
 }
}
