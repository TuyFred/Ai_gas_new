<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="com.MYPROJECT_AI_HOMEGAS.util.DBUtil" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Order</title>
    <link rel="stylesheet" href="bootstrap1/boot/css/bootstrap.min.css">
    <link rel="stylesheet" href="fontawesome/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('images/backgood.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center center;
            font-size: 16px;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            width: 100%;
            max-width: 400px;
            margin: auto;
        }
        .form-container {
            background-color: #fff;
            padding: 15px;
            border-radius: 5px;
            box-shadow: 0 0 8px rgba(0, 0, 0, 0.1);
            margin-top: 50px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            font-size: 0.85rem;
        }
        .form-control {
            font-size: 0.85rem;
        }
        .btn {
            font-size: 0.85rem;
        }
        h2 {
            font-size: 1.25rem;
            margin-bottom: 20px;
            text-align: center;
        }
        .back-button {
            display: inline-block;
            margin-top: 15px;
            padding: 8px 15px;
            font-size: 0.85rem;
            font-weight: bold;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            text-align: center;
            display: block;
            text-align: center;
        }
        .back-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="form-container">
            <h2>Create Order</h2>
            <form action="createOrder-process.jsp" method="post">
                <div class="form-group">
                    <label for="userId">User ID</label>
                    <input type="text" class="form-control" id="userId" name="userId" required>
                </div>
                <div class="form-group">
                    <label for="orderDate">Order Date</label>
                    <input type="date" class="form-control" id="orderDate" name="orderDate" required>
                </div>
                <div class="form-group">
                    <label for="deliveryDate">Delivery Date</label>
                    <input type="date" class="form-control" id="deliveryDate" name="deliveryDate" required>
                </div>
                <div class="form-group">
                    <label for="status">Status</label>
                    <select class="form-control" id="status" name="status">
                        <option value="Pending">Pending</option>
                        <option value="Delivered">Delivered</option>
                        <option value="Cancelled">Cancelled</option>
                    </select>
                </div>
                <!-- Hidden Message Field -->
                <input type="hidden" name="message" value="">
                <button type="submit" class="btn btn-primary btn-block"><i class="fas fa-save"></i> Create Order</button>
            </form>
            <a href="customerDashboard.jsp" class="back-button">Go Back to Dashboard</a>
        </div>
    </div>
</body>
</html>
