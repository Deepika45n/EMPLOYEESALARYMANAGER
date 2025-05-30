<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Display Employee</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f4f6f9;
            font-family: 'Segoe UI', sans-serif;
        }
        .form-container {
            max-width: 600px;
            margin: 60px auto 30px;
            padding: 30px;
            background: #fff;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        }
        h2, h4 {
            font-weight: 600;
        }
        .employee-details {
            background: #fff;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
            margin-top: 30px;
        }
        @media print {
            .no-print {
                display: none;
            }
            body {
                background: #fff;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <div class="form-container">
        <h2 class="text-center mb-4">🔍 Search Employee</h2>
        <form action="DisplayEmployeeServlet" method="get" class="mb-3">
            <div class="form-group">
                <label for="empno">Enter Employee Number:</label>
                <input type="number" name="empno" class="form-control" required>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-primary">Search</button>
                <a href="index.jsp" class="btn btn-secondary no-print">Back</a>
            </div>
        </form>

        <%
            String error = request.getParameter("error");
            String message = request.getParameter("message");
            if (error != null) {
        %>
            <div class="alert alert-danger"><%= error %></div>
        <%
            } else if (message != null) {
        %>
            <div class="alert alert-success"><%= message %></div>
        <%
            }
            com.yourpackage.model.Employee emp = (com.yourpackage.model.Employee) request.getAttribute("employee");
            if (emp != null) {
        %>
            <div class="employee-details">
                <h4 class="text-center mb-4">👤 Employee Details</h4>
                <table class="table table-bordered">
                    <tr><th>Employee No</th><td><%= emp.getEmpno() %></td></tr>
                    <tr><th>Name</th><td><%= emp.getEmpName() %></td></tr>
                    <tr><th>Date of Joining</th><td><%= emp.getDoj() %></td></tr>
                    <tr><th>Gender</th><td><%= emp.getGender() %></td></tr>
                    <tr><th>Basic Salary</th><td><%= emp.getBsalary() %></td></tr>
                </table>
                <div class="text-center mt-3 no-print">
                    <button class="btn btn-outline-info" onclick="window.print()">🖨️ Print</button>
                </div>
            </div>
        <%
            }
        %>
    </div>
</div>
</body>
</html>
