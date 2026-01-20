package com.admin;

import jakarta.persistence.*;

@Entity
@Table(name = "admin_info")
public class AdminDatabase {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "admin_id")
	private int adminId;

	@Column(name = "admin_name", nullable = false)
	private String adminName;

	@Column(name = "user_name", nullable = false, unique = true)
	private String userName;

	@Column(name = "password", nullable = false, length = 255)
	private String password;

	// ===== Getters & Setters =====
	public int getAdminId() {
		return adminId;
	}

	public String getAdminName() {
		return adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	// ===== Constructors =====
	public AdminDatabase() {}

	public AdminDatabase(String adminName, String userName, String password) {
		this.adminName = adminName;
		this.userName = userName;
		this.password = password;
	}
}
