<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>

<%
    // Get the user ID from the request
    String userId = request.getParameter("user_id");

    // Database connection setup
    String url = "jdbc:mysql://localhost:3306/home_gas_delivery";  // Replace with your actual database URL
    String username = "root";  // Replace with your actual database username
    String password = "";  // Replace with your actual database password

    Connection connection = null;
    PreparedStatement preparedStatement = null;

    try {
        // Establish connection
        connection = DriverManager.getConnection(url, username, password);

        // Begin transaction
        connection.setAutoCommit(false);

        // Delete dependent records first
        String deleteOrdersQuery = "DELETE FROM orders WHERE user_id = ?";
        preparedStatement = connection.prepareStatement(deleteOrdersQuery);
        preparedStatement.setInt(1, Integer.parseInt(userId));
        preparedStatement.executeUpdate();

        // Now delete the user
        String deleteUserQuery = "DELETE FROM users WHERE user_id = ?";
        preparedStatement = connection.prepareStatement(deleteUserQuery);
        preparedStatement.setInt(1, Integer.parseInt(userId));
        int rowsAffected = preparedStatement.executeUpdate();

        if (rowsAffected > 0) {
            // Commit transaction
            connection.commit();
            response.sendRedirect("admindashboard.jsp?message=User Deleted Successfully");
        } else {
            // Rollback transaction
            connection.rollback();
            response.sendRedirect("admindashboard.jsp?message=User Deletion Failed");
        }

    } catch (Exception e) {
        e.printStackTrace();
        // Rollback transaction on error
        if (connection != null) {
            try {
                connection.rollback();
            } catch (SQLException rollbackEx) {
                rollbackEx.printStackTrace();
            }
        }
        // Redirect with an error message
        response.sendRedirect("admindashboard.jsp?message=Error occurred during deletion: " + e.getMessage());
    } finally {
        // Close the resources
        if (preparedStatement != null) preparedStatement.close();
        if (connection != null) connection.close();
    }
%>
