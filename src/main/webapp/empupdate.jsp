<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.yourpackage.model.Employee" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Employee</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f4f6f9;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .form-container {
            max-width: 650px;
            margin: 60px auto 30px;
            padding: 30px 40px;
            background: #fff;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        }
        h2, h3 {
            font-weight: 600;
        }
        .alert {
            margin-top: 20px;
        }
        input[type="radio"] {
            margin-left: 10px;
            margin-right: 5px;
        }
        .btn-group {
            margin-top: 15px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="form-container">
        <h2 class="text-center mb-4">🔍 Search Employee to Update</h2>
        <form action="UpdateEmployeeServlet" method="get" class="mb-4">
            <div class="form-group">
                <label for="empno">Employee Number:</label>
                <input type="number" name="empno" class="form-control" required>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-primary">Search</button>
                <a href="index.jsp" class="btn btn-secondary ml-2">Back</a>
            </div>
        </form>

        <%
            Employee emp = (Employee) request.getAttribute("employee");
            if (emp != null) {
        %>
        <h3 class="mb-3">✏️ Update Employee Info</h3>
        <form action="UpdateEmployeeServlet" method="post">
            <input type="hidden" name="empno" value="<%= emp.getEmpno() %>">
            <div class="form-group">
                <label>Employee Name:</label>
                <input type="text" name="empName" value="<%= emp.getEmpName() %>" class="form-control" required pattern="[A-Za-z ]+">
            </div>
            <div class="form-group">
                <label>Date of Joining:</label>
                <input type="date" name="doj" value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(emp.getDoj()) %>" class="form-control" required>
            </div>
            <div class="form-group">
                <label>Gender:</label><br>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="gender" value="Male" id="male" <%= emp.getGender().equals("Male") ? "checked" : "" %>>
                    <label class="form-check-label" for="male">Male</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="gender" value="Female" id="female" <%= emp.getGender().equals("Female") ? "checked" : "" %>>
                    <label class="form-check-label" for="female">Female</label>
                </div>
            </div>
            <div class="form-group">
                <label>Basic Salary:</label>
                <input type="number" name="bsalary" value="<%= emp.getBsalary() %>" class="form-control" step="0.01" min="0" required>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-success">Update</button>
            </div>
        </form>
        <%
            } else if (request.getParameter("error") != null) {
        %>
        <div class="alert alert-danger mt-3"><%= request.getParameter("error") %></div>
        <%
            } else if (request.getParameter("message") != null) {
        %>
        <div class="alert alert-success mt-3"><%= request.getParameter("message") %></div>
        <%
            }
        %>
    </div>
</div>
</body>
</html>
