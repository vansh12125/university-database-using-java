package com.utilities;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;

@Entity
public class Student {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int rollNo; 
	
	private String name;
	
	public int getRollNo() {
		return rollNo;
	}
	
	@Override
	public String toString() {
		return "Student [rollNo=" + rollNo + ", name=" + name + ", course=" + course + ", city=" + city + "]";
	}

	private String course;
	private String city;
	
	public Student() {
		
	}
	
	public Student(String name, String course, String city) {
		super();
		this.name = name;
		this.course = course;
		this.city = city;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCourse() {
		return course;
	}
	public void setCourse(String course) {
		this.course = course;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
}
