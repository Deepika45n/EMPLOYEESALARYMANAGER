package com.yourpackage.dao;

import com.yourpackage.model.Employee;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDAO {

    private String jdbcURL = "jdbc:mysql://localhost:3306/emp_db?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "686969pika@";

    private static final String INSERT_EMPLOYEE_SQL = 
        "INSERT INTO Employee (Empno, EmpName, DoJ, Gender, Bsalary) VALUES (?, ?, ?, ?, ?)";
    private static final String SELECT_EMPLOYEE_BY_ID = 
        "SELECT * FROM Employee WHERE Empno = ?";
    private static final String SELECT_ALL_EMPLOYEES = 
        "SELECT * FROM Employee";
    private static final String DELETE_EMPLOYEE_SQL = 
        "DELETE FROM Employee WHERE Empno = ?";
    private static final String UPDATE_EMPLOYEE_SQL = 
        "UPDATE Employee SET EmpName=?, DoJ=?, Gender=?, Bsalary=? WHERE Empno=?";
    private static final String SELECT_BY_NAME_LETTER = 
        "SELECT * FROM Employee WHERE LOWER(EmpName) LIKE ?";
    private static final String SELECT_BY_YEARS = 
        "SELECT * FROM Employee WHERE TIMESTAMPDIFF(YEAR, DoJ, CURDATE()) >= ?";
    private static final String SELECT_BY_SALARY = 
        "SELECT * FROM Employee WHERE Bsalary > ?";

    // Database connection
    protected Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    // Insert employee
    public void insertEmployee(Employee emp) throws SQLException, ClassNotFoundException {
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(INSERT_EMPLOYEE_SQL)) {
            ps.setInt(1, emp.getEmpno());
            ps.setString(2, emp.getEmpName());
            ps.setDate(3, new java.sql.Date(emp.getDoj().getTime()));
            ps.setString(4, emp.getGender());
            ps.setDouble(5, emp.getBsalary());
            ps.executeUpdate();
        }
    }

    // Get employee by ID
    public Employee selectEmployee(int empno) throws SQLException, ClassNotFoundException {
        Employee emp = null;
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(SELECT_EMPLOYEE_BY_ID)) {
            ps.setInt(1, empno);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                emp = new Employee(
                    rs.getInt("Empno"),
                    rs.getString("EmpName"),
                    rs.getDate("DoJ"),
                    rs.getString("Gender"),
                    rs.getDouble("Bsalary")
                );
            }
        }
        return emp;
    }

    // Get all employees
    public List<Employee> selectAllEmployees() throws SQLException, ClassNotFoundException {
        List<Employee> list = new ArrayList<>();
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(SELECT_ALL_EMPLOYEES)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Employee(
                    rs.getInt("Empno"),
                    rs.getString("EmpName"),
                    rs.getDate("DoJ"),
                    rs.getString("Gender"),
                    rs.getDouble("Bsalary")
                ));
            }
        }
        return list;
    }

    // Delete employee
    public boolean deleteEmployee(int empno) throws SQLException, ClassNotFoundException {
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(DELETE_EMPLOYEE_SQL)) {
            ps.setInt(1, empno);
            return ps.executeUpdate() > 0;
        }
    }

    // Update employee
    public boolean updateEmployee(Employee emp) throws SQLException, ClassNotFoundException {
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(UPDATE_EMPLOYEE_SQL)) {
            ps.setString(1, emp.getEmpName());
            ps.setDate(2, new java.sql.Date(emp.getDoj().getTime()));
            ps.setString(3, emp.getGender());
            ps.setDouble(4, emp.getBsalary());
            ps.setInt(5, emp.getEmpno());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Error updating employee: " + e.getMessage());
            return false;
        }
    }

    // Get employees by name starting letter (case-insensitive)
    public List<Employee> getEmployeesByNameLetter(String letter) throws SQLException, ClassNotFoundException {
        List<Employee> list = new ArrayList<>();
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(SELECT_BY_NAME_LETTER)) {

            String param = letter.trim().toLowerCase() + "%";
            ps.setString(1, param);

            System.out.println("Executing query: " + SELECT_BY_NAME_LETTER + " with param: " + param);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Employee(
                    rs.getInt("Empno"),
                    rs.getString("EmpName"),
                    rs.getDate("DoJ"),
                    rs.getString("Gender"),
                    rs.getDouble("Bsalary")
                ));
            }
        }
        return list;
    }

    public List<Employee> getEmployeesByYearsOfService(int years) throws SQLException, ClassNotFoundException {
        List<Employee> list = new ArrayList<>();
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(SELECT_BY_YEARS)) {

            ps.setInt(1, years);

            System.out.println("Executing query: " + SELECT_BY_YEARS + " with param: " + years);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Employee(
                    rs.getInt("Empno"),
                    rs.getString("EmpName"),
                    rs.getDate("DoJ"),
                    rs.getString("Gender"),
                    rs.getDouble("Bsalary")
                ));
            }
        }
        return list;
    }

    public List<Employee> getEmployeesBySalary(double salary) throws SQLException, ClassNotFoundException {
        List<Employee> list = new ArrayList<>();
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(SELECT_BY_SALARY)) {

            ps.setDouble(1, salary);

            System.out.println("Executing query: " + SELECT_BY_SALARY + " with param: " + salary);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Employee(
                    rs.getInt("Empno"),
                    rs.getString("EmpName"),
                    rs.getDate("DoJ"),
                    rs.getString("Gender"),
                    rs.getDouble("Bsalary")
                ));
            }
        }
        return list;
    }
}