<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Order</title>
    <link rel="stylesheet" href="bootstrap1/boot/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h2>Edit Order</h2>
        <%
            String url = "jdbc:mysql://localhost:3306/home_gas_delivery";
            String username = "root";
            String password = "";
            Connection connection = null;
            PreparedStatement preparedStatement = null;
            ResultSet resultSet = null;

            int id = Integer.parseInt(request.getParameter("id"));
            String userId = "";
            String orderDate = "";
            String deliveryDate = "";
            String status = "";

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                connection = DriverManager.getConnection(url, username, password);
                
                String query = "SELECT * FROM orders WHERE id = ?";
                preparedStatement = connection.prepareStatement(query);
                preparedStatement.setInt(1, id);
                resultSet = preparedStatement.executeQuery();

                if (resultSet.next()) {
                    userId = resultSet.getString("user_id");
                    orderDate = resultSet.getString("order_date");
                    deliveryDate = resultSet.getString("delivery_date");
                    status = resultSet.getString("status");
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (resultSet != null) resultSet.close();
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            }
        %>
        <form action="updateOrder.jsp" method="post">
            <input type="hidden" name="id" value="<%= id %>">
            <div class="form-group">
                <label for="userId">User ID</label>
                <input type="text" class="form-control" name="userId" value="<%= userId %>" required>
            </div>
            <div class="form-group">
                <label for="orderDate">Order Date</label>
                <input type="date" class="form-control" name="orderDate" value="<%= orderDate %>" required>
            </div>
            <div class="form-group">
                <label for="deliveryDate">Delivery Date</label>
                <input type="date" class="form-control" name="deliveryDate" value="<%= deliveryDate %>" required>
            </div>
            <div class="form-group">
                <label for="status">Status</label>
                <select class="form-control" name="status" required>
                    <option value="Pending" <%= status.equals("Pending") ? "selected" : "" %>>Pending</option>
                    <option value="Approved" <%= status.equals("Approved") ? "selected" : "" %>>Approved</option>
                    <option value="Cancelled" <%= status.equals("Cancelled") ? "selected" : "" %>>Cancelled</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Update Order</button>
        </form>
    </div>
</body>
</html>
