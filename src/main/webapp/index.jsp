<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee Salary Management</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background: #f0f2f5;
            font-family: 'Segoe UI', sans-serif;
        }
        .main-container {
            max-width: 500px;
            margin-top: 80px;
            padding: 30px;
            background-color: #ffffff;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        }
        .main-container h2 {
            font-weight: 600;
            color: #343a40;
        }
        .list-group-item {
            border: none;
            border-bottom: 1px solid #e9ecef;
            transition: 0.3s;
        }
        .list-group-item:hover {
            background-color: #f8f9fa;
            color: #007bff;
            font-weight: 500;
        }
    </style>
</head>
<body>
    <div class="container d-flex justify-content-center">
        <div class="main-container text-center">
            <h2 class="mb-4">Employee Salary Management</h2>
            <div class="list-group">
                <a href="empadd.jsp" class="list-group-item list-group-item-action">➕ Add New Employee</a>
                <a href="empupdate.jsp" class="list-group-item list-group-item-action">✏️ Update Employee</a>
                <a href="empdelete.jsp" class="list-group-item list-group-item-action">🗑️ Delete Employee</a>
                <a href="empdisplay.jsp" class="list-group-item list-group-item-action">📋 Display Employee</a>
                <a href="report_form.jsp" class="list-group-item list-group-item-action">📊 Reports</a>
            </div>
        </div>
    </div>
</body>
</html>
