package com.utilities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "notices")
public class Notice {
	@Override
	public String toString() {
		return "Notice [noticeId=" + noticeId + ", noticeTitle=" + noticeTitle + ", noticeDescription="
				+ noticeDescription + ", course=" + course + "]";
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int noticeId;
	private String noticeTitle;
	private String noticeDescription;
	private String course;
	
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
	public String getCourse() {
		return course;
	}
	public void setCourse(String courseString) {
		this.course = courseString;
	}
	public int getNoticeId() {
		return noticeId;
	}
	
	public Notice(String noticeTitle, String noticeDescription, String course) {
		super();
		this.noticeTitle = noticeTitle;
		this.noticeDescription = noticeDescription;
		this.course = course;
	}
	
	public Notice() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
