<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update User - Home Gas Delivery System</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <style>
        body {
            font-size: 0.9rem;
        }
        .container {
            max-width: 600px;
        }
        .form-group label {
            font-weight: bold;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #004085;
        }
    </style>
</head>
<body>
    <div class="container mt-4">
        <h2 class="mb-4"><i class="fas fa-user-edit"></i> Update User</h2>
        <%
            String id = request.getParameter("id");
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/home_gas_delivery", "root", "");
                String sql = "SELECT * FROM users WHERE user_id = ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, id);
                rs = pstmt.executeQuery();

                if (rs.next()) {
                    String username = rs.getString("username");
                    String fullname = rs.getString("fullname");
                    String address = rs.getString("address");
                    String phone = rs.getString("phone");
                    String email = rs.getString("email");
        %>
        <form action="update-process.jsp" method="post">
            <input type="hidden" name="id" value="<%= id %>">
            <div class="form-group">
                <label for="username"><i class="fas fa-user"></i> Username:</label>
                <input type="text" id="username" name="username" class="form-control" value="<%= username %>" required>
            </div>
            <div class="form-group">
                <label for="fullname"><i class="fas fa-user-tag"></i> Full Name:</label>
                <input type="text" id="fullname" name="fullname" class="form-control" value="<%= fullname %>" required>
            </div>
            <div class="form-group">
                <label for="address"><i class="fas fa-map-marker-alt"></i> Address:</label>
                <input type="text" id="address" name="address" class="form-control" value="<%= address %>" required>
            </div>
            <div class="form-group">
                <label for="phone"><i class="fas fa-phone"></i> Phone Number:</label>
                <input type="text" id="phone" name="phone" class="form-control" value="<%= phone %>" required>
            </div>
            <div class="form-group">
                <label for="email"><i class="fas fa-envelope"></i> Email:</label>
                <input type="email" id="email" name="email" class="form-control" value="<%= email %>" required>
            </div>
            <button type="submit" class="btn btn-primary btn-block"><i class="fas fa-save"></i> Update</button>
        </form>
        <%
                } else {
                    out.println("<div class='alert alert-danger mt-4'>User not found.</div>");
                }
            } catch (Exception e) {
                out.println("<div class='alert alert-danger mt-4'>An error occurred: " + e.getMessage() + "</div>");
                e.printStackTrace();
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
    </div>
    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
