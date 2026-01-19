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
	}

	protected boolean checkDetails(int rollNo,String name) {
		Configuration configuration=new Configuration();
		configuration.configure("hibernate.cfg.xml");
		SessionFactory factory=configuration.buildSessionFactory();
		
		
		
		return false;
	}
}
