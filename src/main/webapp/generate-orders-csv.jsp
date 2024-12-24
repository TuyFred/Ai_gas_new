<%@ page language="java" contentType="application/pdf; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*, com.itextpdf.text.*, com.itextpdf.text.pdf.*" %>
<%
    String url = "jdbc:mysql://localhost:3306/home_gas_delivery";
    String username = "root";
    String password = "";
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;

    response.setContentType("application/pdf");
    response.setHeader("Content-Disposition", "attachment;filename=orders.pdf");

    Document document = new Document();
    PdfWriter.getInstance(document, response.getOutputStream());
    document.open();

    Font titleFont = new Font(Font.FontFamily.HELVETICA, 18, Font.BOLD);
    Font headerFont = new Font(Font.FontFamily.HELVETICA, 12, Font.BOLD);
    Font bodyFont = new Font(Font.FontFamily.HELVETICA, 12, Font.NORMAL);

    Paragraph title = new Paragraph("Order List", titleFont);
    title.setAlignment(Element.ALIGN_CENTER);
    document.add(title);
    document.add(new Paragraph(" ")); // Add an empty line

    PdfPTable table = new PdfPTable(5); // 5 columns
    table.setWidthPercentage(100);
    table.setSpacingBefore(10f);
    table.setSpacingAfter(10f);

    float[] columnWidths = {1f, 2f, 2f, 2f, 2f};
    table.setWidths(columnWidths);

    // Adding Table Headers
    PdfPCell cell1 = new PdfPCell(new Paragraph("Order ID", headerFont));
    PdfPCell cell2 = new PdfPCell(new Paragraph("User ID", headerFont));
    PdfPCell cell3 = new PdfPCell(new Paragraph("Order Date", headerFont));
    PdfPCell cell4 = new PdfPCell(new Paragraph("Delivery Date", headerFont));
    PdfPCell cell5 = new PdfPCell(new Paragraph("Status", headerFont));

    table.addCell(cell1);
    table.addCell(cell2);
    table.addCell(cell3);
    table.addCell(cell4);
    table.addCell(cell5);

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(url, username, password);
        statement = connection.createStatement();
        String query = "SELECT * FROM orders";
        resultSet = statement.executeQuery(query);

        while (resultSet.next()) {
            int id = resultSet.getInt("id");
            String userId = resultSet.getString("user_id");
            String orderDate = resultSet.getString("order_date");
            String deliveryDate = resultSet.getString("delivery_date");
            String status = resultSet.getString("status");

            table.addCell(new PdfPCell(new Paragraph(String.valueOf(id), bodyFont)));
            table.addCell(new PdfPCell(new Paragraph(userId, bodyFont)));
            table.addCell(new PdfPCell(new Paragraph(orderDate, bodyFont)));
            table.addCell(new PdfPCell(new Paragraph(deliveryDate, bodyFont)));
            table.addCell(new PdfPCell(new Paragraph(status, bodyFont)));
        }

        document.add(table);

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (resultSet != null) resultSet.close();
        if (statement != null) statement.close();
        if (connection != null) connection.close();
        document.close(); // Close the PDF document
    }
%>
