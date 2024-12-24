<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="com.MYPROJECT_AI_HOMEGAS.util.DBUtil" %>

<%
    String userId = request.getParameter("userId");
    String orderDate = request.getParameter("orderDate");
    String deliveryDate = request.getParameter("deliveryDate");
    String status = request.getParameter("status");
    String message = request.getParameter("message");

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        conn = DBUtil.getConnection();
        String sql = "INSERT INTO orders (user_id, order_date, delivery_date, status, message) VALUES (?, ?, ?, ?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, Integer.parseInt(userId));
        pstmt.setDate(2, java.sql.Date.valueOf(orderDate));
        pstmt.setDate(3, java.sql.Date.valueOf(deliveryDate));
        pstmt.setString(4, status);
        pstmt.setString(5, message);
        pstmt.executeUpdate();
        
        // Redirect to the order list page with the userId
        response.sendRedirect("orderList.jsp?userId=" + userId);
    } catch (SQLException e) {
        e.printStackTrace();
        request.setAttribute("errorMessage", "An error occurred: " + e.getMessage());
        request.getRequestDispatcher("error.jsp").forward(request, response);
    } catch (Exception e) {
        e.printStackTrace();
        request.setAttribute("errorMessage", "An unexpected error occurred: " + e.getMessage());
        request.getRequestDispatcher("error.jsp").forward(request, response);
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
