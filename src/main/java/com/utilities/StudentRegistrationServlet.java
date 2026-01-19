package com.utilities;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import com.utilities.Student;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/register")
public class StudentRegistrationServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("name");
		String course = request.getParameter("course");
		String gender = request.getParameter("gender");
		String city = request.getParameter("city");
		int age = Integer.parseInt(request.getParameter("age"));
		Student student = new Student(name, course, city, age, gender);
		int result = registerUser(student);
		if (result > 0) {
			request.setAttribute("status", "success");
			request.setAttribute("rollNo", result);
		} else if (result == -1) {
			request.setAttribute("status", "noSeats");
		} else {
			request.setAttribute("status", "error");
		}

		RequestDispatcher rd = request.getRequestDispatcher("/Pages/RegistrationResponse.jsp");

		rd.forward(request, response);
	}

	private static SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();

	private int registerUser(Student student) {

		Session session = null;
		Transaction tx = null;

		try {
			session = factory.openSession();
			tx = session.beginTransaction();

			Course course = session.createQuery("from Course where courseName = :name", Course.class)
					.setParameter("name", student.getCourse()).uniqueResult();

			if (course.getAvailableSeats() <= 0) {
				return -1;
			}

			session.persist(student);
			course.setAvailableSeats(course.getAvailableSeats() - 1);
			session.merge(course);
			tx.commit();
			return student.getRollNo();
		} catch (Exception e) {
			return -2;
		} finally {
			if (session != null)
				session.close();
		}
	}

}
