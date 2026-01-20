<%@ page
	import="java.util.*,com.utilities.Notice,com.admin.NoticeManager"%>

<%
response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
if (session.getAttribute("admin") == null) {
	response.sendRedirect("adminLogin.jsp");
	return;
}

NoticeManager manager = new NoticeManager();
List<Notice> notices = manager.getNoticesByCourse("BCA");
%>

<!DOCTYPE html>
<html>
<head>
<title>Notice Management</title>
<style>
body {
	font-family: Segoe UI;
	background: #f4f6f9;
	padding: 30px
}

h2 {
	color: #243b55
}

table {
	width: 100%;
	border-collapse: collapse;
	background: white
}

th, td {
	padding: 12px;
	border-bottom: 1px solid #ddd
}

th {
	background: #243b55;
	color: white
}

a.btn {
	padding: 6px 12px;
	border-radius: 5px;
	color: white;
	text-decoration: none
}

.edit {
	background: #4caf50
}

.delete {
	background: #e53935
}

.add {
	display: inline-block;
	margin: 15px 0;
	background: #243b55
}
</style>
</head>

<body>

	<h2>Notice Management</h2>

	<a href="AddNotice.jsp" class="btn add">Add Notice</a>

	<table>
		<tr>
			<th>ID</th>
			<th>Title</th>
			<th>Description</th>
			<th>Course</th>
			<th>Action</th>
		</tr>

		<%
		for (Notice n : notices) {
		%>
		<tr>
			<td><%=n.getNoticeId()%></td>
			<td><%=n.getNoticeTitle()%></td>
			<td><%=n.getNoticeDescription()%></td>
			<td><%=n.getCourse()%></td>
			<td><a class="btn edit"
				href="EditNotice.jsp?id=<%=n.getNoticeId()%>">Edit</a> <a
				class="btn delete"
				href="<%=request.getContextPath()%>/notice?action=delete&id=<%=n.getNoticeId()%>"
				onclick="return confirm('Delete this notice?')">Delete</a></td>
		</tr>
		<%
		}
		%>

	</table>

</body>
</html>
