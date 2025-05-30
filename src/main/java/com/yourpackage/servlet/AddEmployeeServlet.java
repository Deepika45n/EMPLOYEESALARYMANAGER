package com.yourpackage.servlet;

import com.yourpackage.dao.EmployeeDAO;
import com.yourpackage.model.Employee;



import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/AddEmployeeServlet")
public class AddEmployeeServlet extends HttpServlet {
    private EmployeeDAO employeeDAO;

    @Override
    public void init() {
        employeeDAO = new EmployeeDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int empno = Integer.parseInt(request.getParameter("empno"));
            String empName = request.getParameter("empName");
            String gender = request.getParameter("gender");
            double bsalary = Double.parseDouble(request.getParameter("bsalary"));

            // Parse date
            String dojStr = request.getParameter("doj");
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date doj = sdf.parse(dojStr);

            Employee emp = new Employee(empno, empName, doj, gender, bsalary);
            employeeDAO.insertEmployee(emp);

            response.sendRedirect("empdisplay.jsp?message=Employee Added Successfully");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("empadd.jsp?error=Something went wrong. Please try again.");
        }
    }
}
