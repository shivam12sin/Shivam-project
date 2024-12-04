<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - QuizMaster</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <style>
        body { background-color: #f8f9fa; }

        .login-container {
            margin-top: 100px;
        }

        .login-card {
            max-width: 400px;
            margin: 0 auto;
            padding: 30px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .login-card .form-control {
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
<div class="container login-container">
    <div class="login-card bg-light">
        <h2 class="text-center">Login to QuizMaster</h2>
        <form action="loginServlet" method="post">
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" class="form-control" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <div class="form-group text-center">
                <button type="submit" class="btn btn-primary">Login</button>
            </div>
        </form>
        <div class="text-center mt-3">
            <a href="register.jsp">Don't have an account? Register now</a>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
