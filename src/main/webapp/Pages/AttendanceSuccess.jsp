<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
<title>Attendance Saved</title>

<style>
body {
	margin: 0;
	padding: 0;
	font-family: "Segoe UI", Tahoma, sans-serif;
	background: linear-gradient(135deg, #43cea2, #185a9d);
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
}

.success-card {
	background: #ffffff;
	padding: 40px;
	width: 380px;
	border-radius: 15px;
	text-align: center;
	box-shadow: 0 20px 40px rgba(0, 0, 0, 0.25);
	animation: popIn 0.5s ease;
}

@
keyframes popIn {from { transform:scale(0.9);
	opacity: 0;
}

to {
	transform: scale(1);
	opacity: 1;
}

}
.success-icon {
	font-size: 55px;
	color: #2e7d32;
	margin-bottom: 10px;
}

h2 {
	color: #2e7d32;
	margin-bottom: 8px;
}

p {
	color: #555;
	font-size: 14px;
	margin-bottom: 25px;
}

.btn {
	display: block;
	width: 100%;
	padding: 12px;
	margin: 10px 0;
	border-radius: 25px;
	text-decoration: none;
	font-size: 15px;
	font-weight: 600;
	transition: 0.3s;
}

.btn-back {
	background: #667eea;
	color: white;
}

.btn-back:hover {
	background: #556cd6;
}

.btn-home {
	background: #333;
	color: white;
}

.btn-home:hover {
	background: #000;
}
</style>
</head>

<body>
	<%
	if (session.getAttribute("admin") == null) {
		response.sendRedirect(request.getContextPath() + "/Pages/adminLogin.jsp");
		return;
	}
	%>

	<div class="success-card">
		<div class="success-icon">✔</div>
		<h2>Attendance Saved</h2>
		<p>Student attendance has been successfully recorded.</p>

		<a href="<%=request.getContextPath()%>/Pages/StudentAttendance.jsp"
			class="btn btn-back"> Take Attendance Again </a> <a
			href="<%=request.getContextPath()%>/Pages/AdminPage.jsp"
			class="btn btn-home"> Go to Dashboard </a>
	</div>

</body>
</html>
