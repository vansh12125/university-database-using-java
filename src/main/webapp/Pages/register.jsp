<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Student Registration</title>

<style>
* {
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
}

body {
	margin: 0;
	min-height: 100vh;
	background: linear-gradient(120deg, #0f2027, #203a43, #2c5364);
	display: flex;
	align-items: center;
	justify-content: center;
	padding: 20px;
}

.container {
	width: 100%;
	max-width: 480px;
	background: rgba(255, 255, 255, 0.15);
	backdrop-filter: blur(15px);
	border-radius: 18px;
	padding: 35px;
	box-shadow: 0 20px 40px rgba(0, 0, 0, 0.3);
	color: #fff;
}

.container h2 {
	text-align: center;
	margin-bottom: 30px;
	font-weight: 600;
	letter-spacing: 1px;
}

.form-group {
	margin-bottom: 18px;
}

.form-group label {
	display: block;
	margin-bottom: 6px;
	font-size: 14px;
	opacity: 0.9;
}

.form-group input, .form-group select {
	width: 100%;
	padding: 12px 14px;
	border-radius: 10px;
	border: none;
	outline: none;
	font-size: 15px;
}

.form-group input:focus, .form-group select:focus {
	box-shadow: 0 0 0 3px rgba(99, 102, 241, 0.6);
}

.gender {
	display: flex;
	gap: 20px;
}

.gender label {
	font-size: 14px;
}

button {
	width: 100%;
	margin-top: 10px;
	padding: 14px;
	border-radius: 14px;
	border: none;
	background: linear-gradient(135deg, #6366f1, #3b82f6);
	color: #fff;
	font-size: 16px;
	cursor: pointer;
	transition: 0.3s;
}

button:hover {
	transform: translateY(-2px);
	box-shadow: 0 10px 20px rgba(59, 130, 246, 0.5);
}

@media ( max-width :500px) {
	.container {
		padding: 25px;
	}
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

	<div class="container">
		<h2>Student Registration</h2>

		<form action="${pageContext.request.contextPath}/register" method="post">

			<div class="form-group">
				<label>Full Name</label> <input type="text" name="name" required>
			</div>

			<div class="form-group">
				<label>Course</label> <select name="course" required>
					<option value="">Select Course</option>
					<option value="BCA">BCA</option>
					<option value="BBA">BBA</option>
					<option value="BCOM">BCOM</option>
					<option value="MCA">MCA</option>
				</select>
			</div>

			<div class="form-group">
				<label>City</label> <input type="text" name="city" required>
			</div>

			<div class="form-group">
				<label>Age</label> <input type="number" name="age" min="1" required>
			</div>

			<div class="form-group">
				<label>Gender</label>
				<div class="gender">
					<label><input type="radio" name="gender" value="Male"
						required> Male</label> <label><input type="radio"
						name="gender" value="Female"> Female</label>
				</div>
			</div>

			<button type="submit">Register Now</button>

		</form>
	</div>

</body>
</html>
