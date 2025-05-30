package com.yourpackage.servlet;

import com.yourpackage.dao.EmployeeDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/DeleteEmployeeServlet")
public class DeleteEmployeeServlet extends HttpServlet {
    private EmployeeDAO employeeDAO;

    @Override
    public void init() {
        employeeDAO = new EmployeeDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int empno = Integer.parseInt(request.getParameter("empno"));
            boolean deleted = employeeDAO.deleteEmployee(empno);

            if (deleted) {
                response.sendRedirect("empdelete.jsp?message=Employee deleted successfully");
            } else {
                response.sendRedirect("empdelete.jsp?error=Employee not found");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("empdelete.jsp?error=Invalid input or server error");
        }
    }
}

