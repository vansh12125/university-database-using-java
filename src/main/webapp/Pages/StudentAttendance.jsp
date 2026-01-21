<%@ page import="java.util.*, com.utilities.Student"%>
<!DOCTYPE html>
<html>
<head>
<title>Student Attendance</title>

<style>
body {
	font-family: Segoe UI;
	background: #667eea;
	display: flex;
	justify-content: center;
}

.container {
	background: white;
	width: 90%;
	max-width: 900px;
	padding: 25px;
	margin-top: 40px;
	border-radius: 12px;
}

table {
	width: 100%;
	border-collapse: collapse;
}

th {
	background: #556cd6;
	color: white;
	padding: 10px;
}

td {
	padding: 10px;
	text-align: center;
}

.radio {
	display: flex;
	justify-content: center;
	gap: 15px;
}

button {
	margin: 20px auto;
	display: block;
	padding: 10px 25px;
	background: #556cd6;
	color: white;
	border: none;
	border-radius: 20px;
}

button:disabled {
	background: #aaa;
	cursor: not-allowed;
}

.error-box {
	background: #ffe0e0;
	color: #b00000;
	padding: 10px;
	margin-bottom: 15px;
	border-radius: 8px;
	text-align: center;
	font-size: 14px;
}
</style>
</head>

<body>
	<div class="container">

		<%
		/* ===== PAGE PROTECTION ===== */
		String course = (String) session.getAttribute("course");
		String date = (String) session.getAttribute("attendanceDate");
		List<Student> students = (List<Student>) session.getAttribute("students");

		if (course == null || date == null) {
		%>
		<div class="error-box">Invalid access. Please select course and
			date again.</div>
		<%
		return;
		}
		%>

		<h2 align="center">Student Attendance</h2>

		<h3 align="center">
			Course:
			<%=course%>
			| Date:
			<%=date%>
		</h3>

		<%
		if (students == null || students.isEmpty()) {
		%>
		<div class="error-box">No students found for this course.</div>
		<%
		}
		%>

		<form action="<%=request.getContextPath()%>/saveAttendance"
			method="post">

			<table>
				<tr>
					<th>Roll No</th>
					<th>Name</th>
					<th>Course</th>
					<th>Attendance</th>
				</tr>

				<%
				if (students != null && !students.isEmpty()) {
					for (Student s : students) {
				%>
				<tr>
					<td><%=s.getRollNo()%></td>
					<td><%=s.getName()%></td>
					<td><%=s.getCourse()%></td>
					<td class="radio"><label> <input type="radio"
							name="attendance_<%=s.getRollNo()%>" value="P" required>
							Present
					</label> <label> <input type="radio"
							name="attendance_<%=s.getRollNo()%>" value="A"> Absent
					</label></td>
				</tr>
				<%
				}
				}
				%>

			</table>

			<button type="submit"
				<%=(students == null || students.isEmpty()) ? "disabled" : ""%>>
				Save Attendance</button>

		</form>

	</div>
</body>
</html>
