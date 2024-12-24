
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.naming.*" %>

<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/home_gas_delivery", "root", "");

        String sql = "SELECT * FROM users WHERE username = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, username);

        rs = pstmt.executeQuery();

        if (rs.next()) {
            String storedPassword = rs.getString("password");
            // Uncomment and modify the following line if you implement password hashing
            // if (BCrypt.checkpw(password, storedPassword)) {
            if (password.equals(storedPassword)) {
                String role = rs.getString("role");
                session.setAttribute("username", username);
                session.setAttribute("role", role);

                if ("admin".equals(role)) {
                    response.sendRedirect("admindashboard.jsp");
                } else if ("customer".equals(role)) {
                    response.sendRedirect("customerDashboard.jsp");
                }
            } else {
                request.setAttribute("errorMessage", "Invalid username or password. Please try again.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("errorMessage", "User not found. Please try again.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    } catch (Exception e) {
        request.setAttribute("errorMessage", "An error occurred: " + e.getMessage());
        request.getRequestDispatcher("login.jsp").forward(request, response);
    } finally {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
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