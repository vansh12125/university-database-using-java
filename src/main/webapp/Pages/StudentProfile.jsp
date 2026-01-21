<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.utilities.Student,com.utilities.Notice"%>
<%@ page import="com.admin.NoticeManager,java.util.List"%>

<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);

HttpSession sessionObj = request.getSession(false);
Student student = null;
boolean loggedIn = true;
if (sessionObj == null || (student = (Student) sessionObj.getAttribute("student")) == null) {
	loggedIn = false;
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
<script>
	window.onpageshow = function(event) {
		if (event.persisted) {
			window.location.reload();
		}
	};
</script>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Student Dashboard</title>
<!-- Bootstrap CSS for modern, responsive UI -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome for icons -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
	rel="stylesheet">
<!-- Custom CSS for additional styling -->
<style>
body {
	background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	min-height: 100vh;
}

.dashboard-container {
	padding: 2rem 0;
}

.profile-card {
	background: white;
	border-radius: 15px;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
	padding: 2rem;
	margin-bottom: 2rem;
}

.profile-header {
	text-align: center;
	margin-bottom: 2rem;
}

.profile-avatar {
	width: 120px;
	height: 120px;
	border-radius: 50%;
	background: #667eea;
	display: flex;
	align-items: center;
	justify-content: center;
	color: white;
	font-size: 3rem;
	margin: 0 auto 1rem;
}

.dashboard-card {
	background: white;
	border-radius: 15px;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
	padding: 1.5rem;
	margin-bottom: 1.5rem;
	transition: transform 0.2s;
}

.dashboard-card:hover {
	transform: translateY(-5px);
}

.stat-card {
	text-align: center;
}

.stat-icon {
	font-size: 2rem;
	color: #667eea;
	margin-bottom: 0.5rem;
}

.stat-value {
	font-size: 2rem;
	font-weight: bold;
	color: #333;
}

.stat-label {
	color: #666;
}

.error-card {
	background: #f8d7da;
	color: #721c24;
	border: 1px solid #f5c6cb;
	border-radius: 10px;
	padding: 1rem;
	text-align: center;
}

.sidebar {
	background: white;
	border-radius: 15px;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
	padding: 1.5rem;
	margin-bottom: 1.5rem;
}

.sidebar ul {
	list-style: none;
	padding: 0;
}

.sidebar li {
	margin-bottom: 0.5rem;
}

.sidebar a {
	text-decoration: none;
	color: #333;
	display: block;
	padding: 0.5rem;
	border-radius: 5px;
	transition: background 0.2s;
}

.sidebar a:hover {
	background: #f8f9fa;
}

.student-card {
    padding: 0;
    overflow: hidden;
}

.card-header-custom {
    background: linear-gradient(135deg, #667eea, #764ba2);
    color: white;
    padding: 1rem 1.5rem;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.card-header-custom h5 {
    margin: 0;
    font-weight: 600;
}

.student-details {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
    gap: 1rem;
    padding: 1.5rem;
}

.detail {
    display: flex;
    align-items: center;
    gap: 1rem;
    background: #f9f9fb;
    border-radius: 10px;
    padding: 1rem;
    transition: transform 0.2s, box-shadow 0.2s;
}

.detail:hover {
    transform: translateY(-3px);
    box-shadow: 0 8px 18px rgba(0,0,0,0.08);
}

.detail i {
    font-size: 1.8rem;
    color: #667eea;
}

.detail span {
    font-size: 0.85rem;
    color: #777;
}

.detail strong {
    display: block;
    font-size: 1.05rem;
    color: #333;
}
</style>
</head>
<body>
	<%
	if (loggedIn) {
		NoticeManager noticeManager = new NoticeManager();
		List<Notice> notices = noticeManager.getNoticesByCourse(student.getCourse());
	%>

	<div class="container dashboard-container">
		<!-- Profile Header -->
		<div class="profile-card">
			<div class="profile-header">
				<div class="profile-avatar">
					<%=student.getName().charAt(0)%>
				</div>
				<h2><%=student.getName()%></h2>
				<p class="text-muted">Student Dashboard</p>
			</div>
		</div>

		<!-- Student Information Card -->
		<div class="dashboard-card student-card">
			<div class="card-header-custom">
				<h5>
					<i class="fas fa-user-graduate"></i> Student Profile
				</h5>
				<a href="<%=request.getContextPath()%>/view-attendance"
					class="btn btn-sm btn-primary"> <i
					class="fas fa-calendar-check"></i> View Attendance
				</a>
			</div>

			<div class="student-details">
				<div class="detail">
					<i class="fas fa-id-badge"></i>
					<div>
						<span>Roll Number</span> <strong><%=student.getRollNo()%></strong>
					</div>
				</div>

				<div class="detail">
					<i class="fas fa-user"></i>
					<div>
						<span>Name</span> <strong><%=student.getName()%></strong>
					</div>
				</div>

				<div class="detail">
					<i class="fas fa-venus-mars"></i>
					<div>
						<span>Gender</span> <strong><%=student.getGender()%></strong>
					</div>
				</div>

				<div class="detail">
					<i class="fas fa-layer-group"></i>
					<div>
						<span>Course</span> <strong><%=student.getCourse()%></strong>
					</div>
				</div>

				<div class="detail">
					<i class="fas fa-hourglass-half"></i>
					<div>
						<span>Age</span> <strong><%=student.getAge()%></strong>
					</div>
				</div>

				<div class="detail">
					<i class="fas fa-city"></i>
					<div>
						<span>City</span> <strong><%=student.getCity()%></strong>
					</div>
				</div>
			</div>
		</div>


		<div class="row">
			<!-- Sidebar -->
			<div class="col-lg-3 col-md-4">
				<div class="sidebar">
					<h5>Navigation</h5>
					<ul>
						<li><a href="#"><i class="fas fa-home"></i> Dashboard</a></li>
						<li><a href="#"><i class="fas fa-user"></i> Profile</a></li>
						<li><a href="#"><i class="fas fa-book"></i> Courses</a></li>
						<li><a href="#"><i class="fas fa-chart-line"></i> Grades</a></li>
						<li><a href="#"><i class="fas fa-calendar"></i> Schedule</a></li>
						<li><a href="${pageContext.request.contextPath}/logout">
								<i class="fas fa-sign-out-alt"></i> Logout
						</a></li>

					</ul>
				</div>
			</div>

			<!-- Main Dashboard Content -->
			<div class="col-lg-9 col-md-8">
				<!-- Stats Row -->
				<div class="row">
					<div class="col-md-3 col-sm-6">
						<div class="dashboard-card stat-card">
							<div class="stat-icon">
								<i class="fas fa-graduation-cap"></i>
							</div>
							<div class="stat-value">3.8</div>
							<div class="stat-label">GPA</div>
						</div>
					</div>
					<div class="col-md-3 col-sm-6">
						<div class="dashboard-card stat-card">
							<div class="stat-icon">
								<i class="fas fa-book-open"></i>
							</div>
							<div class="stat-value">5</div>
							<div class="stat-label">Enrolled Courses</div>
						</div>
					</div>
					<div class="col-md-3 col-sm-6">
						<div class="dashboard-card stat-card">
							<div class="stat-icon">
								<i class="fas fa-clock"></i>
							</div>
							<div class="stat-value">120</div>
							<div class="stat-label">Credits Earned</div>
						</div>
					</div>
					<div class="col-md-3 col-sm-6">
						<div class="dashboard-card stat-card">
							<div class="stat-icon">
								<i class="fas fa-trophy"></i>
							</div>
							<div class="stat-value">2</div>
							<div class="stat-label">Achievements</div>
						</div>
					</div>
				</div>

				<!-- Recent Activities -->
				<div class="dashboard-card">
					<h5>
						<i class="fas fa-history"></i> Recent Activities
					</h5>
					<ul class="list-group list-group-flush">
						<li class="list-group-item">Submitted assignment for Math 101</li>
						<li class="list-group-item">Attended lecture on Physics</li>
						<li class="list-group-item">Updated profile information</li>
						<li class="list-group-item">Enrolled in new course: Chemistry
							201</li>
					</ul>
				</div>

				<!-- Upcoming Events -->
				<div class="dashboard-card">
					<h5>
						<i class="fas fa-calendar-alt"></i> Upcoming Events
					</h5>
					<div class="row">
						<div class="col-md-6">
							<div class="card mb-3">
								<div class="card-body">
									<h6 class="card-title">Midterm Exam</h6>
									<p class="card-text">Math 101 - Tomorrow, 10:00 AM</p>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="card mb-3">
								<div class="card-body">
									<h6 class="card-title">Project Deadline</h6>
									<p class="card-text">Computer Science - Friday, 5:00 PM</p>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- Announcements -->
				<div class="dashboard-card">
					<h5>
						<i class="fas fa-bullhorn"></i> Announcements
					</h5>
					<div class="alert alert-info">
						<strong>Important:</strong> Campus will be closed on Monday due to
						holiday.
					</div>
					<%
					if (notices != null && !notices.isEmpty()) {
						for (Notice notice : notices) {
					%><div class="alert alert-warning alert-dismissible fade show">
						<strong><%=notice.getNoticeTitle()%></strong><br>
						<%=notice.getNoticeDescription()%>
						<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
					</div>

					<%
					}
					} else {
					%>
					<div class="alert alert-success">
						<strong>No new notices 🎉</strong>
					</div>
					<%
					}
					%>
				</div>
			</div>
		</div>
	</div>
	<%
	} else {
	%>
	<div class="container dashboard-container">
		<div class="profile-card">
			<div class="error-card">
				<h4>Login Failed</h4>
				<p>Invalid roll number or name. Please try again.</p>
				<a href="<%=request.getContextPath()%>/Pages/student_login.jsp"
					class="btn btn-primary mt-3"> Back to Login </a>
			</div>
		</div>
	</div>

	<%
	}
	%>
	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>