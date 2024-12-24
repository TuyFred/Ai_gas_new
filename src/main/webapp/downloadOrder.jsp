<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*" %>
<%
    String url = "jdbc:mysql://localhost:3306/home_gas_delivery";
    String username = "root";
    String password = "";
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    int id = Integer.parseInt(request.getParameter("id"));
    String fileName = "order_" + id + ".txt";
    FileWriter fileWriter = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(url, username, password);

        String query = "SELECT * FROM orders WHERE id = ?";
        preparedStatement = connection.prepareStatement(query);
        preparedStatement.setInt(1, id);
        resultSet = preparedStatement.executeQuery();

        if (resultSet.next()) {
            String userId = resultSet.getString("user_id");
            String orderDate = resultSet.getString("order_date");
            String deliveryDate = resultSet.getString("delivery_date");
            String status = resultSet.getString("status");

            fileWriter = new FileWriter(new File(fileName));
            fileWriter.write("Order ID: " + id + "\n");
            fileWriter.write("User ID: " + userId + "\n");
            fileWriter.write("Order Date: " + orderDate + "\n");
            fileWriter.write("Delivery Date: " + deliveryDate + "\n");
            fileWriter.write("Status: " + status + "\n");
            fileWriter.flush();
        }

        response.setContentType("application/octet-stream");
        response.setHeader("Content-Disposition", "attachment;filename=" + fileName);

        FileInputStream fileInputStream = new FileInputStream(fileName);
        OutputStream outputStream = response.getOutputStream();
        byte[] buffer = new byte[4096];
        int bytesRead = -1;

        while ((bytesRead = fileInputStream.read(buffer)) != -1) {
            outputStream.write(buffer, 0, bytesRead);
        }

        fileInputStream.close();
        outputStream.close();

        // Delete the temporary file
        new File(fileName).delete();
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (resultSet != null) resultSet.close();
        if (preparedStatement != null) preparedStatement.close();
        if (connection != null) connection.close();
    }
%>



