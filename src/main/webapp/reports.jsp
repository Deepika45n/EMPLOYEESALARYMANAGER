<%@ page import="java.util.List" %>
<%@ page import="com.yourpackage.model.Employee" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Employee Report Results</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
</head>
<body>
    <div class="container my-5">
        <h2 class="text-center mb-4">📊 Employee Report Results</h2>

        <% 
            List<Employee> reportData = (List<Employee>) request.getAttribute("reportData");
            if (reportData == null || reportData.isEmpty()) { 
        %>
            <div class="alert alert-warning text-center" role="alert">
                ⚠️ No matching records found.
            </div>
        <% } else { %>
            <div class="table-responsive">
                <table class="table table-bordered table-striped table-hover">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">Empno</th>
                            <th scope="col">EmpName</th>
                            <th scope="col">DoJ</th>
                            <th scope="col">Gender</th>
                            <th scope="col">Bsalary</th>
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
            </div>
        <% } %>

        <div class="text-center mt-4">
            <a href="report_form.jsp" class="btn btn-primary">🔙 Back to Report Criteria</a>
        </div>
    </div>
</body>
</html>
