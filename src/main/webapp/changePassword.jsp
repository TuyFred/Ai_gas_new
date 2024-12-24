<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Change Password</title>
</head>
<body>
<%
    String username = request.getParameter("username");
    String oldPassword = request.getParameter("oldPassword");
    String newPassword = request.getParameter("newPassword");

    String url = "jdbc:mysql://localhost:3306/home_gas_delivery";
    String dbUsername = "root";
    String dbPassword = "";

    Connection connection = null;
    PreparedStatement preparedStatement = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(url, dbUsername, dbPassword);

        // Verify the old password
        String verifySql = "SELECT password FROM users WHERE username = ?";
        preparedStatement = connection.prepareStatement(verifySql);
        preparedStatement.setString(1, username);
        ResultSet resultSet = preparedStatement.executeQuery();
        
        if (resultSet.next()) {
            String DbPassword = resultSet.getString("password");
            if (oldPassword.equals(dbPassword)) {
                // Update to new password
                String updateSql = "UPDATE users SET password = ? WHERE username = ?";
                preparedStatement = connection.prepareStatement(updateSql);
                preparedStatement.setString(1, newPassword); // Make sure to hash the password in real applications
                preparedStatement.setString(2, username);
                preparedStatement.executeUpdate();
                out.println("Password changed successfully!");
            } else {
                out.println("Old password is incorrect.");
            }
        } else {
            out.println("User not found.");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("Error changing password: " + e.getMessage());
    } finally {
        if (preparedStatement != null) preparedStatement.close();
        if (connection != null) connection.close();
    }
%>
</body>
</html>


