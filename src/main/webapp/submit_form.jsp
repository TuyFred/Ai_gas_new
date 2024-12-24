<%@ page import="java.sql.*" %>
<%
    // Retrieve form data from the request
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String message = request.getParameter("message");

    // Initialize the database connection and statement
    Connection conn = null;
    PreparedStatement stmt = null;

    try {
        // Load the JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish the database connection
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/home_gas_delivery", "root", "");

        // Prepare the SQL insert statement
        String sql = "INSERT INTO contact_form (name, email, message) VALUES (?, ?, ?)";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, name);
        stmt.setString(2, email);
        stmt.setString(3, message);

        // Execute the insert statement
        stmt.executeUpdate();

        // Output a success message
        out.println("<p>Message submitted successfully!</p>");
        
        // Add a button to go back to the home page
        out.println("<button onclick=\"window.location.href='index.jsp';\">Go Back to Home</button>");
    } catch (Exception e) {
        // Print the stack trace for debugging and output an error message
        e.printStackTrace();
        out.println("An error occurred while submitting your message.");
    } finally {
        // Close the statement and connection
        try {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException se) {
            se.printStackTrace();
        }
    }
%>
s