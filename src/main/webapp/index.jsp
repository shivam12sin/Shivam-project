<%
   if(session.getAttribute("name")==null){
        response.sendRedirect("register.jsp");}

%>

<%@

page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to QuizMaster</title>

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

        .quiz-card-body {
            text-align: center;
        }
    </style>
</head>
<body>
<!-- Navbar -->
<nav class="nav-bar-main navbar-expand-lg navbar-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">QuizMaster</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent" aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarContent">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link active" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="about.jsp">About</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="quiz.jsp">Quizzes</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="contact.jsp">Contact Us</a>
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
        <h1>Welcome to QuizMaster</h1>
        <p>Challenge your knowledge, track your progress, and become a quiz champion!</p>
        <a href="quiz.jsp" class="btn btn-primary btn-lg start-quiz-btn">Start Your First Quiz</a>
    </div>
</section>

<!-- How It Works Section -->
<div class="container mt-5">
    <h2 class="quiz-heading-sec">How QuizMaster Works</h2>
    <p class="text-center">Get started in 3 simple steps:</p>
    <div class="row">
        <div class="col-md-4">
            <div class="card mb-4 shadow-sm">
                <div class="quiz-card-body">
                    <h5 class="card-title">1. Choose a Topic</h5>
                    <p class="card-text">Explore a variety of topics from general knowledge to specialized subjects.</p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card mb-4 shadow-sm">
                <div class="quiz-card-body">
                    <h5 class="card-title">2. Take the Quiz</h5>
                    <p class="card-text">Answer a set of questions within a time limit to test your knowledge.</p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card mb-4 shadow-sm">
                <div class="quiz-card-body">
                    <h5 class="card-title">3. See Your Results</h5>
                    <p class="card-text">Review your score and see which areas need improvement.</p>
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

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

