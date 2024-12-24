<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String url = "jdbc:mysql://localhost:3306/home_gas_delivery";
    String username = "root";
    String password = "";
    Connection connection = null;
    PreparedStatement preparedStatement = null;

    int id = Integer.parseInt(request.getParameter("id"));
    String status = request.getParameter("status");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(url, username, password);

        String updateQuery = "UPDATE orders SET status = ? WHERE id = ?";
        preparedStatement = connection.prepareStatement(updateQuery);
        preparedStatement.setString(1, status);
        preparedStatement.setInt(2, id);
        preparedStatement.executeUpdate();

        response.sendRedirect("admindashboard.jsp");
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (preparedStatement != null) preparedStatement.close();
        if (connection != null) connection.close();
    }
%>
