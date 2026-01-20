package com.admin;

import java.io.IOException;

import org.hibernate.Session;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/adminLogin")
public class adminLoginServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		AdminDatabase admin = checkDetail(username, password);
		if (admin != null) {
			HttpSession session = request.getSession(true);
			session.setAttribute("admin", admin);
			response.sendRedirect(request.getContextPath() + "/Pages/AdminPage.jsp");
		} else {
			response.sendRedirect(request.getContextPath() + "/Pages/adminFail.jsp");
		}

	}

	protected AdminDatabase checkDetail(String username, String password) {
		Session session = AdminFactory.getSession();
		String hql = "FROM AdminDatabase WHERE userName = :username AND password = :password";

		AdminDatabase admin = session.createQuery(hql, AdminDatabase.class).setParameter("username", username)
				.setParameter("password", password).uniqueResult();
		session.close();
		return admin;
	}
}
