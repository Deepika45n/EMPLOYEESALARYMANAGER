package com.yourpackage.servlet;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.yourpackage.dao.EmployeeDAO;
import com.yourpackage.model.Employee;

@WebServlet("/UpdateEmployeeServlet")
public class UpdateEmployeeServlet extends HttpServlet {
    private EmployeeDAO employeeDAO = new EmployeeDAO();
    private static final Logger logger = Logger.getLogger(UpdateEmployeeServlet.class.getName());

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String empnoStr = request.getParameter("empno");

        if (empnoStr == null || empnoStr.trim().isEmpty()) {
            response.sendRedirect("empupdate.jsp?error=Employee number is required");
            return;
        }

        int empno;
        try {
            empno = Integer.parseInt(empnoStr);
        } catch (NumberFormatException e) {
            response.sendRedirect("empupdate.jsp?error=Invalid Employee Number Format");
            return;
        }

        try {
            Employee emp = employeeDAO.selectEmployee(empno);
            if (emp != null) {
                request.setAttribute("employee", emp);
                request.getRequestDispatcher("empupdate.jsp").forward(request, response);
            } else {
                response.sendRedirect("empupdate.jsp?error=Employee not found");
            }
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error retrieving employee data", e);
            response.sendRedirect("empupdate.jsp?error=Server error while fetching employee");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int empno = Integer.parseInt(request.getParameter("empno"));
            String empName = request.getParameter("empName");
            String gender = request.getParameter("gender");
            double bsalary = Double.parseDouble(request.getParameter("bsalary"));
            String dojStr = request.getParameter("doj");

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date utilDate = sdf.parse(dojStr);
            java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());

            Employee emp = new Employee(empno, empName, sqlDate, gender, bsalary);
            boolean updated = employeeDAO.updateEmployee(emp);

            if (updated) {
                response.sendRedirect("empupdate.jsp?message=Employee updated successfully");
            } else {
                response.sendRedirect("empupdate.jsp?error=Employee not found or update failed");
            }
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error updating employee data", e);
            response.sendRedirect("empupdate.jsp?error=Update failed due to server error");
        }
    }
}