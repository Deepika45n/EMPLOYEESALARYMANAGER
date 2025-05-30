<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Employee Report Criteria</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h2>Choose Report Criteria</h2>
    <form action="ReportServlet" method="get">
        <div class="form-group">
            <label for="reportType">Report Type</label>
            <select class="form-control" id="reportType" name="reportType" required>
                <option value="">Select...</option>
                <option value="namestart">Employee Name Starts With</option>
                <option value="yearsofservice">Years of Service (≥)</option>
                <option value="highsalary">Salary Greater Than</option>
            </select>
        </div>
        <div class="form-group">
            <label for="value">Value</label>
            <input type="text" class="form-control" id="value" name="value" required>
        </div>
        <button type="submit" class="btn btn-primary">Generate Report</button>
    </form>
    
    <%
        String error = (String) request.getAttribute("error");
        if (error != null) {
    %>
        <div class="alert alert-danger mt-3"><%= error %></div>
    <% } %>
</div>
</body>
</html>
