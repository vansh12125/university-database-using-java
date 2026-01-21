package com.admin;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import com.utilities.Student;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/saveAttendance")
public class AttendanceServlet extends HttpServlet {

	private AttendanceManager manager = new AttendanceManager();

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

		HttpSession session = request.getSession(false);

		List<Student> students = (List<Student>) session.getAttribute("students");

		String course = (String) session.getAttribute("course");
		LocalDate date = LocalDate.parse((String) session.getAttribute("attendanceDate"));

		for (Student s : students) {

			String value = request.getParameter("attendance_" + s.getRollNo());

			if (value != null) {
				Attendance a = new Attendance(s.getRollNo(), course, date, value.equals("P") ? "Present" : "Absent");
				manager.saveAttendance(a);
			}
		}

		session.removeAttribute("students");
		session.removeAttribute("attendanceDate");
		session.removeAttribute("course");

		response.sendRedirect(request.getContextPath() + "/Pages/AttendanceSuccess.jsp");
	}
}
