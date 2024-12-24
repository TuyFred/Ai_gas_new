<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="conn.jsp" %>
<%@ page import="java.sql.*" %>
<%
    // Check if the session exists and if the customer_name attribute is set
    if (session.getAttribute("username") == null) {
%>
    <script type="text/javascript">
        alert("Login to access this page");
        window.location.href = "login.jsp"; // Redirect to the login page
    </script>
<%
        // Prevent further processing of the page
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Client Dashboard - Hair Saloon</title>
    <link rel="stylesheet" href="../bootstrap1/boot/css/bootstrap.min.css">
    <link rel="stylesheet" href="../fontawesome/css/all.min.css">
    <style>
        /* Custom CSS for styling */
        .dashboard-card {
            margin-bottom: 20px;
            border: none;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .dashboard-card-header {
            background-color: #007bff;
            color: #fff;
        }
        .dashboard-card-header h3 {
            margin-bottom: 0;
        }
        .badge-cancelled {
            background-color: #dc3545;
        }
        .badge-completed {
            background-color: #28a745;
        }
        .badge-pending {
            background-color: #ffc107;
        }
        .message-white {
            color: #fff;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="../index.jsp"><i class="fas fa-cut"></i> </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
    </nav>

    <div class="container my-5">
        <div class="dashboard-card">
            <div class="card dashboard-card-header">
                <div class="card-header">
                    <h3>Your Bookings</h3>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Date</th>
                                    <th>Time</th>
                                    <th>Service</th>
                                    <th>Stylist</th>
                                    <th>Status</th>
                                    <th>Message</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% 
                                    String customerName = (String) session.getAttribute("username");
                                    int customerId = -1;

                                    // Get customer ID from customer name
                                    try {
                                        String customerQuery = "SELECT user_id FROM users WHERE username = ?";
                                        PreparedStatement pstmt = conn.prepareStatement(customerQuery);
                                        pstmt.setString(1, customerName);
                                        ResultSet resultSet = pstmt.executeQuery();
                                        if (resultSet.next()) {
                                            customerId = resultSet.getInt("user_id");
                                        }
                                        pstmt.close();
                                    } catch (SQLException e) {
                                        out.println("<p>Error fetching customer ID: " + e.getMessage() + "</p>");
                                    }

                                    // Fetch bookings for the customer
                                    try {
                                        String query = "SELECT id, order_date, delivery_date, status, created_at FROM orders WHERE user_id = ?"; // Use customer ID to filter bookings

                                        PreparedStatement pstmt = conn.prepareStatement(query);
                                        pstmt.setInt(1, customerId);
                                        ResultSet resultSet = pstmt.executeQuery();
                                        int i = 1;
                                        while (resultSet.next()) {
                                            int id = resultSet.getInt("id"); // Use resultSet here
                                            String orderDate = resultSet.getString("order_date");
                                            String deliveryDate = resultSet.getString("delivery_date");
                                            String status = resultSet.getString("status");
                                            String createdAt = resultSet.getString("created_at");
                                           
                                %>
                                <tr>
                                    <td><%= i++ %></td>
                                    <td><%= orderDate %></td>
                                    <td><%= deliveryDate %></td>
                                    <td><%= status %></td>
                                    <td><%= createdAt %></td>
                                    <td>
                                        <span class="badge <%= (status.equals("Cancelled") ? "badge-cancelled" : status.equals("Completed") ? "badge-completed" : "badge-pending") %>">
                                            <%= status %>
                                        </span>
                                    </td>
                                   
                                </tr>
                                <% 
                                        }
                                        pstmt.close();
                                    } catch (SQLException e) {
                                        out.println("<p>Error fetching bookings: " + e.getMessage() + "</p>");
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Bootstrap and jQuery -->
    <script src="../bootstrap1/boot/js/jquery.min.js"></script>
    <script src="../bootstrap1/boot/js/bootstrap.min.js"></script>
</body>
</html>
