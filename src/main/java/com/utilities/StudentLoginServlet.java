package com.utilities;


import org.hibernate.cfg.Configuration;
import org.hibernate.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/studentLogin")
public class StudentLoginServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) {
		int rollNo = Integer.parseInt(request.getParameter("rollNo"));
		String name = request.getParameter("name");
		System.out.println(rollNo + " " + name);
		if(checkDetails(rollNo, name)) {
			System.out.println("Login success");
		}
		else {
			System.out.println("No user exist");
		}
	}

	protected boolean checkDetails(int rollNo,String name) {
		Configuration configuration=new Configuration().configure("hibernate.cfg.xml");
		SessionFactory factory=configuration.buildSessionFactory();
		Session session=factory.openSession();
		Student s1=session.find(Student.class, rollNo);
		if(s1!=null && rollNo==s1.getRollNo()) {
			if(name.equalsIgnoreCase(s1.getName())) {
				return true;
			}
		}

		return false;
	}
}
