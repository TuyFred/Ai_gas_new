package com.MYPROJECT_AI_HOMEGAS;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String fullname = request.getParameter("fullname");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");

        Connection conn = null;
        PreparedStatement pst = null;

        try {
            // Load the MySQL driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Connect to the database (adjust URL, username, and password as per your setup)
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gas_delivery", "root", "");

            // Create the SQL query
            String sql = "INSERT INTO users (username, password, fullname, address, phone, email) VALUES (?, ?, ?, ?, ?, ?)";

            // Prepare the statement
            pst = conn.prepareStatement(sql);
            pst.setString(1, username);
            pst.setString(2, password);
            pst.setString(3, fullname);
            pst.setString(4, address);
            pst.setString(5, phone);
            pst.setString(6, email);

            // Execute the statement
            int rows = pst.executeUpdate();

            if (rows > 0) {
                // Registration successful, redirect to login page
                response.sendRedirect("login.jsp");
            } else {
                // Registration failed, redirect back to the registration form with an error message
                response.sendRedirect("register.html?error=Registration+failed");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            // Handle exceptions, redirect to an error page or back to the registration form with an error message
            response.sendRedirect("register.html?error=An+error+occurred");
        } finally {
            try {
                if (pst != null) pst.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}


