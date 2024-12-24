<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<%
    // Retrieve parameters
    String idStr = request.getParameter("id");
    String message = request.getParameter("message");

    // Initialize the message variable
    String responseMessage = "";

    // Check if both parameters are provided
    if (idStr != null && !idStr.trim().isEmpty() && message != null) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Parse the ID and check if it's a valid integer
            int id = Integer.parseInt(idStr.trim());

            // Initialize database connection
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/home_gas_delivery", "root", "");

            // Update the orders table with the message for the given order ID
            String sql = "UPDATE orders SET message = ? WHERE id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, message);
            pstmt.setInt(2, id);
            int rowsUpdated = pstmt.executeUpdate();

            if (rowsUpdated > 0) {
                // Redirect to dashboard page with success status
                response.sendRedirect("admindashboard.jsp?id=" + id + "&status=success");
            } else {
                // Print error message if no rows were updated (invalid order ID)
                responseMessage = "Error: No order found with ID " + id + ".";
            }
        } catch (NumberFormatException e) {
            responseMessage = "Invalid order ID format.";
        } catch (SQLException e) {
            responseMessage = "Error updating order message: " + e.getMessage();
        } finally {
            // Close the PreparedStatement and Connection
            if (pstmt != null) {
                try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
            if (conn != null) {
                try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        }
    } else {
        responseMessage = "Error: Missing order ID or message.";
    }

    // Output the response message
    if (!responseMessage.isEmpty()) {
        out.println("<p>" + responseMessage + "</p>");
    }
%>
