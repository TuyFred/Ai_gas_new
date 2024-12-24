<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%
    HttpSession Session = request.getSession(false);
    if (session == null || !"customer".equals(session.getAttribute("role"))) {
        response.sendRedirect("login.jsp");
    } else {
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Customer Dashboard</title>
    <link rel="stylesheet" href="bootstrap1/boot/css/bootstrap.min.css">
    <link rel="stylesheet" href="fontawesome/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }
        .navbar {
            background-color: #343a40;
        }
        .navbar-brand, .navbar-nav .nav-link {
            color: #fff;
        }
        .navbar-brand:hover, .navbar-nav .nav-link:hover {
            color: #ffc107;
        }
        .container {
            margin-top: 30px;
        }
        .welcome-msg {
            margin-bottom: 30px;
            padding: 15px;
            background-color: #ffc107;
            border-radius: 5px;
            font-size: 1.2rem;
            color: #343a40;
            font-weight: bold;
            text-align: center;
        }
        .dashboard-links {
            display: flex;
            justify-content: center;
            gap: 20px;
        }
        .dashboard-links a {
            padding: 15px 30px;
            background-color: #343a40;
            color: #fff;
            text-align: center;
            border-radius: 5px;
            font-size: 1rem;
            text-decoration: none;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s ease;
        }
        .dashboard-links a:hover {
            background-color: #ffc107;
            color: #343a40;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg">
        <a class="navbar-brand" href="#">Home Gas Delivery</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="#"><i class="fas fa-user"></i> Profile</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
                </li>
            </ul>
        </div>
    </nav>

    <div class="container">
        <div class="welcome-msg">
            Welcome, <%= session.getAttribute("username") %>!
        </div>
        <div class="dashboard-links">
            <a href="createOrder1.jsp"><i class="fas fa-plus"></i> Create Order</a>
            <a href="orderList.jsp"><i class="fas fa-list"></i> View Orders</a>
           
        </div>
    </div>
</body>
</html>
<%
    }
%>
