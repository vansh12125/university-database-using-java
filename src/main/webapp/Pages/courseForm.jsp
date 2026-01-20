<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fetch Students</title>

<style>
    body {
        margin: 0;
        padding: 0;
        font-family: Arial, Helvetica, sans-serif;
        background: linear-gradient(to right, #667eea, #764ba2);
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .card {
        background: #fff;
        padding: 30px 40px;
        width: 360px;
        border-radius: 10px;
        box-shadow: 0 12px 25px rgba(0,0,0,0.2);
    }

    h2 {
        text-align: center;
        margin-bottom: 25px;
        color: #333;
    }

    label {
        font-size: 14px;
        color: #555;
        display: block;
        margin-bottom: 6px;
    }

    select, input[type="date"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 18px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 14px;
    }

    select:focus, input:focus {
        outline: none;
        border-color: #667eea;
        box-shadow: 0 0 5px rgba(102,126,234,0.5);
    }

    button {
        width: 100%;
        padding: 10px;
        background: #667eea;
        border: none;
        color: white;
        font-size: 15px;
        border-radius: 5px;
        cursor: pointer;
    }

    button:hover {
        background: #5a6fdc;
    }
</style>
</head>

<body>

<div class="card">
    <h2>Fetch Students</h2>

    <form action="<%= request.getContextPath() %>/fetchCourse" method="get">

        <label for="course">Select Course</label>
        <select name="course" id="course" required>
            <option value="">-- Select Course --</option>
            <option value="BCA">BCA</option>
            <option value="BBA">BBA</option>
            <option value="BTECH">BTech</option>
            <option value="BSC">BSc</option>
        </select>

        <label for="date">Select Date</label>
        <input type="date" name="date" id="date" required>

        <button type="submit">Fetch Students</button>
    </form>
</div>

</body>
</html>
