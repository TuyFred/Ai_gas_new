<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String url = "jdbc:mysql://localhost:3306/home_gas_delivery";
    String username = "root";
    String password = "";
    Connection connection = null;
    PreparedStatement preparedStatement = null;

    int id = Integer.parseInt(request.getParameter("id"));

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(url, username, password);

        String deleteQuery = "DELETE FROM orders WHERE id = ?";
        preparedStatement = connection.prepareStatement(deleteQuery);
        preparedStatement.setInt(1, id);
        preparedStatement.executeUpdate();

        response.sendRedirect("admindashboard.jsp");
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (preparedStatement != null) preparedStatement.close();
        if (connection != null) connection.close();
    }
%>
