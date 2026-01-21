package com.utilities;

import java.util.List;
import java.io.IOException;

import org.hibernate.Session;

import com.admin.Attendance;
import com.admin.StudentManager;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/view-attendance")
public class LoadStudentAttendenceServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		HttpSession httpSession = request.getSession(false);
		Student student = (Student) httpSession.getAttribute("student");
		System.out.println(student);

		if (student == null) {
			response.sendRedirect("Pages/student_login.jsp");
			return;
		}

		List<Attendance> attendance = StudentManager.getStudentAttendanceByRoll(student.getRollNo());
		System.out.println(attendance.toString());
		request.setAttribute("addentance", attendance);
		request.getRequestDispatcher("Pages/view_attendance.jsp").forward(request, response);
	}
}
