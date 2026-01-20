<%@ page import="java.util.*, com.utilities.Student" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Attendance</title>

<style>
    body {
        margin: 0;
        padding: 0;
        font-family: "Segoe UI", Tahoma, sans-serif;
        background: linear-gradient(135deg, #667eea, #764ba2);
        min-height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .container {
        background: #ffffff;
        width: 85%;
        max-width: 900px;
        padding: 25px 30px;
        border-radius: 12px;
        box-shadow: 0 15px 30px rgba(0,0,0,0.25);
    }

    h2 {
        text-align: center;
        margin-bottom: 25px;
        color: #333;
    }

    table {
        width: 100%;
        border-collapse: collapse;
    }

    th {
        background: #667eea;
        color: #fff;
        padding: 12px;
        text-transform: uppercase;
        font-size: 14px;
    }

    td {
        padding: 12px;
        text-align: center;
        border-bottom: 1px solid #eee;
        font-size: 14px;
    }

    tr:hover {
        background-color: #f5f7ff;
    }

    .radio-group {
        display: flex;
        justify-content: center;
        gap: 15px;
    }

    input[type="radio"] {
        accent-color: #667eea;
        cursor: pointer;
    }

    .btn-submit {
        margin-top: 25px;
        display: block;
        width: 200px;
        padding: 10px;
        margin-left: auto;
        margin-right: auto;
        background: #667eea;
        color: white;
        border: none;
        border-radius: 25px;
        font-size: 15px;
        cursor: pointer;
        transition: 0.3s;
    }

    .btn-submit:hover {
        background: #556cd6;
        transform: translateY(-1px);
    }

    .no-data {
        text-align: center;
        padding: 20px;
        font-weight: bold;
        color: #999;
    }
</style>
</head>

<body>

<div class="container">
    <h2>Student Attendance</h2>

    <form  method="post">

        <table>
            <tr>
                <th>Roll No</th>
                <th>Name</th>
                <th>Course</th>
            </tr>

        <%
            List<Student> students = (List<Student>) request.getAttribute("students");
            if (students != null && !students.isEmpty()) {
                for (Student s : students) {
        %>
            <tr>
                <td><%= s.getRollNo() %></td>
                <td><%= s.getName() %></td>
                <td><%= s.getCourse() %></td>
                <td>
                    <div class="radio-group">
                        <label>
                            <input type="radio" 
                                   name="attendance_<%= s.getRollNo() %>" 
                                   value="P" required> Present
                        </label>
                        <label>
                            <input type="radio" 
                                   name="attendance_<%= s.getRollNo() %>" 
                                   value="A"> Absent
                        </label>
                    </div>
                </td>
            </tr>
        <%
                }
            } else {
        %>
            <tr>
                <td colspan="4" class="no-data">No records found</td>
            </tr>
        <%
            }
        %>

        </table>

        <button type="submit" class="btn-submit">Save Attendance</button>
    </form>
</div>

</body>
</html>
