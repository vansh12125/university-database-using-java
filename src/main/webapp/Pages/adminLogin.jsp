<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
<title>Admin Login</title>

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

body {
	height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
	background: linear-gradient(135deg, #141e30, #243b55);
}

/* Login Card */
.admin-card {
	width: 360px;
	background: #ffffff;
	border-radius: 12px;
	padding: 30px;
	box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
	animation: fadeIn 0.6s ease-in-out;
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
.admin-card h2 {
	text-align: center;
	color: #243b55;
	margin-bottom: 8px;
}

.admin-card p {
	text-align: center;
	color: #777;
	font-size: 14px;
	margin-bottom: 20px;
}

/* Form */
.form-group {
	margin-bottom: 15px;
}

.form-group label {
	display: block;
	font-size: 14px;
	color: #333;
	margin-bottom: 6px;
}

.form-group input {
	width: 100%;
	padding: 10px 12px;
	border: 1px solid #ccc;
	border-radius: 6px;
	font-size: 14px;
	transition: 0.3s;
}

.form-group input:focus {
	outline: none;
	border-color: #243b55;
	box-shadow: 0 0 0 2px rgba(36, 59, 85, 0.15);
}

/* Login Button */
.login-btn {
	width: 100%;
	padding: 12px;
	margin-top: 10px;
	border: none;
	border-radius: 6px;
	background: #243b55;
	color: white;
	font-size: 15px;
	font-weight: bold;
	cursor: pointer;
	transition: 0.3s;
}

.login-btn:hover {
	background: #141e30;
}

/* Footer */
.footer-text {
	text-align: center;
	margin-top: 15px;
	font-size: 13px;
}

.footer-text a {
	text-decoration: none;
	color: #243b55;
	font-weight: 600;
}

.footer-text a:hover {
	text-decoration: underline;
}

.password-group {
	position: relative;
}

.password-wrapper {
	position: relative;
	display: flex;
	align-items: center;
}

.password-wrapper input {
	width: 100%;
	padding-right: 40px;
}

.toggle-password {
	position: absolute;
	right: 10px;
	background: none;
	border: none;
	cursor: pointer;
	font-size: 18px;
	color: #555;
}

.toggle-password:hover {
	color: #243b55;
}
</style>
</head>

<body>

	<div class="admin-card">
		<h2>Admin Login</h2>
		<p>Enter your admin credentials</p>

		<form action="${pageContext.request.contextPath}/adminLogin"
			method="post">
			<div class="form-group">
				<label>Username</label> <input type="text" name="username"
					placeholder="Enter admin username" required>
			</div>

			<div class="form-group password-group">
				<label>Password</label>
				<div class="password-wrapper">
					<input type="password" id="password" name="password"
						placeholder="Enter password" required autocomplete="new-password">
					<button type="button" class="toggle-password"
						onclick="togglePassword()">👁️</button>
				</div>
			</div>

			<button type="submit" class="login-btn">Login</button>
		</form>

		<div class="footer-text">
			Back to <a href="../index.html">Home</a>
		</div>
	</div>

	<script>
		function togglePassword() {
			const pwd = document.getElementById("password");
			if (pwd.type === "password") {
				pwd.type = "text";
			} else {
				pwd.type = "password";
			}
		}
	</script>

</body>
</html>
