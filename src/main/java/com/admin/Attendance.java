package com.admin;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Column;
import java.time.LocalDate;

@Entity
@Table(name = "attendance_record")
public class Attendance {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int attendanceId;

    @Column(nullable = false)
    private int studentRollNo;

    @Column(nullable = false)
    private String course;

    @Column(nullable = false)
    private LocalDate attendanceDate;  

    public int getStudentRollNo() {
		return studentRollNo;
	}

	public void setStudentRollNo(int studentRollNo) {
		this.studentRollNo = studentRollNo;
	}

	public String getCourse() {
		return course;
	}

	public void setCourse(String course) {
		this.course = course;
	}

	public LocalDate getAttendanceDate() {
		return attendanceDate;
	}

	public void setAttendanceDate(LocalDate attendanceDate) {
		this.attendanceDate = attendanceDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getAttendanceId() {
		return attendanceId;
	}

	@Column(nullable = false)
    private String status;

    public Attendance() {
    	
    }

	public Attendance(int studentRollNo, String course, LocalDate attendanceDate, String status) {
		super();
		this.studentRollNo = studentRollNo;
		this.course = course;
		this.attendanceDate = attendanceDate;
		this.status = status;
	}

}
