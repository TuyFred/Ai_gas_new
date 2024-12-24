<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="com.MYPROJECT_AI_HOMEGAS.util.DBUtil" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Order Processing</title>
    <link rel="stylesheet" href="bootstrap1/boot/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h2>Order Processing</h2>
        <%
            // Retrieve form data
            String userId = request.getParameter("userId");
            String orderDate = request.getParameter("orderDate");
            String deliveryDate = request.getParameter("deliveryDate");
            String status = "Pending"; // Set a default status for a new order
            String message = request.getParameter("message");

            Connection conn = null;
            PreparedStatement pstmt = null;
            String errorMessage = null;

            try {
                // Establish database connection
                conn = DBUtil.getConnection();

                // Insert order data into the database
                String sql = "INSERT INTO orders (user_id, order_date, delivery_date, status,message) VALUES (?, ?, ?, ?, ?)";
                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, Integer.parseInt(userId));
                pstmt.setDate(2, java.sql.Date.valueOf(orderDate));
                pstmt.setDate(3, java.sql.Date.valueOf(deliveryDate));
                pstmt.setString(4, status);
                pstmt.setString(5, message.isEmpty() ? "No additional notes" : message);
                pstmt.executeUpdate();

                // Redirect to the order list page with the userId
                response.sendRedirect("orderList.jsp?userId=" + userId);
            } catch (SQLException e) {
                e.printStackTrace();
                errorMessage = "SQL Error: " + e.getMessage();
            } catch (Exception e) {
                e.printStackTrace();
                errorMessage = "Unexpected Error: " + e.getMessage();
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

            if (errorMessage != null) {
        %>
                <div class="alert alert-danger">
                    <strong>Error:</strong> <%= errorMessage %>
                </div>
        <%
            }
        %>
    </div>
</body>
</html>
