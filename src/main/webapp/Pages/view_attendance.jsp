<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.admin.Attendance" %>

<!DOCTYPE html>
<html>
<head>
<title>View Attendance</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">

<style>
body {
    background: linear-gradient(135deg, #667eea, #764ba2);
    min-height: 100vh;
    font-family: Segoe UI;
}

.attendance-card {
    background: white;
    border-radius: 15px;
    padding: 1.5rem;
    box-shadow: 0 10px 30px rgba(0,0,0,0.15);
}

.status-present {
    background: #d1e7dd;
    color: #0f5132;
    font-weight: 600;
    padding: 6px 12px;
    border-radius: 20px;
}

.status-absent {
    background: #f8d7da;
    color: #842029;
    font-weight: 600;
    padding: 6px 12px;
    border-radius: 20px;
}

.table thead {
    background: #667eea;
    color: white;
}
</style>
</head>

<body>

<div class="container py-5">
    <div class="attendance-card">

        <div class="d-flex justify-content-between align-items-center mb-4">
            <h4><i class="fas fa-calendar-check"></i> Attendance Report</h4>
            <a href="<%=request.getContextPath()%>/Pages/StudentProfile.jsp" class="btn btn-outline-secondary btn-sm">
                <i class="fas fa-arrow-left"></i> Back
            </a>
        </div>

        <table class="table table-hover align-middle">
            <thead>
                <tr>
                    <th>Date</th>
                    <th>Course</th>
                    <th>Status</th>
                </tr>
            </thead>

            <tbody>
                <%
                    List<Attendance> attendanceList =
                        (List<Attendance>) request.getAttribute("addentance");

                    if (attendanceList != null && !attendanceList.isEmpty()) {
                        for (Attendance a : attendanceList) {
                %>
                <tr>
                    <td><%= a.getAttendanceDate() %></td>
                    <td><%= a.getCourse() %></td>
                    <td>
                        <span class="<%= 
                            a.getStatus().equalsIgnoreCase("Present")
                            ? "status-present"
                            : "status-absent" %>">
                            <%= a.getStatus() %>
                        </span>
                    </td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="3" class="text-center text-muted py-4">
                        No attendance records found
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>

    </div>
</div>

</body>
</html>
