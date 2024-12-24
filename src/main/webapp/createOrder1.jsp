<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="com.MYPROJECT_AI_HOMEGAS.util.DBUtil" %>

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

    // Fetch user_id based on username
    String username = (String) session.getAttribute("username");
    String userId = null;

    try {
        Connection conn = DBUtil.getConnection();
        String sql = "SELECT user_id FROM users WHERE username = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, username);
        ResultSet rs = pstmt.executeQuery();

        if (rs.next()) {
            userId = rs.getString("user_id");
        }

        rs.close();
        pstmt.close();
        conn.close();
    } catch (SQLException e) {
        e.printStackTrace();
        out.println("Error: Unable to fetch user ID for username " + username);
        return; // Stop further processing if there's an error
    }

    if (userId == null) {
        out.println("Error: No user found for username " + username);
        return; // Stop further processing if user ID is not found
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <link rel="stylesheet" href="bootstrap1/boot/css/bootstrap.min.css">
    <link rel="stylesheet" href="fontawesome/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('images/backgood.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center center;
            font-size: 16px;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            width: 100%;
            max-width: 400px;
            margin: auto;
        }
        .form-container {
            background-color: #fff;
            padding: 15px;
            border-radius: 5px;
            box-shadow: 0 0 8px rgba(0, 0, 0, 0.1);
            margin-top: 50px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            font-size: 0.85rem;
        }
        .form-control {
            font-size: 0.85rem;
        }
        .btn {
            font-size: 0.85rem;
        }
        h2 {
            font-size: 1.25rem;
            margin-bottom: 20px;
            text-align: center;
        }
        .back-button {
            display: inline-block;
            margin-top: 15px;
            padding: 8px 15px;
            font-size: 0.85rem;
            font-weight: bold;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            text-align: center;
            display: block;
            text-align: center;
        }
        .back-button:hover {
            background-color: #0056b3;
        }
    </style>  <!-- Rest of your HTML and CSS code -->
</head>
<body>
    <div class="container">
        <div class="form-container">
            <h2>Create Order</h2>
            <form action="createorderProcess1.jsp" method="post">
                <input type="hidden" name="userId" value="<%= userId %>">
                <div class="form-group">
                    <label for="orderDate">Order Date</label>
                    <input type="date" class="form-control" id="orderDate" name="orderDate" required>
                </div>
                <div class="form-group">
                    <label for="deliveryDate">Delivery Date</label>
                    <input type="date" class="form-control" id="deliveryDate" name="deliveryDate" required>
                </div>
               
             
                <!-- Hidden Message Field -->
                <input type="hidden" name="message" value="">
                <button type="submit" class="btn btn-primary btn-block"><i class="fas fa-save"></i> Create Order</button>
            </form>
            <a href="customerDashboard.jsp" class="back-button">Go Back to Dashboard</a>
        </div>
    </div>
</body>
</html>
