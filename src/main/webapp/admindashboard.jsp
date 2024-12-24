<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*" %>
<%@ include file="conn.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="bootstrap1/boot/css/bootstrap.min.css">
    <link rel="stylesheet" href="fontawesome/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }
        #settings {
            display: block; /* Change to block to display by default, or use JavaScript to toggle */
            padding: 20px;
        }
        .container {
            margin-top: 20px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-control {
            font-size: 14px;
            padding: 10px;
        }
        .btn-primary {
            font-size: 14px;
            padding: 10px 15px;
        }
        @media (max-width: 768px) {
            .form-control {
                font-size: 12px;
            }
            .btn-primary {
                font-size: 12px;
            }
        }
        .sidebar {
            height: 100vh;
            width: 250px;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #343a40;
            padding-top: 20px;
        }
        .sidebar a {
            padding: 15px;
            text-align: left;
            font-size: 14px;
            color: #ddd;
            display: block;
            text-decoration: none;
        }
        .sidebar a:hover {
            color: #fff;
            background-color: #495057;
        }
        .content {
            margin-left: 250px;
            padding: 20px;
        }
        .card {
            margin-top: 20px;
        }
        .table-responsive {
            margin-top: 20px;
        }
        .form-control, .btn {
            border-radius: 0;
        }
        .btn-search {
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
        }
        .btn-search:hover {
            background-color: #0056b3;
        }
        a {
            text-decoration: none;
        }
    </style>
</head>
<body>
    <%
        if (session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp");
            return;
        }
    %>
    <div class="sidebar">
        <a href="#dashboard" onclick="showSection('dashboard')"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
        <a href="#user-management" onclick="showSection('user-management')"><i class="fas fa-users"></i> User Management</a>
        <a href="#order-management" onclick="showSection('order-management')"><i class="fas fa-box"></i> Order Management</a>
        <a href="#analytics" onclick="showSection('analytics')"><i class="fas fa-chart-line"></i> Analytics</a>
        
        
        <a href="#customers-support" onclick="showSection('customers-support')"><i class="fas fa-headset"></i> Customers & Support</a>
        
        <a href="#settings" onclick="showSection('settings')"><i class="fas fa-cog"></i> Settings</a>
        <a href="logout.jsp" onclick="showSection('logout')"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>

    <div class="content">
        <%
            String url = "jdbc:mysql://localhost:3306/home_gas_delivery";
            String username = "root";
            String password = "";
            Connection connection = null;
            Statement statement = null;
            ResultSet resultSet = null;

            int totalUsers = 0;
            int totalOrders = 0;
            int pendingDeliveries = 0;
            int cancelledOrders = 0;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                connection = DriverManager.getConnection(url, username, password);
                statement = connection.createStatement();

                // Fetch total users
                resultSet = statement.executeQuery("SELECT COUNT(*) AS totalUsers FROM users");
                if (resultSet.next()) {
                    totalUsers = resultSet.getInt("totalUsers");
                }

                // Fetch total orders
                resultSet = statement.executeQuery("SELECT COUNT(*) AS totalOrders FROM orders");
                if (resultSet.next()) {
                    totalOrders = resultSet.getInt("totalOrders");
                }

                // Fetch pending deliveries
                resultSet = statement.executeQuery("SELECT COUNT(*) AS pendingDeliveries FROM orders WHERE status = 'Pending'");
                if (resultSet.next()) {
                    pendingDeliveries = resultSet.getInt("pendingDeliveries");
                }

                // Fetch cancelled orders
                resultSet = statement.executeQuery("SELECT COUNT(*) AS cancelledOrders FROM orders WHERE status = 'Cancelled'");
                if (resultSet.next()) {
                    cancelledOrders = resultSet.getInt("cancelledOrders");
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (resultSet != null) resultSet.close();
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            }
        %>

        <div id="dashboard">
            <h2>Admin Dashboard</h2>
            <div class="row">
                <div class="col-lg-3 col-md-6">
                    <div class="card bg-primary text-white">
                        <div class="card-body">
                            <div class="card-title">Total Users</div>
                            <h3><%= totalUsers %></h3>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="card bg-success text-white">
                        <div class="card-body">
                            <div class="card-title">Total Orders</div>
                            <h3><%= totalOrders %></h3>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="card bg-warning text-white">
                        <div class="card-body">
                            <div class="card-title">Pending Deliveries</div>
                            <h3><%= pendingDeliveries %></h3>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="card bg-danger text-white">
                        <div class="card-body">
                            <div class="card-title">Cancelled Orders</div>
                            <h3><%= cancelledOrders %></h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>

 <div id="order-management" style="display:none;">
            <h3>Order Management</h3>
            <div class="d-flex mb-3">
                <input type="text" id="searchOrderInput" placeholder="Search orders..." class="form-control mr-2">
                <button id="searchOrderButton" class="btn btn-search">Search</button>
                <form action="generate-orders-csv.jsp" method="post" class="ml-2">
                    <button type="submit" class="btn btn-success">Export CSV</button>
                </form>
            </div>
            <div class="table-responsive">
                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>User ID</th>
                            <th>Order Date</th>
                            <th>Delivery Date</th>
                            <th>Status</th>
                            <th>Created At</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody id="orderTableBody">
                        <%
                            try {
                                connection = DriverManager.getConnection(url, username, password);
                                statement = connection.createStatement();
                                String query = "SELECT * FROM orders";
                                resultSet = statement.executeQuery(query);
                                
                                while (resultSet.next()) {
                                    int id = resultSet.getInt("id");
                                    int userId = resultSet.getInt("user_id");
                                    String orderDate = resultSet.getString("order_date");
                                    String deliveryDate = resultSet.getString("delivery_date");
                                    String status = resultSet.getString("status");
                                    String createdAt = resultSet.getString("created_at");
                        %>
                        <tr>
                            <td><%= id %></td>
                            <td><%= userId %></td>
                            <td><%= orderDate %></td>
                            <td><%= deliveryDate %></td>
                            <td><%= status %></td>
                            <td><%= createdAt %></td>
                            <td>
                              
                                <a href="editOrder.jsp?id=<%= id %>&status=Cancelled" class="btn btn-primary btn-sm">edit</a>                              
                                <a href="deleteOrder.jsp?id=<%= id %>" class="btn btn-danger btn-sm">Delete</a>
                                <a href="update_booking.jsp?id=<%= id %>&status=Delivered" class="btn btn-success btn-sm">Approve</a>
                                <a href="update_booking.jsp?id=<%= id %>&status=Cancelled" class="btn btn-warning btn-sm">Cancel</a>
                                <a href="message.jsp?id=<%= id %>&status=Cancelled" class="btn btn-warning btn-sm">Message</a>
                               
                                
                            </td>
                        </tr>
                        <%
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                            } finally {
                                if (resultSet != null) resultSet.close();
                                if (statement != null) statement.close();
                                if (connection != null) connection.close();
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>


        <div id="analytics" style="display:none;">
            <h3>Analytics</h3>
            <div class="card">
                <div class="card-body">
                    <canvas id="myChart"></canvas>
                </div>
            </div>
            <script>
                var ctx = document.getElementById('myChart').getContext('2d');
                var myChart = new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: ['Total Users', 'Total Orders', 'Pending Deliveries', 'Cancelled Orders'],
                        datasets: [{
                            label: 'Counts',
                            data: [<%= totalUsers %>, <%= totalOrders %>, <%= pendingDeliveries %>, <%= cancelledOrders %>],
                            backgroundColor: [
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(75, 192, 192, 0.2)',
                                'rgba(255, 206, 86, 0.2)',
                                'rgba(255, 99, 132, 0.2)'
                            ],
                            borderColor: [
                                'rgba(54, 162, 235, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(255, 99, 132, 1)'
                            ],
                            borderWidth: 1
                        }]
                    },
                    options: {
                        scales: {
                            y: {
                                beginAtZero: true
                            }
                        }
                    }
                });
            </script>
        </div>

        
    <div id="user-management" style="display:none;">
    <h3>User Management</h3>
    <div class="d-flex mb-3">
        <input type="text" id="searchUserInput" placeholder="Search users..." class="form-control mr-2">
        <button id="searchUserButton" class="btn btn-search">Search</button>
        <form action="generate-users-csv.jsp" method="post" class="ml-2">
            <button type="submit" class="btn btn-success">Download Report</button>
        </form>
    </div>
    <div class="table-responsive">
        <table class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Username</th>
                    <th>Full Name</th>
                    <th>Address</th>
                    <th>Phone</th>
                    <th>Email</th>
                    <th>Role</th>
                    <th>Created At</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody id="userTableBody">
                <%
                    try {
                        connection = DriverManager.getConnection(url, username, password);
                        statement = connection.createStatement();
                        String query = "SELECT * FROM users";
                        resultSet = statement.executeQuery(query);

                        while (resultSet.next()) {
                            int user_id = resultSet.getInt("user_id");
                            String userName = resultSet.getString("username");
                            String fullName = resultSet.getString("fullname");
                            String address = resultSet.getString("address");
                            String phone = resultSet.getString("phone");
                            String email = resultSet.getString("email");
                            String role = resultSet.getString("role");
                            String createdAt = resultSet.getString("created_at");
                %>
                <tr>
                    <td><%= user_id %></td>
                    <td><%= userName %></td>
                    <td><%= fullName %></td>
                    <td><%= address %></td>
                    <td><%= phone %></td>
                    <td><%= email %></td>
                    <td><%= role %></td>
                    <td><%= createdAt %></td>
                    <td>
                        <a href="update-user.jsp?id=<%= user_id %>" class="btn btn-primary btn-sm">Edit</a>
                          <form action="delete-process.jsp" method="post" style="display:inline;">
                        <input type="hidden" name="user_id" value="<%= user_id %>">
                        <button type="submit" class="btn btn-danger btn-sm" 
                            onclick="return confirm('Are you sure you want to delete this user?');">
                            Delete
                        </button>
                    </form>
                    </td>
                </tr>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        if (resultSet != null) resultSet.close();
                        if (statement != null) statement.close();
                        if (connection != null) connection.close();
                    }
                %>
            </tbody>
        </table>
    </div>
</div>

<script>
    // Dynamic search functionality
    document.getElementById('searchUserButton').addEventListener('click', function() {
        var searchTerm = document.getElementById('searchUserInput').value.toLowerCase();
        var userRows = document.querySelectorAll('#userTableBody tr');

        userRows.forEach(function(row) {
            var cells = row.getElementsByTagName('td');
            var found = false;

            for (var i = 0; i < cells.length - 1; i++) { // Exclude the actions column
                if (cells[i].innerText.toLowerCase().indexOf(searchTerm) !== -1) {
                    found = true;
                    break;
                }
            }

            if (found) {
                row.style.display = '';
            } else {
                row.style.display = 'none';
            }
        });
    });
</script>
<div id="customers-support" style="display:none;">
           
            
            
       <div class="container">
    <h2>Submitted Messages</h2>
    <!-- Search Form -->
    <form method="get" action="" class="form-inline mb-3">
        <input type="text" name="search" class="form-control form-control-sm mr-2" placeholder="Search by Name or Email" />
        <button type="submit" class="btn btn-primary btn-sm">Search</button>
    </form>
    
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Message</th>
                <th>Submitted At</th>
            </tr>
        </thead>
        <tbody>
            <%
                String searchQuery = request.getParameter("search");
                Connection Conn = null;
                Statement Stmt = null;
                ResultSet Rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/home_gas_delivery", "root", "");
                    String sql = "SELECT * FROM contact_form";
                    
                    if (searchQuery != null && !searchQuery.trim().isEmpty()) {
                        sql += " WHERE name LIKE '%" + searchQuery + "%' OR email LIKE '%" + searchQuery + "%'";
                    }
                    
                    stmt = conn.createStatement();
                    rs = stmt.executeQuery(sql);

                    while (rs.next()) {
                        int id = rs.getInt("id");
                        String name = rs.getString("name");
                        String email = rs.getString("email");
                        String message = rs.getString("message");
                        Timestamp submittedAt = rs.getTimestamp("submitted_at");

                        out.println("<tr>");
                        out.println("<td>" + id + "</td>");
                        out.println("<td>" + name + "</td>");
                        out.println("<td>" + email + "</td>");
                        out.println("<td>" + message + "</td>");
                        out.println("<td>" + submittedAt + "</td>");
                        out.println("</tr>");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    try {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    } catch (SQLException se) {
                        se.printStackTrace();
                    }
                }
            %>
        </tbody>
    </table>
</div>
       
            
            
            
            
            <!-- Customers & support content -->
        </div>

        <div id="settings" style="display:none;">
            <h3>Settings</h3>
            
            
          <!-- Form for Adding New User -->
        <div class="container">
    <div class="row">
        <!-- Add New User Form on the Left Side -->
        <div class="col-md-6" style="padding: 20px;">
            <h4>Add New User</h4>
            <form action="add_admin.jsp" method="post">
                <div class="form-group">
                    <label for="username">Username:</label>
                    <input type="text" id="username" name="username" class="form-control" required>
                </div>
                <div class="form-group">
                    <label for="fullname">Full Name:</label>
                    <input type="text" id="fullname" name="fullname" class="form-control" required>
                </div>
                <div class="form-group">
                    <label for="address">Address:</label>
                    <input type="text" id="address" name="address" class="form-control">
                </div>
                <div class="form-group">
                    <label for="phone">Phone:</label>
                    <input type="text" id="phone" name="phone" class="form-control">
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" class="form-control" required>
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" class="form-control" required>
                </div>
                <button type="submit" class="btn btn-primary btn-block">Add User</button>
            </form>
        </div>

        <!-- Change Password Form on the Right Side -->
        <div class="col-md-6" style="padding: 20px;">
            <h4>Change Password</h4>
            <form action="update_Credentials.jsp" method="post">
                <div class="form-group">
                    <label for="username">Username:</label>
                    <input type="text" id="username" name="username" class="form-control" required>
                </div>
                <div class="form-group">
                    <label for="currentPassword">Old Password:</label>
                    <input type="password" id="currentPassword" name="currentPassword" class="form-control" required>
                </div>
                <div class="form-group">
                    <label for="newPassword">New Password:</label>
                    <input type="password" id="newPassword" name="newPassword" class="form-control" required>
                </div>
                <div class="form-group">
                    <label for="confirmPassword">Confirm Password:</label>
                    <input type="password" id="confirmPassword" name="confirmPassword" class="form-control" required>
                </div>
                <button type="submit" class="btn btn-primary btn-block">Change Password</button>
            </form>
        </div>
    </div>
</div>
    </div>

    <script>
        function showSection(sectionId) {
            var sections = document.querySelectorAll('.content > div');
            sections.forEach(function(section) {
                section.style.display = 'none';
            });
            document.getElementById(sectionId).style.display = 'block';
        }

        document.getElementById('searchOrderButton').addEventListener('click', function() {
            var input = document.getElementById('searchOrderInput').value.toLowerCase();
            var rows = document.querySelectorAll('#orderTableBody tr');
            rows.forEach(function(row) {
                var cells = row.getElementsByTagName('td');
                var found = false;
                for (var i = 0; i < cells.length; i++) {
                    if (cells[i].textContent.toLowerCase().indexOf(input) > -1) {
                        found = true;
                        break;
                    }
                }
                row.style.display = found ? '' : 'none';
            });
        });

        document.getElementById('searchUserButton').addEventListener('click', function() {
            var input = document.getElementById('searchUserInput').value.toLowerCase();
            var rows = document.querySelectorAll('#userTableBody tr');
            rows.forEach(function(row) {
                var cells = row.getElementsByTagName('td');
                var found = false;
                for (var i = 0; i < cells.length; i++) {
                    if (cells[i].textContent.toLowerCase().indexOf(input) > -1) {
                        found = true;
                        break;
                    }
                }
                row.style.display = found ? '' : 'none';
            });
        });
    </script>
</body>
</html>

