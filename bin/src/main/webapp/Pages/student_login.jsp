<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Student Login | ABC College</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap"
	rel="stylesheet">

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
}

body {
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	background: linear-gradient(135deg, #1e3c72, #2a5298);
}

.login-card {
	background: #fff;
	width: 380px;
	padding: 40px;
	border-radius: 18px;
	box-shadow: 0 20px 40px rgba(0, 0, 0, 0.25);
}

.login-card h2 {
	text-align: center;
	color: #1e3c72;
	margin-bottom: 10px;
}

.login-card p {
	text-align: center;
	font-size: 14px;
	color: #666;
	margin-bottom: 25px;
}

.form-group {
	margin-bottom: 18px;
}

.form-group label {
	display: block;
	margin-bottom: 6px;
	font-weight: 500;
	color: #333;
}

.form-group input {
	width: 100%;
	padding: 12px 14px;
	border-radius: 10px;
	border: 1px solid #ccc;
	font-size: 14px;
	transition: 0.3s;
}

.form-group input:focus {
	border-color: #1e3c72;
	outline: none;
	box-shadow: 0 0 0 2px rgba(30, 60, 114, 0.2);
}

.login-btn {
	width: 100%;
	padding: 12px;
	margin-top: 10px;
	border: none;
	border-radius: 25px;
	background: #1e3c72;
	color: #fff;
	font-size: 15px;
	font-weight: 500;
	cursor: pointer;
	transition: 0.3s;
}

.login-btn:hover {
	background: #16305f;
}

.footer-text {
	text-align: center;
	margin-top: 20px;
	font-size: 13px;
	color: #777;
}

.footer-text a {
	color: #1e3c72;
	text-decoration: none;
	font-weight: 500;
}

input[type=number]::-webkit-inner-spin-button, input[type=number]::-webkit-outer-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}

input[type=number] {
	-moz-appearance: textfield;
}
</style>
</head>
<body>

	<div class="login-card">
		<h2>Student Login</h2>
		<p>Login using your Roll Number & Name</p>

		<form action="${pageContext.request.contextPath}/studentLogin" method="post">
			<div class="form-group">
				<label>Roll Number</label> <input type="number" name="rollNo"
					placeholder="Enter your roll number" required>
			</div>

			<div class="form-group">
				<label>Student Name</label> <input type="text" name="name"
					placeholder="Enter your name" required>
			</div>

			<button type="submit" class="login-btn">Login</button>
		</form>

		<div class="footer-text">
			Back to <a href="../index.html">Home</a>
		</div>
	</div>

</body>
</html>
