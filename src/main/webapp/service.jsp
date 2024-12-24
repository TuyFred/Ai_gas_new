<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Services Offered - Home Gas Delivery System</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Font Awesome CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }

        .container {
            margin-top: 20px;
        }

        .card {
            border: none;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            transition: transform 0.2s;
        }

        .card:hover {
            transform: scale(1.05);
        }

        .carousel-inner img {
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            height: 200px; /* Ensure all images have the same height */
            object-fit: cover;
        }

        .card-title {
            font-size: 1.25rem;
            font-weight: bold;
            text-align: center;
        }

        .card-text {
            font-size: 0.9rem;
            text-align: center;
        }

        nav {
            font-size: 0.8rem;
        }

        .navbar {
            padding: 5px 15px;
        }

        .navbar-brand {
            font-size: 1rem;
        }

        .navbar-nav .nav-link {
            padding: 5px 10px;
            font-size: 0.8rem;
        }

        footer {
            background-color: #007bff;
            color: white;
            padding: 10px 0;
            text-align: center;
            font-size: 0.8rem;
            margin-top: 30px;
        }

        footer .social-icons a {
            color: white;
            margin: 0 8px;
            font-size: 1.2rem;
            text-decoration: none;
        }
    </style>
</head>

<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <a class="navbar-brand" href="#">Home Gas Delivery System</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="contact.jsp">Contact</a>
                </li>
            </ul>
        </div>
    </nav>

    <div class="container">
        <h2 class="text-center my-4">Our Services</h2>
        <div class="row">
            <!-- Card 1 -->
            <div class="col-md-3 mb-4">
                <div class="card">
                    <div id="carouselExample1" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="images/gas1.jpg" class="d-block w-100" alt="Gas Cylinder 1">
                            </div>
                            <div class="carousel-item">
                                <img src="images/gas2.jpeg" class="d-block w-100" alt="Gas Cylinder 2">
                            </div>
                        </div>
                        <a class="carousel-control-prev" href="#carouselExample1" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#carouselExample1" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">Standard Gas Cylinder</h5>
                        <p class="card-text">Reliable and safe gas cylinder for daily use.</p>
                    </div>
                </div>
            </div>

            <!-- Card 2 -->
            <div class="col-md-3 mb-4">
                <div class="card">
                    <div id="carouselExample2" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="images/gas3.jpeg" class="d-block w-100" alt="Gas Cylinder 3">
                            </div>
                            <div class="carousel-item">
                                <img src="images/gas4.jpg" class="d-block w-100" alt="Gas Cylinder 4">
                            </div>
                        </div>
                        <a class="carousel-control-prev" href="#carouselExample2" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#carouselExample2" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">Large Gas Cylinder</h5>
                        <p class="card-text">Ideal for extended use in larger households.</p>
                    </div>
                </div>
            </div>

            <!-- Card 3 -->
            <div class="col-md-3 mb-4">
                <div class="card">
                    <div id="carouselExample3" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="images/gas5.jpg" class="d-block w-100" alt="Gas Cylinder 5">
                            </div>
                            <div class="carousel-item">
                                <img src="images/gas c.jpg" class="d-block w-100" alt="Gas Cylinder 6">
                            </div>
                        </div>
                        <a class="carousel-control-prev" href="#carouselExample3" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#carouselExample3" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">Compact Gas Cylinder</h5>
                        <p class="card-text">Portable and perfect for small spaces.</p>
                    </div>
                </div>
            </div>

            <!-- Card 4 -->
            <div class="col-md-3 mb-4">
                <div class="card">
                    <div id="carouselExample4" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="images/gas8.jpeg" class="d-block w-100" alt="Gas Cylinder 7">
                            </div>
                            <div class="carousel-item">
                                <img src="images/gas88.jpeg" class="d-block w-100" alt="Gas Cylinder 8">
                            </div>
                        </div>
                        <a class="carousel-control-prev" href="#carouselExample4" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#carouselExample4" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">Industrial Gas Cylinder</h5>
                        <p class="card-text">Heavy-duty cylinder for industrial use.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <div class="social-icons">
            <a href="#"><i class="fab fa-facebook"></i></a>
            <a href="#"><i class="fab fa-twitter"></i></a>
            <a href="#"><i class="fab fa-instagram"></i></a>
            <a href="#"><i class="fab fa-youtube"></i></a>
            <a href="#"><i class="fab fa-linkedin"></i></a>
        </div>
        <p>&copy; 2024 Home Gas Delivery System. All rights reserved.</p>
    </footer>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>