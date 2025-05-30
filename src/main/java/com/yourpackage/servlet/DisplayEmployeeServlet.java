
package com.yourpackage.servlet;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.yourpackage.dao.EmployeeDAO;
import com.yourpackage.model.Employee;

@WebServlet("/DisplayEmployeeServlet")
public class DisplayEmployeeServlet extends HttpServlet {
    private EmployeeDAO employeeDAO = new EmployeeDAO();
    private static final Logger logger = Logger.getLogger(DisplayEmployeeServlet.class.getName());

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String empnoStr = request.getParameter("empno");
        
        if (empnoStr == null || empnoStr.trim().isEmpty()) {
            request.setAttribute("error", "Employee number is required");
            request.getRequestDispatcher("empdisplay.jsp").forward(request, response);
            return;
        }

        int empno;
        try {
            empno = Integer.parseInt(empnoStr);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid employee number format");
            request.getRequestDispatcher("empdisplay.jsp").forward(request, response);
            return;
        }

        try {
            Employee emp = employeeDAO.selectEmployee(empno);
            if (emp != null) {
                request.setAttribute("employee", emp);
                request.getRequestDispatcher("empdisplay.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Employee not found");
                request.getRequestDispatcher("empdisplay.jsp").forward(request, response);
            }
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error in retrieving employee data", e);
            request.setAttribute("error", "Server error while retrieving employee");
            request.getRequestDispatcher("empdisplay.jsp").forward(request, response);
        }
    }
}