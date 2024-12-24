<%@ page import="java.io.*, javax.servlet.*, javax.servlet.http.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New User</title>
    <link rel="stylesheet" href="path/to/bootstrap.min.css">
</head>
<body>
    <h4>Add New User</h4>
    <%
        // Retrieve form parameters
        String username = request.getParameter("username");
        String fullname = request.getParameter("fullname");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
         String password = request.getParameter("password");

        // Database connection details
        String dbURL = "jdbc:mysql://localhost:3306/home_gas_delivery";
        String dbUser = "root";
        String dbPassword = "";

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Load the database driver (optional depending on your setup)
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish the database connection
            conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

            // SQL query to insert user data
            String sql = "INSERT INTO users (username, fullname, address, phone, email, password, role) VALUES (?, ?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.setString(2, fullname);
            pstmt.setString(3, address);
            pstmt.setString(4, phone);
            pstmt.setString(5, email);
            pstmt.setString(6, password);
            pstmt.setString(7, "admin"); // Setting the role as 'admin'

            // Execute the query
            int row = pstmt.executeUpdate();

            if (row > 0) {
                out.println("<p>User added successfully!</p>");
            } else {
                out.println("<p>Error adding user.</p>");
            }

        } catch (Exception e) {
            out.println("<p>Error: " + e.getMessage() + "</p>");
        } finally {
            // Close resources
            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    %>
    <a href="admindashboard.jsp">Back to Form</a>
</body>
</html>
