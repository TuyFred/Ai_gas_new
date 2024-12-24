<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>

<%
    String query = request.getParameter("query");
    String url = "jdbc:mysql://localhost:3306/home_gas_delivery";
    String username = "root";
    String password = "";
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(url, username, password);
        statement = connection.createStatement();
        String sqlQuery = "SELECT * FROM users WHERE username LIKE '%" + query + "%' OR fullname LIKE '%" + query + "%' OR email LIKE '%" + query + "%'";
        resultSet = statement.executeQuery(sqlQuery);

        while (resultSet.next()) {
            int id = resultSet.getInt("id");
            String userName = resultSet.getString("username");
            String fullName = resultSet.getString("fullname");
            String address = resultSet.getString("address");
            String phone = resultSet.getString("phone");
            String email = resultSet.getString("email");
            Timestamp createdAt = resultSet.getTimestamp("created_at");
%>
<tr>
    <td><%= id %></td>
    <td><%= userName %></td>
    <td><%= fullName %></td>
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
        e.printStackTrace();
    } finally {
        if (resultSet != null) resultSet.close();
        if (statement != null) statement.close();
        if (connection != null) connection.close();
    }
%>
