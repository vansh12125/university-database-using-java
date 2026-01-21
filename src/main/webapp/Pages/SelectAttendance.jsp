<!DOCTYPE html>
<html>
<head>
<title>Select Attendance</title>

<style>
body {
	font-family: Segoe UI;
	background: linear-gradient(135deg, #667eea, #764ba2);
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
}

.card {
	background: white;
	padding: 30px;
	width: 350px;
	border-radius: 12px;
	box-shadow: 0 15px 30px rgba(0, 0, 0, .25);
}

h2 {
	text-align: center;
	margin-bottom: 20px
}

select, input, button {
	width: 100%;
	padding: 10px;
	margin: 10px 0;
}

button {
	background: #667eea;
	color: white;
	border: none;
	border-radius: 20px;
}
</style>
</head>

<body>
	<div class="card">
		<h2>Take Attendance</h2>

		<%
		String error = (String) request.getAttribute("error");
		if (error != null) {
		%>
		<p style="color: red; text-align: center; margin-bottom: 10px;">
			<%=error%>
		</p>
		<%
		}
		%>
		<form action="<%=request.getContextPath()%>/loadAttendance"
			method="post">

			<select name="course" required>
				<option value="">Select Course</option>
				<option value="BCA">BCA</option>
				<option value="MCA">MCA</option>
				<option value="BBA">BBA</option>
				<option value="BCOM">B.com</option>
			</select> <input type="date" name="date" required>

			<button type="submit">Proceed</button>
		</form>
	</div>
</body>
</html>
