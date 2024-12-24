<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.servlet.http.HttpSession" %>

<%
    // Check if the session exists and if the username attribute is set
   
    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Retrieve the username from the session
    String username = (String) session.getAttribute("username");

    // Retrieve form parameters
    String currentPassword = request.getParameter("currentPassword");
    String newUsername = request.getParameter("username");
    String newPassword = request.getParameter("newPassword");
    String confirmPassword = request.getParameter("confirmPassword");
    String message = "";

    // Check if all parameters are provided
    if (currentPassword != null && newUsername != null && newPassword != null && confirmPassword != null) {
        // Check if the new password and confirm password match
        if (!newPassword.equals(confirmPassword)) {
            message = "New password and confirm password do not match.";
        } else {
            Connection conn = null;
            PreparedStatement checkPstmt = null;
            PreparedStatement updatePstmt = null;
            ResultSet checkRs = null;
            PreparedStatement idPstmt = null;
            ResultSet idRs = null;

            try {
                // Initialize database connection
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/home_gas_delivery", "root", "");

                // Fetch user ID from the database based on username
                String idQuery = "SELECT id FROM users WHERE username = ?";
                idPstmt = conn.prepareStatement(idQuery);
                idPstmt.setString(1, username);
                idRs = idPstmt.executeQuery();

                int id = -1; // Default invalid id
                if (idRs.next()) {
                    id = idRs.getInt("id");
                } else {
                    message = "User not found.";
                }

                // Check if the current password is correct
                if (id != -1) {
                    String checkQuery = "SELECT * FROM users WHERE id = ? AND password = ?";
                    checkPstmt = conn.prepareStatement(checkQuery);
                    checkPstmt.setInt(1, id);
                    checkPstmt.setString(2, currentPassword);
                    checkRs = checkPstmt.executeQuery();

                    if (checkRs.next()) {
                        // Update the username and password
                        String updateQuery = "UPDATE users SET username = ?, password = ? WHERE id = ?";
                        updatePstmt = conn.prepareStatement(updateQuery);
                        updatePstmt.setString(1, newUsername);
                        updatePstmt.setString(2, newPassword);
                        updatePstmt.setInt(3, id);
                        int updatedRows = updatePstmt.executeUpdate();

                        if (updatedRows > 0) {
                            message = "Credentials updated successfully!";
                        } else {
                            message = "Error updating credentials.";
                        }
                    } else {
                        message = "Current password is incorrect.";
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
                message = "Error: " + e.getMessage();
            } finally {
                // Close the ResultSet and PreparedStatement
                if (idRs != null) {
                    try { idRs.close(); } catch (SQLException e) { e.printStackTrace(); }
                }
                if (idPstmt != null) {
                    try { idPstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                }
                if (checkRs != null) {
                    try { checkRs.close(); } catch (SQLException e) { e.printStackTrace(); }
                }
                if (checkPstmt != null) {
                    try { checkPstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                }
                if (updatePstmt != null) {
                    try { updatePstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                }
                if (conn != null) {
                    try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                }
            }
        }
    } else {
        message = "Please fill in all fields.";
    }

    // Set the message attribute and forward to the dashboard page
    request.setAttribute("message", message);
    request.getRequestDispatcher("admindashboard.jsp").forward(request, response);
%>
