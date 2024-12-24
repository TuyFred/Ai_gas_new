<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*, javax.servlet.*, javax.servlet.http.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add User</title>
</head>
<body>
<%
    String username = request.getParameter("username");
    String fullname = request.getParameter("fullname");
    String address = request.getParameter("address");
    String phone = request.getParameter("phone");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String role = request.getParameter("role");

    Part filePart = request.getPart("photo"); // Retrieves the file part
    String fileName = filePart.getSubmittedFileName();
    
    String uploadPath = getServletContext().getRealPath("") + "uploads" + File.separator + fileName;
    File fileUpload = new File(uploadPath);
    filePart.write(uploadPath);

    String url = "jdbc:mysql://localhost:3306/home_gas_delivery";
    String dbUsername = "root";
    String dbPassword = "";

    Connection connection = null;
    PreparedStatement preparedStatement = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(url, dbUsername, dbPassword);

        String sql = "INSERT INTO users (username, fullname, address, phone, email, password, role, photo) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, username);
        preparedStatement.setString(2, fullname);
        preparedStatement.setString(3, address);
        preparedStatement.setString(4, phone);
        preparedStatement.setString(5, email);
        preparedStatement.setString(6, password); // Make sure to hash the password in real applications
        preparedStatement.setString(7, role);
        preparedStatement.setString(8, fileName);
        preparedStatement.executeUpdate();

        out.println("User added successfully!");
    } catch (Exception e) {
        e.printStackTrace();
        out.println("Error adding user: " + e.getMessage());
    } finally {
        if (preparedStatement != null) preparedStatement.close();
        if (connection != null) connection.close();
    }
%>
</body>
</html>
