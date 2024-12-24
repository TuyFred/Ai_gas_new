<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="conn.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order List - Home Gas Delivery System</title>
    <link rel="stylesheet" href="bootstrap1/boot/css/bootstrap.min.css">
    <link rel="stylesheet" href="fontawesome/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        /* Custom CSS styles */
        body { font-family: Arial, sans-serif; margin: 0; padding: 0; background-color: #f2f2f2; }
        .container { width: 80%; margin: 20px auto; padding: 20px; background-color: #fff; border-radius: 5px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); }
        .dashboard-header { text-align: center; margin-bottom: 20px; }
        .section { background-color: #f9f9f9; padding: 15px; border-radius: 5px; box-shadow: 0 0 5px rgba(0, 0, 0, 0.1); }
        .section-header { font-size: 1.2rem; font-weight: bold; margin-bottom: 10px; }
        .section-content { margin-top: 10px; }
        .order-list { list-style-type: none; padding: 0; }
        .order-item { margin-bottom: 10px; padding: 10px; border: 1px solid #ccc; border-radius: 5px; background-color: #fff; }
        .order-item:nth-child(even) { background-color: #e9ecef; }
        .order-item h3 { margin-top: 0; margin-bottom: 5px; }
        .order-item p { margin: 5px 0; }
        .back-button { display: inline-block; margin-top: 20px; padding: 10px 20px; font-size: 1rem; font-weight: bold; color: #fff; background-color: #007bff; border: none; border-radius: 5px; text-decoration: none; text-align: center; }
        .back-button:hover { background-color: #0056b3; }
        .chart-container { width: 100%; max-width: 600px; margin: auto; }
        .badge-pending { background-color: #ffc107; }
        .badge-completed { background-color: #28a745; }
        .badge-cancelled { background-color: #dc3545; }
    </style>
</head>
<body>
    <div class="container">
        <div class="dashboard-header">
            <h1>Order List</h1>
        </div>
        <div class="section">
            <div class="section-header">Your Orders</div>
            <div class="section-content">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Order Date</th>
                            <th>Delivery Date</th>
                            <th>Status</th>
                            <th>Created</th>
                            <th>Message</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            String customerName = (String) session.getAttribute("username");
                            int customerId = -1;
                            java.util.Hashtable<String, Integer> statusCountMap = new java.util.Hashtable<>();
                            try {
                                String customerQuery = "SELECT user_id FROM users WHERE username = ?";
                                PreparedStatement pstmt = conn.prepareStatement(customerQuery);
                                pstmt.setString(1, customerName);
                                ResultSet resultSet = pstmt.executeQuery();
                                if (resultSet.next()) {
                                    customerId = resultSet.getInt("user_id");
                                }
                                pstmt.close();

                                // Fetch status counts
                                String query = "SELECT status, COUNT(*) AS count FROM orders WHERE user_id = ? GROUP BY status";
                                PreparedStatement pstmtCount = conn.prepareStatement(query);
                                pstmtCount.setInt(1, customerId);
                                ResultSet resultSetCount = pstmtCount.executeQuery();
                                while (resultSetCount.next()) {
                                    statusCountMap.put(resultSetCount.getString("status"), resultSetCount.getInt("count"));
                                }
                                pstmtCount.close();
                                
                                // Render table rows
                                String queryDetails = "SELECT id, order_date, delivery_date, status, created_at FROM orders WHERE user_id = ?";
                                PreparedStatement pstmtDetails = conn.prepareStatement(queryDetails);
                                pstmtDetails.setInt(1, customerId);
                                ResultSet resultSetDetails = pstmtDetails.executeQuery();
                                int i = 1;
                                while (resultSetDetails.next()) {
                                    int id = resultSetDetails.getInt("id");
                                    String orderDate = resultSetDetails.getString("order_date");
                                    String deliveryDate = resultSetDetails.getString("delivery_date");
                                    String status = resultSetDetails.getString("status");
                                    String createdAt = resultSetDetails.getString("created_at");
                        %>
                        <tr>
                            <td><%= i++ %></td>
                            <td><%= orderDate %></td>
                            <td><%= deliveryDate %></td>
                            <td>
                                <span class="badge <%= (status.equals("Cancelled") ? "badge-cancelled" : status.equals("Completed") ? "badge-completed" : "badge-pending") %>">
                                    <%= status %>
                                </span>
                            </td>
                            <td><%= createdAt %></td>
                        </tr>
                        <% 
                                }
                                pstmtDetails.close();
                            } catch (SQLException e) {
                                out.println("<tr><td colspan='7'>Error fetching bookings: " + e.getMessage() + "</td></tr>");
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="chart-container">
            <canvas id="statusChart"></canvas>
        </div>
        <div class="back-button-container">
            <a href="customerDashboard.jsp" class="back-button">Back to Dashboard</a>
        </div>
    </div>
    <script>
        // Prepare JSON data manually
        const statusCounts = <% 
            StringBuilder sb = new StringBuilder();
            sb.append("{");
            for (java.util.Map.Entry<String, Integer> entry : statusCountMap.entrySet()) {
                if (sb.length() > 1) sb.append(", ");
                sb.append("\"").append(entry.getKey()).append("\": ").append(entry.getValue());
            }
            sb.append("}");
            out.print(sb.toString());
        %>;

        const labels = Object.keys(statusCounts);
        const data = Object.values(statusCounts);

        const ctx = document.getElementById('statusChart').getContext('2d');
        new Chart(ctx, {
            type: 'bar',
            data: {
                labels: labels,
                datasets: [{
                    label: 'Number of Orders',
                    data: data,
                    backgroundColor: 'rgba(75, 192, 192, 0.2)',
                    borderColor: 'rgba(75, 192, 192, 1)',
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
</body>
</html>

