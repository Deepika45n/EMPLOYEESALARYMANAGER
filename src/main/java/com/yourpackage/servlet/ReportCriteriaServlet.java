package com.yourpackage.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/ReportCriteriaServlet")
public class ReportCriteriaServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String reportType = request.getParameter("reportType");
        String value = request.getParameter("value");

        HttpSession session = request.getSession();
        session.setAttribute("reportType", reportType);
        session.setAttribute("value", value);

        response.sendRedirect("ReportServlet");
    }
}
