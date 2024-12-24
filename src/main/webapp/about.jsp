<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Home Gas Delivery System</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            font-size: 0.9rem;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            margin: 0;
        }

        .container {
            flex: 1;
            margin-top: 20px;
        }

        .card {
            background-color: rgba(255, 255, 255, 0.9);
            border: none;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 15px;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 1.5rem;
        }

        p {
            line-height: 1.4;
        }

        .team-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-top: 20px;
        }

        .team-card {
            text-align: center;
            background-color: rgba(255, 255, 255, 0.9);
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        .team-card img {
            border-radius: 50%;
            width: 80px;
            height: 80px;
            margin-bottom: 10px;
        }

        .team-card h5 {
            font-size: 1rem;
        }

        .back-btn {
            display: block;
            margin: 20px auto;
            text-align: center;
        }

        .btn-primary {
            font-size: 0.9rem;
            padding: 5px 10px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }

        footer {
            background-color: #007bff;
            color: white;
            padding: 15px 0;
            text-align: center;
            font-size: 0.8rem;
            margin-top: auto;
        }

        footer .social-icons a {
            color: white;
            margin: 0 7px;
            font-size: 1.5rem;
            text-decoration: none;
        }
    </style>
</head>

<body>
    <div class="container">
        <h2>About Us</h2>
        <div class="card">
            <p>We provide reliable gas delivery services, utilizing AI to ensure timely delivery and customer satisfaction.</p>
            <p>Experience cutting-edge technology and exceptional service with our Home Gas Delivery System.</p>
        </div>

        <!-- Team Section -->
        <h2>Our Delivery Team</h2>
        <div class="team-grid">
            <div class="team-card">
                <img src="path/to/delivery_person1.jpg" alt="John Doe">
                <h5>John Doe</h5>
                <p>Lead Delivery Specialist</p>
            </div>
            <div class="team-card">
                <img src="path/to/delivery_person2.jpg" alt="Jane Smith">
                <h5>Jane Smith</h5>
                <p>Senior Delivery Expert</p>
            </div>
            <div class="team-card">
                <img src="path/to/delivery_person3.jpg" alt="Michael Brown">
                <h5>Michael Brown</h5>
                <p>Delivery Coordinator</p>
            </div>
        </div>

        <!-- Back to Home Button -->
        <div class="back-btn">
            <a href="index.jsp" class="btn btn-primary"><i class="fas fa-home"></i> Home</a>
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
</body>

</html>
