<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - Home Gas Delivery System</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: url('images/backgood.jpg') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            width: 100%;
            max-width: 400px;
            padding: 15px;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            margin-bottom: 15px;
            font-size: 1.5rem;
        }
        .form-group {
            margin-bottom: 10px;
        }
        .form-group i {
            position: absolute;
            left: 10px;
            top: 32px;
            color: #aaa;
        }
        .form-control {
            padding-left: 35px;
            padding-top: 5px;
            padding-bottom: 5px;
        }
        .error-msg {
            color: red;
            font-size: 14px;
            margin-top: 5px;
            text-align: center;
        }
        label {
            margin-bottom: 2px;
        }
        button {
            padding: 7px 0;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Register for Home Gas Delivery System</h2>
        <form action="register-process.jsp" method="post">
            <div class="form-group position-relative">
                <label for="username">Username:</label>
                <i class="fas fa-user"></i>
                <input type="text" id="username" name="username" class="form-control" required>
            </div>
            <div class="form-group position-relative">
                <label for="password">Password:</label>
                <i class="fas fa-lock"></i>
                <input type="password" id="password" name="password" class="form-control" required>
            </div>
            <div class="form-group position-relative">
                <label for="fullname">Full Name:</label>
                <i class="fas fa-user-tag"></i>
                <input type="text" id="fullname" name="fullname" class="form-control" required>
            </div>
            <div class="form-group position-relative">
                <label for="address">Address:</label>
                <i class="fas fa-home"></i>
                <input type="text" id="address" name="address" class="form-control" required>
            </div>
            <div class="form-group position-relative">
                <label for="phone">Phone Number:</label>
                <i class="fas fa-phone"></i>
                <input type="text" id="phone" name="phone" class="form-control" required>
            </div>
            <div class="form-group position-relative">
                <label for="email">Email:</label>
                <i class="fas fa-envelope"></i>
                <input type="email" id="email" name="email" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-primary btn-block">Register</button>
        </form>
        <div class="error-msg">
            <!-- Display error messages here if registration fails -->
        </div>
    </div>
    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

