package com.utilities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Course {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int courseId;
	
	public int getCourseId() {
		return courseId;
	}
	public String getCourseName() {
		return courseName;
	}
	
	public Course(String courseName, int totalSeats, int availableSeats) {
		super();
		this.courseName = courseName;
		this.totalSeats = totalSeats;
		this.availableSeats = availableSeats;
	}
	
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public int getTotalSeats() {
		return totalSeats;
	}
	public void setTotalSeats(int totalSeats) {
		this.totalSeats = totalSeats;
	}
	public int getAvailableSeats() {
		return availableSeats;
	}
	public void setAvailableSeats(int availableSeats) {
		this.availableSeats = availableSeats;
	}
	private String courseName;
	private int totalSeats;
	private int availableSeats;
}
