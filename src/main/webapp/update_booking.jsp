<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<%
    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        // Initialize database connection
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/home_gas_delivery", "root", "");

        int orderId = Integer.parseInt(request.getParameter("id"));
        String status = request.getParameter("status");

        // Validate status value
        if (!"Delivered".equals(status) && !"Cancelled".equals(status)) {
            throw new IllegalArgumentException("Invalid status value");
        }

        // Prepare SQL update statement
        String sql = "UPDATE orders SET status = ? WHERE id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, status);
        pstmt.setInt(2, orderId);

        // Execute update
        int rowsAffected = pstmt.executeUpdate();

        if (rowsAffected > 0) {
            response.sendRedirect("admindashboard.jsp?status=success");
        } else {
            response.sendRedirect("admindashboard.jsp?status=error");
        }

    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("admindashboard.jsp?status=error");
    } finally {
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>
