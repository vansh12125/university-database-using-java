package com.admin;

import java.io.IOException;
import java.util.List;

import com.utilities.Student;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/loadAttendance")
public class LoadAttendanceServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        String course = request.getParameter("course");
        String date = request.getParameter("date");

        StudentManager sm = new StudentManager();
        List<Student> students = sm.getStudentsByCourse(course);

        
        if (students == null || students.isEmpty()) {

            request.setAttribute("error",
                "No students found for course: " + course);

            request.getRequestDispatcher("/Pages/SelectAttendance.jsp")
                   .forward(request, response);
            System.out.println("No student found!");
            return;
        }
        else {
        HttpSession session = request.getSession(true);
        session.setAttribute("students", students);
        session.setAttribute("attendanceDate", date);
        session.setAttribute("course", course);
        request.getRequestDispatcher("/Pages/StudentAttendance.jsp")
               .forward(request, response);
        }
    }
}
