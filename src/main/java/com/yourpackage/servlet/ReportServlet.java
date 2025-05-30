package com.yourpackage.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.yourpackage.model.*;
import com.yourpackage.dao.*;


@WebServlet("/ReportServlet")
public class ReportServlet extends HttpServlet {
    private EmployeeDAO employeeDAO;

    @Override
    public void init() {
        employeeDAO = new EmployeeDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String reportType = (String) session.getAttribute("reportType");
        String value = (String) session.getAttribute("value");

        List<Employee> reportData = null;

        try {
            if ("nameStart".equals(reportType)) {
                reportData = employeeDAO.getEmployeesByNameLetter(value);
            } else if ("yearsOfService".equals(reportType)) {
                int years = Integer.parseInt(value);
                reportData = employeeDAO.getEmployeesByYearsOfService(years);
            } else if ("highSalary".equals(reportType)) {
                double salary = Double.parseDouble(value);
                reportData = employeeDAO.getEmployeesBySalary(salary);
            }

            request.setAttribute("reportData", reportData);
            request.getRequestDispatcher("report_result.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("report_form.jsp?error=Invalid input");
        }
    }
}
