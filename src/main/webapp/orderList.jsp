<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%@ include file="conn.jsp" %>
<%
    // Check if the session exists and if the username attribute is set
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
    <title>Order List - Home Gas Delivery System</title>
    <link rel="stylesheet" href="bootstrap1/boot/css/bootstrap.min.css">
    <link rel="stylesheet" href="fontawesome/css/all.min.css">
    <style>
        /* Custom CSS styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f2f2f2;
        }
        .container {
            width: 80%;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .dashboard-header {
            text-align: center;
            margin-bottom: 20px;
        }
        .section {
            background-color: #f9f9f9;
            padding: 15px;
            border-radius: 5px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
        }
        .section-header {
            font-size: 1.2rem;
            font-weight: bold;
            margin-bottom: 10px;
        }
        .section-content {
            margin-top: 10px;
        }
        .order-list {
            list-style-type: none;
            padding: 0;
        }
        .order-item {
            margin-bottom: 10px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #fff;
        }
        .order-item:nth-child(even) {
            background-color: #e9ecef;
        }
        .order-item h3 {
            margin-top: 0;
            margin-bottom: 5px;
        }
        .order-item p {
            margin: 5px 0;
        }
        .back-button {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            font-size: 1rem;
            font-weight: bold;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            text-align: center;
        }
        .back-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="dashboard-header">
            <h1>Order List</h1>
        </div>
        <div class="section">
            <div class="section-header">Your Orders</div>
            <div class="section-content">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Order Date</th>
                            <th>Delivery Date</th>
                            <th>Status</th>
                            <th>Created</th>
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
                                out.println("<tr><td colspan='7'>Error fetching customer ID: " + e.getMessage() + "</td></tr>");
                            }

                            // Fetch bookings for the customer
                            try {
                                String query = "SELECT id, order_date, delivery_date, status, created_at,message FROM orders WHERE user_id = ?"; // Use customer ID to filter bookings

                                PreparedStatement pstmt = conn.prepareStatement(query);
                                pstmt.setInt(1, customerId);
                                ResultSet resultSet = pstmt.executeQuery();
                                int i = 1;
                                while (resultSet.next()) {
                                    int id = resultSet.getInt("id");
                                    String orderDate = resultSet.getString("order_date");
                                    String deliveryDate = resultSet.getString("delivery_date");
                                    String status = resultSet.getString("status");
                                    String createdAt = resultSet.getString("created_at");
                                    String message = resultSet.getString("message");
                        %>
                        <tr>
                            <td><%= i++ %></td>
                            <td><%= orderDate %></td>
                            <td><%= deliveryDate %></td>
                          <td>
                                <span class="badge <%= (status.equals("Cancelled") ? "badge-cancelled" : status.equals("Completed") ? "badge-completed" : "badge-pending") %>">
                                    <%= status %>
                                </span>
                            </td>
                            <td><%= createdAt %></td>
                            <td><%= message %></td>
                            
                        </tr>
                        <% 
                                }
                                pstmt.close();
                            } catch (SQLException e) {
                                out.println("<tr><td colspan='7'>Error fetching bookings: " + e.getMessage() + "</td></tr>");
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="back-button-container">
            <a href="customerDashboard.jsp" class="back-button">Back to Dashboard</a>
        </div>
    </div>
</body>
</html>
