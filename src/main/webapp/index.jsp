<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AI-powered Home Gas Delivery System</title>
    <!-- Font Awesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <!-- Bootstrap CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f2f2f2; /* Light gray background */
        }
        .container {
            width: 80%;
            margin: 0 auto;
            padding-top: 20px;
            background-color: #ffffff; /* White background */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
        }
        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #007bff; /* Primary blue background */
            color: white;
            padding: 10px 20px;
            border-top-left-radius: 5px;
            border-top-right-radius: 5px;
        }
        nav {
            background-color: #007bff; /* Same as header background */
        }
        .nav-links {
            list-style: none;
            padding: 0;
            margin: 0;
            display: flex;
            align-items: center;
        }
        .nav-links li {
            margin-left: 15px;
            position: relative;
        }
        .nav-links li a {
            text-decoration: none;
            color: white;
            font-size: 16px;
            padding: 10px 15px;
            border-radius: 5px;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }
        .nav-links li a:hover {
            background-color: #0056b3; /* Darker blue on hover */
            transform: scale(1.05); /* Scale up slightly on hover */
        }
        .logo {
            font-size: 24px;
            font-weight: bold;
            text-decoration: none;
            color: white;
        }
        .services-menu-content {
            display: none;
            position: absolute;
            top: 100%;
            left: 0;
            background-color: #ffffff; /* White background for dropdown */
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
            border-radius: 5px;
            padding: 10px 0;
        }
        .services-menu-content a {
            color: #333;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
            transition: background-color 0.3s ease;
        }
        .services-menu-content a:hover {
            background-color: #f8f9fa; /* Light hover background color */
        }
        .services-menu:hover .services-menu-content {
            display: block;
        }
        footer {
            text-align: center;
            margin-top: 20px;
            padding: 20px 0;
            background-color: #007bff; /* Primary blue background */
            color: white;
            border-bottom-left-radius: 5px;
            border-bottom-right-radius: 5px;
        }
        .footer-text {
            font-size: 14px;
        }
        .footer-icons {
            margin-top: 10px;
        }
        .footer-icons a {
            display: inline-block;
            margin: 0 10px;
            color: white;
            font-size: 24px;
            transition: transform 0.3s ease;
        }
        .footer-icons a:hover {
            transform: scale(1.2); /* Scale up slightly on hover */
        }
        .products {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            margin-top: 40px;
        }
        .product-card {
            width: 30%;
            margin-bottom: 20px;
            background-color: #ffffff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }
        .product-card img {
            width: 100%;
            height: auto;
        }
        .product-card .card-body {
            padding: 15px;
            text-align: center;
        }
        .product-card .card-title {
            font-size: 18px;
            margin-bottom: 10px;
        }
        .product-card .card-text {
            font-size: 16px;
            color: #555;
        }
    </style>
</head>
<body>
    <header>
        <a href="#" class="logo">AI-Home Gas Delivery</a>
        <nav>
            <ul class="nav-links">
                <li class="services-menu">
                    <a href="#"><i class="fas fa-cogs"></i> Services &#9662;</a>
                    <div class="services-menu-content">
                        <a href="service.jsp"><i class="fas fa-shopping-cart"></i> Order Gas Cylinders</a>
                        <a href="#"><i class="fas fa-headset"></i> Contact Support</a>
                    </div>
                </li>
                <li><a href="login.jsp"><i class="fas fa-sign-in-alt"></i> Login</a></li>
                <li><a href="Register.jsp"><i class="fas fa-user-plus"></i> Register</a></li>
                <li><a href="about.jsp"><i class="fas fa-info-circle"></i> About Us</a></li>
                <li><a href="contact.jsp"><i class="fas fa-envelope"></i> Contact Us</a></li>
            </ul>
        </nav>
    </header>
    <div class="container">
        <div class="products">
            <div class="product-card">
                <div id="carouselExampleIndicators1" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#carouselExampleIndicators1" data-slide-to="0" class="active"></li>
                        <li data-target="#carouselExampleIndicators1" data-slide-to="1"></li>
                        <li data-target="#carouselExampleIndicators1" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="images/4.jpg" class="d-block w-100" alt="Product 1 - Image 1">
                        </div>
                        <div class="carousel-item">
                            <img src="images/4.jpeg" class="d-block w-100" alt="Product 1 - Image 2">
                        </div>
                        <div class="carousel-item">
                            <img src="images/gas1.jpg" class="d-block w-100" alt="Product 1 - Image 3">
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleIndicators1" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleIndicators1" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
                <div class="card-body">
                    <h5 class="card-title">Product 1</h5>
                    <p class="card-text">Price: $100</p>
                    <p class="card-text">Description of the product...</p>
                </div>
            </div>
            <div class="product-card">
                <div id="carouselExampleIndicators2" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#carouselExampleIndicators2" data-slide-to="0" class="active"></li>
                        <li data-target="#carouselExampleIndicators2" data-slide-to="1"></li>
                        <li data-target="#carouselExampleIndicators2" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="images/1.png" class="d-block w-100" alt="Product 2 - Image 1">
                        </div>
                        <div class="carousel-item">
                            <img src="images/2.png" class="d-block w-100" alt="Product 2 - Image 2">
                        </div>
                        <div class="carousel-item">
                            <img src="images/3.png" class="d-block w-100" alt="Product 2 - Image 3">
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleIndicators2" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleIndicators2" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
                <div class="card-body">
                    <h5 class="card-title">Product 2</h5>
                    <p class="card-text">Price: $120</p>
                    <p class="card-text">Description of the product...</p>
                </div>
            </div>
            <div class="product-card">
                <div id="carouselExampleIndicators3" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#carouselExampleIndicators3" data-slide-to="0" class="active"></li>
                        <li data-target="#carouselExampleIndicators3" data-slide-to="1"></li>
                        <li data-target="#carouselExampleIndicators3" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="images/2.jpg" class="d-block w-100" alt="Product 3 - Image 1">
                        </div>
                        <div class="carousel-item">
                            <img src="images/3.jpg" class="d-block w-100" alt="Product 3 - Image 2">
                        </div>
                        <div class="carousel-item">
                            <img src="images/4.jpg" class="d-block w-100" alt="Product 3 - Image 3">
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleIndicators3" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleIndicators3" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
                <div class="card-body">
                    <h5 class="card-title">Product 3</h5>
                    <p class="card-text">Price: $150</p>
                    <p class="card-text">Description of the product...</p>
                </div>
            </div>
        </div>
    </div>
    <footer>
        <div class="footer-icons">
            <a href="#"><i class="fab fa-facebook"></i></a>
            <a href="#"><i class="fab fa-youtube"></i></a>
            <a href="#"><i class="fab fa-twitter"></i></a>
            <a href="#"><i class="fab fa-linkedin"></i></a>
            <a href="#"><i class="fab fa-whatsapp"></i></a>
        </div>
        <p class="footer-text">&copy; 2024 Home Gas Delivery System. All rights reserved.</p>
    </footer>

    <!-- Bootstrap JS (optional, if not included already) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>


