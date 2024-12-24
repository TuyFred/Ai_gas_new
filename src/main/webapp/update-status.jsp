<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Order Status</title>
    <link rel="stylesheet" href="bootstrap1/boot/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 50px;
        }
        .alert {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <%
            String url = "jdbc:mysql://localhost:3306/home_gas_delivery";
            String username = "root";
            String password = "";
            Connection connection = null;
            PreparedStatement preparedStatement = null;

            String orderId = request.getParameter("orderId");
            String status = request.getParameter("status");

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                connection = DriverManager.getConnection(url, username, password);

                String updateQuery = "UPDATE orders SET status = ? WHERE id = ?";
                preparedStatement = connection.prepareStatement(updateQuery);
                preparedStatement.setString(1, status);
                preparedStatement.setInt(2, Integer.parseInt(orderId));

                int rowsAffected = preparedStatement.executeUpdate();

                if (rowsAffected > 0) {
        %>
        <div class="alert alert-success" role="alert">
            Order status updated successfully!
        </div>
        <%
                } else {
        %>
        <div class="alert alert-danger" role="alert">
            Failed to update order status. Please try again.
        </div>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
        %>
        <div class="alert alert-danger" role="alert">
            An error occurred: <%= e.getMessage() %>
        </div>
        <%
            } finally {
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            }
        %>
        <a href="admindashboard.jsp" class="btn btn-primary">Back to Dashboard</a>
    </div>
</body>
</html>
