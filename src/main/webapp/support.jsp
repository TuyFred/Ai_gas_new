<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Support</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        #customers-support {
            display: none;
        }
    </style>
    <script>
        function toggleSupport() {
            var supportDiv = document.getElementById('customers-support');
            if (supportDiv.style.display === 'none') {
                supportDiv.style.display = 'block';
            } else {
                supportDiv.style.display = 'none';
            }
        }
    </script>
</head>
<body>
    <a href="javascript:void(0);" onclick="toggleSupport()"><i class="fas fa-headset"></i> Contact Support</a>
    <div id="customers-support">
        <h3>Customers & Support</h3>
        <%
            String url = "jdbc:mysql://localhost:3306/your_database";
            String user = "username";
            String password = "password";
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(url, user, password);
                stmt = conn.createStatement();
                String query = "SELECT title, content FROM support_info";
                rs = stmt.executeQuery(query);

                while (rs.next()) {
                    String title = rs.getString("title");
                    String content = rs.getString("content");
        %>
                    <h4><%= title %></h4>
                    <p><%= content %></p>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
        %>
                <p>Error retrieving support information.</p>
        <%
            } finally {
                try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                try { if (stmt != null) stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        %>
    </div>
</body>
</html>
