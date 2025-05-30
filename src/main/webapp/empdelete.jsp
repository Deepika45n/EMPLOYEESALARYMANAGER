<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Employee</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background: #f0f2f5;
            font-family: 'Segoe UI', sans-serif;
        }
        .form-container {
            max-width: 500px;
            margin-top: 60px;
            padding: 30px;
            background-color: #ffffff;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        }
        h2 {
            font-weight: 600;
            color: #dc3545;
        }
        .btn-danger {
            width: 120px;
        }
        .btn-secondary {
            margin-left: 10px;
        }
    </style>
</head>
<body>
<div class="container d-flex justify-content-center">
    <div class="form-container">
        <h2 class="mb-4 text-center">🗑️ Delete Employee</h2>
        <form action="DeleteEmployeeServlet" method="post">
            <div class="form-group">
                <label for="empno">Enter Employee Number:</label>
                <input type="number" name="empno" class="form-control" required>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-danger">Delete</button>
                <a href="index.jsp" class="btn btn-secondary">Back</a>
            </div>
        </form>

        <%
            String message = request.getParameter("message");
            String error = request.getParameter("error");
            if (message != null) {
        %>
            <div class="alert alert-success mt-3"><%= message %></div>
        <%
            } else if (error != null) {
        %>
            <div class="alert alert-danger mt-3"><%= error %></div>
        <%
            }
        %>
    </div>
</div>
</body>
</html>
