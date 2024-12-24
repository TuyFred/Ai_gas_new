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
    <style>
        .container {
            max-width: 600px;
        }
        .error-msg, .success-msg {
            margin-top: 20px;
            padding: 10px;
            border: 1px solid transparent;
            border-radius: 4px;
        }
        .error-msg {
            color: #721c24;
            background-color: #f8d7da;
            border-color: #f5c6cb;
        }
        .success-msg {
            color: #155724;
            background-color: #d4edda;
            border-color: #c3e6cb;
        }
    </style>
</head>
<body>
    <div class="container mt-4">
        <h2>Update User</h2>
        <%
            String id = request.getParameter("id");
            String username = request.getParameter("username");
            String fullname = request.getParameter("fullname");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");

            Connection conn = null;
            PreparedStatement pstmt = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/home_gas_delivery", "root", "");

                String sql = "UPDATE users SET username = ?, fullname = ?, address = ?, phone = ?, email = ? WHERE user_id = ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, username);
                pstmt.setString(2, fullname);
                pstmt.setString(3, address);
                pstmt.setString(4, phone);
                pstmt.setString(5, email);
                pstmt.setString(6, id);

                int rows = pstmt.executeUpdate();

                if (rows > 0) {
                    out.println("<div class='success-msg'>User updated successfully.</div>");
                    // Optional: Redirect after a delay
                    response.setHeader("Refresh", "2; URL=admindashboard.jsp");
                } else {
                    out.println("<div class='error-msg'>Update failed. Please try again.</div>");
                }
            } catch (Exception e) {
                out.println("<div class='error-msg'>An error occurred: " + e.getMessage() + "</div>");
                e.printStackTrace();
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
        %>
    </div>
    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
