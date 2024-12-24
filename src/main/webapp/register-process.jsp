<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>

<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String fullname = request.getParameter("fullname");
    String address = request.getParameter("address");
    String phone = request.getParameter("phone");
    String email = request.getParameter("email");
    String role = "customer"; // Default role

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/home_gas_delivery", "root", "");

        // Store the password as plain text (not recommended for production)
        String sql = "INSERT INTO users (username, password, fullname, address, phone, email, role) VALUES (?, ?, ?, ?, ?, ?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, username);
        pstmt.setString(2, password); // Plain text password
        pstmt.setString(3, fullname);
        pstmt.setString(4, address);
        pstmt.setString(5, phone);
        pstmt.setString(6, email);
        pstmt.setString(7, role);

        int rowsAffected = pstmt.executeUpdate();

        if (rowsAffected > 0) {
            response.sendRedirect("login.jsp");
        } else {
            request.setAttribute("errorMessage", "Registration failed. Please try again.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    } catch (Exception e) {
        request.setAttribute("errorMessage", "An error occurred: " + e.getMessage());
        request.getRequestDispatcher("register.jsp").forward(request, response);
    } finally {
        if (pstmt != null) {
            try {
                pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>
