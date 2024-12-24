<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Profile - Home Gas Delivery System</title>
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
        }
        label {
            font-weight: bold;
        }
        input[type="text"],
        input[type="password"] {
            width: calc(100% - 20px);
            padding: 10px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
        input[type="submit"] {
            width: 100%;
            background-color: #007bff;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="dashboard-header">
            <h1>Update Profile</h1>
        </div>
        <div class="dashboard-content">
            <div class="section">
                <div class="section-header">Update Your Information</div>
                <div class="section-content">
                    <form action="UpdateProfileServlet" method="post">
                        <label for="username">Username:</label><br>
                        <input type="text" id="username" name="username" required><br>
                        <label for="password">New Password:</label><br>
                        <input type="password" id="password" name="password" required><br>
                        <label for="fullname">Full Name:</label><br>
                        <input type="text" id="fullname" name="fullname" required><br>
                        <label for="address">Address:</label><br>
                        <input type="text" id="address" name="address" required><br>
                        <label for="phone">Phone Number:</label><br>
                        <input type="text" id="phone" name="phone" required><br>
                        <input type="submit" value="Update Profile">
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
    