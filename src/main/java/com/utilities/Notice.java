package com.utilities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "notices")
public class Notice {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int noticeId;
	private String noticeTitle;
	private String noticeDescription;
	private String courseString;
	
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeDescription() {
		return noticeDescription;
	}
	public void setNoticeDescription(String noticeDescription) {
		this.noticeDescription = noticeDescription;
	}
	public String getCourseString() {
		return courseString;
	}
	public void setCourseString(String courseString) {
		this.courseString = courseString;
	}
	public int getNoticeId() {
		return noticeId;
	}
	
	public Notice(String noticeTitle, String noticeDescription, String courseString) {
		super();
		this.noticeTitle = noticeTitle;
		this.noticeDescription = noticeDescription;
		this.courseString = courseString;
	}
	
	public Notice() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
