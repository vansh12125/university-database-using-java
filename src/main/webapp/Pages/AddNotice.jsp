<!DOCTYPE html>
<html>
<head>
<title>Add Notice</title>
<style>
body {
	font-family: Segoe UI;
	background: #f4f6f9;
	display: flex;
	justify-content: center
}

form {
	background: white;
	padding: 25px;
	width: 350px;
	margin-top: 50px;
	border-radius: 10px
}

input, textarea {
	width: 100%;
	padding: 10px;
	margin: 8px 0
}

button {
	width: 100%;
	padding: 10px;
	background: #243b55;
	color: white;
	border: none
}

select {
	width: 100%;
	padding: 10px;
	margin: 8px 0;
	border-radius: 5px;
	border: 1px solid #ccc;
	font-size: 14px;
	background: white;
}

</style>
</head>

<body>

	<form action="<%=request.getContextPath()%>/notice" method="post">
		<h3>Add Notice</h3>
		<input type="hidden" name="action" value="add"> <input
			name="title" placeholder="Title" required>
		<textarea name="description" placeholder="Description" required></textarea>
		<select name="course" required>
			<option value="">-- Select Course --</option>
			<option value="BCA">BCA</option>
			<option value="MCA">MCA</option>
			<option value="BBA">BBA</option>
			<option value="BCOM">B.com</option>
		</select>

		<button>Add</button>
	</form>

</body>
</html>
