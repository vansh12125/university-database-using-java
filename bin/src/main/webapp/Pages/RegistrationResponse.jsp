<!DOCTYPE html>
<html>
<head>
<title>Registration Status</title>
<style>
body {
	font-family: Arial;
	background: #0f2027;
	color: white;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.box {
	background: white;
	color: #333;
	padding: 30px;
	border-radius: 12px;
	text-align: center;
	width: 350px;
}

.success {
	color: green;
}

.error {
	color: red;
}
</style>
</head>
<body>

	<div class="box">
		<%
		String status = (String) request.getAttribute("status");
		Integer rollNo = (Integer) request.getAttribute("rollNo");

		if ("success".equals(status)) {
		%>
		<h2 class="success">Registration Successful</h2>
		<p>Your Roll Number is:</p>
		<h1><%=rollNo%></h1>

		<%
		} else if ("noSeats".equals(status)) {
		%>
		<h2 class="error">Seats Full</h2>
		<p>Please select another course.</p>

		<%
		} else {
		%>
		<h2 class="error">Something Went Wrong</h2>
		<p>Please try again later.</p>
		<%
		}
		%>

		<br> <a
			href="${pageContext.request.contextPath}/Pages/register.jsp">Go
			Back</a> <br> <br> <a
			href="${pageContext.request.contextPath}/index.html">Go Home</a>

	</div>

</body>
</html>
