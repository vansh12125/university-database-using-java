<%@ page import="com.utilities.Notice,org.hibernate.Session,com.admin.AdminFactory" %>

<%
int id = Integer.parseInt(request.getParameter("id"));
Session s = AdminFactory.getSession();
Notice n = s.find(Notice.class,id);
s.close();
%>

<!DOCTYPE html>
<html>
<head>
<title>Edit Notice</title>
<style>
body{font-family:Segoe UI;background:#f4f6f9;display:flex;justify-content:center}
form{background:white;padding:25px;width:350px;margin-top:50px;border-radius:10px}
input,textarea{width:100%;padding:10px;margin:8px 0}
button{width:100%;padding:10px;background:#4caf50;color:white;border:none}
</style>
</head>

<body>

<form action="<%=request.getContextPath()%>/notice" method="post">
	<h3>Edit Notice</h3>
	<input type="hidden" name="action" value="update">
	<input type="hidden" name="id" value="<%=n.getNoticeId()%>">
	<input name="title" value="<%=n.getNoticeTitle()%>">
	<textarea name="description"><%=n.getNoticeDescription()%></textarea>
	<button>Update</button>
</form>

</body>
</html>
