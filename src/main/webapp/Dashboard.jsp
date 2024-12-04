<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <style>
        body { background-color: #f8f9fa; }

        .nav-bar-main {
            background-color: #007bff;
        }

        .navbar-brand, .nav-link { color: white; }

        .nav-link:hover { color: #d4d4d4; }

        .welcome-msg-sec {
            padding: 100px 0;
            text-align: center;
            background-color: #343a40;
            color: white;
        }

        .start-quiz-btn {
            margin-top: 30px;
        }

        .quiz-heading-sec {
            text-align: center;
            margin-bottom: 40px;
        }

        .footer-sec {
            padding: 20px 0;
            background-color: #007bff;
            color: white;
            text-align: center;
        }

        .card-header {
            font-weight: bold;
        }
    </style>
</head>
<body>

<%-- Check if user is logged in --%>
<%
    HttpSession session = request.getSession(false);
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");  // Redirect to login if session doesn't exist
    } else {
        String username = (String) session.getAttribute("username");
        String role = (String) session.getAttribute("role");
        int userId = (int) session.getAttribute("userId");  // Retrieve userId from session
%>

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
                    <a class="nav-link" href="viewQuizzes.jsp">Quizzes</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="leaderboard.jsp">Leaderboard</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="profile.jsp">My Profile</a>
                </li>
            </ul>
            <!-- Register & Login Buttons -->
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="btn btn-outline-light me-2" href="register.jsp">Join Now</a>
                </li>
                <li class="nav-item">
                    <a class="btn btn-light" href="login.jsp">Log In</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Welcome Section -->
<section class="welcome-msg-sec">
    <div class="container">
        <h1>Welcome to Your Dashboard</h1>
        <p class="lead">Hello, <%= username %>! You are logged in as <%= role %>.</p>
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
                    <p><strong>Name:</strong> <%= username %></p>
                    <p><strong>Role:</strong> <%= role %></p>
                    <a href="profile.jsp" class="btn btn-primary">View Profile</a>
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
                    <p>Access your quizzes here.</p>
                    <a href="quizzes.jsp" class="btn btn-success">View Quizzes</a>
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
                    <p>Manage your settings here.</p>
                    <a href="settings.jsp" class="btn btn-warning">View Settings</a>
                </div>
            </div>
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

<% } %> <!-- End of Session Check -->

</body>
</html>



