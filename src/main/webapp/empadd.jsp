<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Employee</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        /* Background gradient */
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
            padding: 20px;
        }

        /* Form container with glass effect */
        .form-container {
            max-width: 600px;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 20px;
            padding: 40px 35px;
            box-shadow: 0 12px 40px rgba(0, 0, 0, 0.25);
            backdrop-filter: saturate(180%) blur(15px);
            border: 1px solid rgba(255, 255, 255, 0.3);
        }

        h2 {
            font-weight: 700;
            color: #4b367c;
            margin-bottom: 35px;
            text-align: center;
            letter-spacing: 1.5px;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);
        }

        /* Style form labels */
        label {
            font-weight: 600;
            color: #4b367c;
        }

        /* Form control styles */
        .form-control {
            border-radius: 10px;
            border: 1.5px solid #d1c4e9;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
            padding: 10px 15px;
        }

        .form-control:focus {
            border-color: #764ba2;
            box-shadow: 0 0 8px #9c27b0a6;
            outline: none;
        }

        /* Radio buttons styling */
        .form-check-label {
            color: #5a4480;
            font-weight: 600;
        }

        .form-check-input:checked {
            background-color: #764ba2;
            border-color: #764ba2;
        }

        /* Buttons */
        .btn-primary {
            background: linear-gradient(45deg, #764ba2, #667eea);
            border: none;
            font-weight: 700;
            padding: 12px 30px;
            border-radius: 30px;
            transition: background 0.4s ease;
            box-shadow: 0 6px 15px rgba(118, 75, 162, 0.6);
        }

        .btn-primary:hover {
            background: linear-gradient(45deg, #5e3a98, #5662c7);
            box-shadow: 0 8px 20px rgba(85, 65, 165, 0.8);
        }

        .btn-secondary {
            margin-left: 15px;
            padding: 12px 30px;
            border-radius: 30px;
            font-weight: 600;
            border: 2px solid #764ba2;
            background-color: transparent;
            color: #764ba2;
            transition: all 0.3s ease;
        }

        .btn-secondary:hover {
            background-color: #764ba2;
            color: white;
            border-color: #5e3a98;
            box-shadow: 0 8px 20px rgba(118, 75, 162, 0.6);
        }

        /* Alert styling */
        .alert {
            border-radius: 12px;
            font-weight: 600;
            box-shadow: 0 4px 12px rgba(231, 76, 60, 0.4);
        }

        /* Center buttons */
        .text-center {
            margin-top: 30px;
        }
    </style>
</head>
<body>
<div class="container d-flex justify-content-center">
    <div class="form-container">
        <h2>➕ Add New Employee</h2>
        <%
            String error = request.getParameter("error");
            if (error != null && !error.isEmpty()) {
        %>
        <div class="alert alert-danger" role="alert">
            <%= error %>
        </div>
        <%
            }
        %>
        <form action="AddEmployeeServlet" method="post">
            <div class="form-group">
                <label for="empno">Employee Number</label>
                <input type="number" name="empno" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="empName">Employee Name</label>
                <input type="text" name="empName" class="form-control" required pattern="[A-Za-z ]+">
            </div>
            <div class="form-group">
                <label for="doj">Date of Joining</label>
                <input type="date" name="doj" class="form-control" required>
            </div>
            <div class="form-group">
                <label>Gender</label><br>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="gender" value="Male" required>
                    <label class="form-check-label">Male</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="gender" value="Female">
                    <label class="form-check-label">Female</label>
                </div>
            </div>
            <div class="form-group">
                <label for="bsalary">Basic Salary</label>
                <input type="number" name="bsalary" class="form-control" step="0.01" required min="0">
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-primary">Add Employee</button>
                <a href="index.jsp" class="btn btn-secondary">Back</a>
            </div>
        </form>
    </div>
</div>
</body>
</html>
