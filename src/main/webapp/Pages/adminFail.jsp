<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>
 
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<title>Login Failed</title>

<style>
* {
	box-sizing: border-box;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

body {
	height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
	background: linear-gradient(135deg, #ff4e50, #f44336);
}

.fail-card {
	background: #fff;
	padding: 35px;
	width: 380px;
	border-radius: 14px;
	text-align: center;
	box-shadow: 0 20px 40px rgba(0,0,0,0.2);
	animation: slideIn 0.6s ease;
}

@keyframes slideIn {
	from { opacity: 0; transform: translateY(20px); }
	to { opacity: 1; transform: translateY(0); }
}

.fail-card h2 {
	color: #d32f2f;
	margin-bottom: 10px;
}

.fail-card p {
	color: #555;
	font-size: 15px;
	margin-bottom: 25px;
}

/* Buttons */
.btn {
	display: block;
	width: 100%;
	padding: 12px;
	margin: 10px 0;
	border: none;
	border-radius: 8px;
	font-size: 15px;
	font-weight: bold;
	cursor: pointer;
	transition: 0.3s;
	text-decoration: none;
}

.login-btn {
	background: #d32f2f;
	color: white;
}

.login-btn:hover {
	background: #b71c1c;
}

.home-btn {
	background: #333;
	color: white;
}

.home-btn:hover {
	background: #000;
}
</style>
</head>

<body>

<div class="fail-card">
	<h2>❌ Login Failed</h2>
	<p>Invalid admin username or password.<br>Please try again.</p>

	<a href="${pageContext.request.contextPath}/Pages/adminLogin.jsp" class="btn login-btn">
		Login Again
	</a>

	<a href="${pageContext.request.contextPath}/index.html" class="btn home-btn">
		Go to Home
	</a>
</div>

</body>
</html>
