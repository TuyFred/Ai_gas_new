<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel - Home Gas Delivery System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f2f2f2;
        }
        .container {
            width: 80%;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .dashboard-header {
            text-align: center;
            margin-bottom: 20px;
        }
        .dashboard-header h1 {
            font-size: 2rem;
        }
        .dashboard-content {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
        }
        .section {
            background-color: #f9f9f9;
            padding: 15px;
            border-radius: 5px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
        }
        .section-header {
            font-size: 1.2rem;
            font-weight: bold;
            margin-bottom: 10px;
        }
        .section-content {
            margin-top: 10px;
            text-align: center;
        }
        .button {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            text-align: center;
            text-decoration: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="dashboard-header">
            <h1>Admin Panel</h1>
        </div>
        <div class="dashboard-content">
            <div class="section">
                <div class="section-header">Manage Users</div>
                <div class="section-content">
                    <a href="manageUsers.jsp" class="button">Manage Users</a>
                </div>
            </div>
            <div class="section">
                <div class="section-header">Manage Orders</div>
                <div class="section-content">
                    <a href="manageOrders.jsp" class="button">Manage Orders</a>
                </div>
            </div>
            <div class="section">
                <div class="section-header">View Analytics</div>
                <div class="section-content">
                    <a href="viewAnalytics.jsp" class="button">View Analytics</a>
                </div>
            </div>
            <div class="section">
                <div class="section-header">Reports</div>
                <div class="section-content">
                    <a href="viewReports.jsp" class="button">View Reports</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
