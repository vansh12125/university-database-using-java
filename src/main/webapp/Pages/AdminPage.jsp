<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.admin.AdminDatabase"%>

<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);

AdminDatabase admin = (AdminDatabase) session.getAttribute("admin");
if (admin == null) {
	response.sendRedirect(request.getContextPath() + "/Pages/adminLogin.jsp");
	return;
}
%>

<!DOCTYPE html>
<html>
<head>
<script>
	window.onpageshow = function(event) {
		if (event.persisted) {
			window.location.reload();
		}
	};
</script>
<title>Admin Dashboard</title>

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

/* Page Background */
body {
	background: #f4f6f9;
}

/* Header */
.header {
	background: linear-gradient(135deg, #141e30, #243b55);
	color: white;
	padding: 22px 30px;
	font-size: 22px;
	font-weight: bold;
	position: relative;
}

/* Logout Button */
.logout-btn {
	position: absolute;
	right: 30px;
	top: 18px;
	background: #e53935;
	color: white;
	padding: 8px 18px;
	border-radius: 6px;
	text-decoration: none;
	font-size: 14px;
	transition: 0.3s;
}

.logout-btn:hover {
	background: #b71c1c;
}

/* Container */
.container {
	padding: 30px;
}

/* Profile Card */
.profile-card {
	background: white;
	border-radius: 14px;
	padding: 25px;
	box-shadow: 0 12px 30px rgba(0, 0, 0, 0.1);
	margin-bottom: 30px;
	animation: fadeIn 0.6s ease;
}

@
keyframes fadeIn {from { opacity:0;
	transform: translateY(15px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
.profile-card h3 {
	color: #243b55;
	margin-bottom: 15px;
}

.profile-card p {
	font-size: 15px;
	margin: 6px 0;
	color: #444;
}

/* Dashboard Grid */
.dashboard {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
	gap: 22px;
}

/* Dashboard Cards */
.card {
	background: white;
	padding: 25px;
	border-radius: 14px;
	box-shadow: 0 12px 30px rgba(0, 0, 0, 0.1);
	transition: 0.3s;
}

.card:hover {
	transform: translateY(-6px);
}

.card h4 {
	color: #243b55;
	margin-bottom: 10px;
}

.card p {
	font-size: 14px;
	color: #555;
}

/* Card Button */
.card a {
	display: inline-block;
	margin-top: 12px;
	text-decoration: none;
	background: #243b55;
	color: white;
	padding: 9px 16px;
	border-radius: 6px;
	font-size: 14px;
	transition: 0.3s;
}

.card a:hover {
	background: #141e30;
}
</style>
</head>

<body>

	<!-- HEADER -->
	<div class="header">
		Admin Dashboard <a href="${pageContext.request.contextPath}/logout"
			class="logout-btn"> Logout </a>
	</div>

	<div class="container">

		<!-- ADMIN PROFILE -->
		<div class="profile-card">
			<h3>Admin Profile</h3>
			<p>
				<strong>Admin ID:</strong>
				<%=admin.getAdminId()%></p>
			<p>
				<strong>Name:</strong>
				<%=admin.getAdminName()%></p>
			<p>
				<strong>Username:</strong>
				<%=admin.getUserName()%></p>
		</div>

		<!-- DASHBOARD -->
		<div class="dashboard">

			<div class="card">
				<h4>Notice Management</h4>
				<p>Create, update and remove notices for students.</p>
				<a href="NoticeManagement.jsp">Manage Notices</a>

			</div>

			<div class="card">
				<h4>Attendance Management</h4>
				<p>Mark and review student attendance records.</p>
				<a href="SelectAttendance.jsp"> Manage
					Attendance </a>

			</div>

			<div class="card">
				<h4>Student Records</h4>
				<p>View all registered student details.</p>
				<a href="#">View Students</a>
			</div>

		</div>

	</div>

</body>
</html>
