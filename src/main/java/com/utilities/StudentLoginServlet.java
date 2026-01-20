package com.utilities;

import org.hibernate.cfg.Configuration;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import org.hibernate.*;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/studentLogin")
public class StudentLoginServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		int rollNo = Integer.parseInt(request.getParameter("rollNo"));
		String name = request.getParameter("name");
		System.out.println(rollNo + " " + name);
		Student student = checkDetails(rollNo, name);
		HttpSession session = request.getSession(true);
		session.setAttribute("student", student);
		response.sendRedirect(request.getContextPath() + "/Pages/StudentProfile.jsp");

	}

	protected Student checkDetails(int rollNo, String name) {
		Configuration configuration = new Configuration().configure("hibernate.cfg.xml");
		SessionFactory factory = configuration.buildSessionFactory();
		Session session = factory.openSession();
		Student s1 = session.find(Student.class, rollNo);
		if (s1 != null && rollNo == s1.getRollNo()) {
			if (name.equalsIgnoreCase(s1.getName())) {
				System.out.println("Login success");
				return s1;
			}
		}
		System.out.println("No user found!");
		return null;
	}
}
