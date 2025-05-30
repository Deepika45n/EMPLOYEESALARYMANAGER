<%@ page import="java.util.List" %>
<%@ page import="com.yourpackage.model.Employee" %>
<html>
<head>
    <title>Employee Report Results</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4">
    <h2 class="text-center mb-4"> Employee Report Results</h2>

    <%
        List<Employee> reportData = (List<Employee>) request.getAttribute("reportData");
        if (reportData == null || reportData.isEmpty()) {
    %>
        <div class="alert alert-warning text-center">No matching records found.</div>
    <% } else { %>
        <table class="table table-bordered table-striped">
            <thead class="thead-dark">
            <tr>
                <th>Empno</th>
                <th>EmpName</th>
                <th>DoJ</th>
                <th>Gender</th>
                <th>Bsalary</th>
            </tr>
            </thead>
            <tbody>
            <% for (Employee emp : reportData) { %>
                <tr>
                    <td><%= emp.getEmpno() %></td>
                    <td><%= emp.getEmpName() %></td>
                    <td><%= emp.getDoj() %></td>
                    <td><%= emp.getGender() %></td>
                    <td><%= emp.getBsalary() %></td>
                </tr>
            <% } %>
            </tbody>
        </table>
    <% } %>

    <div class="text-center mt-4">
        <a href="report_form.jsp" class="btn btn-primary"> Back to Report Criteria</a>
    </div>
</div>
</body>
</html>
