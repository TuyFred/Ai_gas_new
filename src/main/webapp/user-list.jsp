<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User List - Home Gas Delivery System</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-4">
        <h1>User Management</h1>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Username</th>
                    <th>Full Name</th>
                    <th>Address</th>
                    <th>Phone</th>
                    <th>Email</th>
                    <th>Created At</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Connection conn = null;
                    Statement stmt = null;
                    ResultSet rs = null;

                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/home_gas_delivery", "root", "");
                        stmt = conn.createStatement();
                        String query = "SELECT * FROM users";
                        rs = stmt.executeQuery(query);

                        while (rs.next()) {
                            int id = rs.getInt("id");
                            String username = rs.getString("username");
                            String fullname = rs.getString("fullname");
                            String address = rs.getString("address");
                            String phone = rs.getString("phone");
                            String email = rs.getString("email");
                            Timestamp createdAt = rs.getTimestamp("created_at");
                %>
                <tr>
                    <td><%= id %></td>
                    <td><%= username %></td>
                    <td><%= fullname %></td>
                    <td><%= address %></td>
                    <td><%= phone %></td>
                    <td><%= email %></td>
                    <td><%= createdAt %></td>
                    <td>
                        <a href="update-user.jsp?id=<%= id %>" class="btn btn-warning btn-sm">Edit</a>
                        <a href="delete-process.jsp?id=<%= id %>" class="btn btn-danger btn-sm">Delete</a>
                    </td>
                </tr>
                <%
                        }
                    } catch (Exception e) {
                        out.println("<tr><td colspan='8'>An error occurred: " + e.getMessage() + "</td></tr>");
                        e.printStackTrace();
                    } finally {
                        if (rs != null) {
                            try {
                                rs.close();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        }
                        if (stmt != null) {
                            try {
                                stmt.close();
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
   

   
   
   