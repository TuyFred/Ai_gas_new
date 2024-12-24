<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String userId = request.getParameter("id");
    String message = "";

    if (userId != null) {
        try {
            // Database connection
            String jdbcURL = "jdbc:mysql://localhost:3306/home_gas_delivery";
            String dbUser = "root";
            String dbPassword = "";

            Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
            String sql = "DELETE FROM users WHERE user_id=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, Integer.parseInt(userId));

            int rows = statement.executeUpdate();
            if (rows > 0) {
                message = "User has been deleted successfully.";
                response.sendRedirect("admindashboard.jsp"); // Redirect to the admin dashboard
            } else {
                message = "User not found.";
            }

            statement.close();
            connection.close();
        } catch (Exception e) {
            message = "Error occurred: " + e.getMessage();
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete User - Home Gas Delivery System</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: url('images/backgood.jpg') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            width: 100%;
            max-width: 400px;
            padding: 15px;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            margin-bottom: 15px;
            font-size: 1.5rem;
        }
        .form-group {
            margin-bottom: 10px;
        }
        .form-group i {
            position: absolute;
            left: 10px;
            top: 32px;
            color: #aaa;
        }
        .form-control {
            padding-left: 35px;
            padding-top: 5px;
            padding-bottom: 5px;
        }
        .message {
            color: green;
            font-size: 14px;
            margin-top: 5px;
            text-align: center;
        }
        .error-msg {
            color: red;
            font-size: 14px;
            margin-top: 5px;
            text-align: center;
        }
        label {
            margin-bottom: 2px;
        }
        button {
            padding: 7px 0;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Delete User</h2>
        <form action="deleteUser.jsp" method="get">
            <div class="form-group position-relative">
                <label for="userId">User ID:</label>
                <i class="fas fa-user-minus"></i>
                <input type="text" id="userId" name="userId" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-danger btn-block">Delete User</button>
        </form>
        <div class="<%= message.startsWith("Error") ? "error-msg" : "message" %>">
            <%= message %>
        </div>
    </div>
    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
