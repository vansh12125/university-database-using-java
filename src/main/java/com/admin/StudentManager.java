package com.admin;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

import com.utilities.Student;
import com.utilities.StudentFactory;

public class StudentManager {
	public List<Student> getStudentsByCourse(String course) {

		Session session = null;
		List<Student> students = null;

		try {
			session = AdminFactory.getSession();

			String hql = "FROM Student WHERE course = :course";
			Query<Student> query = session.createQuery(hql, Student.class);
			query.setParameter("course", course);

			students = query.list();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null) {
				session.close();
			}
		}

		return students;
	}
	
	public static List<Attendance> getStudentAttendanceByRoll(int rollNo) {

		Session session = null;
		List<Attendance> attendances = null;

		try {
			session = StudentFactory.getSession();
			String hql = "FROM Attendance WHERE studentRollNo = :roll";
			Query<Attendance> query = session.createQuery(hql, Attendance.class);
			query.setParameter("roll", rollNo);

			attendances = query.list();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null) {
				session.close();
			}
		}

		return attendances;
	}
}
