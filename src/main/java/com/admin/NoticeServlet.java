package com.admin;

import java.io.IOException;
import java.util.List;

import com.utilities.Notice;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/notice")
public class NoticeServlet extends HttpServlet {

	private NoticeManager manager = new NoticeManager();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");

		if ("delete".equals(action)) {
			int id = Integer.parseInt(request.getParameter("id"));
			manager.deleteNotice(id);
			response.sendRedirect("Pages/NoticeManagement.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");

		if ("add".equals(action)) {
			manager.addNotice(
					request.getParameter("title"),
					request.getParameter("description"),
					request.getParameter("course")
			);
			response.sendRedirect("Pages/NoticeManagement.jsp");
		}

		if ("update".equals(action)) {
			manager.updateNotice(
					Integer.parseInt(request.getParameter("id")),
					request.getParameter("title"),
					request.getParameter("description")
			);
			response.sendRedirect("Pages/NoticeManagement.jsp");
		}
	}
}
