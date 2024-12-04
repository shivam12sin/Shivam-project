<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Dashboard</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }

        .nav-bar-main {
            background-color: #007bff;
        }

        .navbar-brand, .nav-link {
            color: white;
        }

        .nav-link:hover {
            color: #d4d4d4;
        }

        .welcome-msg-sec {
            padding: 100px 0;
            text-align: center;
            background-color: #343a40;
            color: white;
            border-bottom: 4px solid #007bff;
        }

        .footer-sec {
            padding: 40px 0 20px;
            background-color: #007bff;
            color: white;
            text-align: center;
            margin-top: 40px; /* Added margin to separate footer from content */
        }

        /* Card Styling */
        .card {
            border-radius: 12px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease-in-out;
        }

        .card:hover {
            transform: translateY(-10px);
        }

        .card-header {
            font-weight: bold;
            font-size: 1.1rem;
        }

        .card-body {
            padding: 25px;
        }

        .card-title {
            font-size: 1.2rem;
            color: #007bff;
        }

        .card-text {
            font-size: 1rem;
            color: #555;
        }

        .btn-custom {
            width: 100%;
            font-weight: bold;
            padding: 12px;
            border-radius: 8px;
        }

        .btn-custom-primary {
            background-color: #007bff;
            color: white;
        }

        .btn-custom-success {
            background-color: #28a745;
            color: white;
        }

        .btn-custom-warning {
            background-color: #ffc107;
            color: white;
        }

        .btn-custom-danger {
            background-color: transparent;
            color:#c73a3a ;
            border: 2px solid black;
            font-weight: bold;
            padding: 12px;
            border-radius: 8px;
            transition: background-color 0.3s, color 0.3s;
        }

        /* Hover Style for Logout Button */
        .btn-custom-danger:hover {
            background-color: red;
            color: white;
        }

        /* Responsive Cards */
        @media (max-width: 768px) {
            .card {
                margin-bottom: 20px;
            }
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="nav-bar-main navbar navbar-expand-lg navbar-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">QuizMaster</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent" aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="quiz.jsp">Quizzes</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="leaderboard.jsp">Leaderboard</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="profile.jsp">My Profile</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Welcome Section -->
<section class="welcome-msg-sec">
    <div class="container">
        <h1>Welcome to Your Dashboard</h1>
        <p class="lead">Hello, ${username}! You are logged in as ${role}.</p>
    </div>
</section>

<!-- Dashboard Cards -->
<div class="container mt-5">
    <div class="row">
        <!-- Profile Card -->
        <div class="col-md-4">
            <div class="card mb-4 shadow-sm">
                <div class="card-header bg-primary text-white">
                    <h5>Profile</h5>
                </div>
                <div class="card-body">
                    <p><strong>Name:</strong> ${username}</p>
                    <p><strong>Role:</strong> ${role}</p>
                    <a href="profile.jsp" class="btn btn-custom btn-custom-primary">View Profile</a>
                </div>
            </div>
        </div>

        <!-- Quizzes Card -->
        <div class="col-md-4">
            <div class="card mb-4 shadow-sm">
                <div class="card-header bg-success text-white">
                    <h5>Quizzes</h5>
                </div>
                <div class="card-body">
                    <p>Access and complete your quizzes here.</p>
                    <a href="viewQuizzes.jsp" class="btn btn-custom btn-custom-success">View Quizzes</a>
                </div>
            </div>
        </div>

        <!-- Settings Card -->
        <div class="col-md-4">
            <div class="card mb-4 shadow-sm">
                <div class="card-header bg-warning text-white">
                    <h5>Settings</h5>
                </div>
                <div class="card-body">
                    <p>Manage your account settings here.</p>
                    <a href="studentSettings.jsp" class="btn btn-custom btn-custom-warning">View Settings</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Logout Button -->
    <div class="row mt-4">
        <div class="col-12 text-center">
            <a href="logout.jsp" class="btn btn-custom btn-custom-danger">Logout</a>
        </div>
    </div>
</div>

<!-- Footer -->
<footer class="footer-sec">
    <div class="container">
        <p>&copy; 2024 QuizMaster. Ready to learn something new today?</p>
    </div>
</footer>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>


