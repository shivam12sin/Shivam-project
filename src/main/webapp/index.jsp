<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quiz Website - Login</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-image: url('https://images.unsplash.com/photo-1506748686218-d1c0bce75f9b'); /* Background Image */
            background-size: cover;
            background-position: center;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            font-family: 'Arial', sans-serif;
        }
        .card {
            border-radius: 15px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            background-color: rgba(255, 255, 255, 0.8); /* Light background for card */
            padding: 20px;
        }
        .card-header {
            background: linear-gradient(135deg, #007bff, #0056b3);
            border-radius: 15px 15px 0 0;
            color: #fff;
        }
        .card-header h4 {
            margin: 0;
        }
        .btn-primary {
            background-color: #007bff;
            border: none;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
        .form-label {
            font-weight: bold;
        }
        .text-center p {
            color: #333;
        }
        .alert-danger {
            font-size: 0.9rem;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header text-center">
                        <h4>Login to Quiz Website</h4>
                    </div>
                    <div class="card-body">
                        <form action="loginform" method="post">
                            <!-- Username Field -->
                            <div class="mb-3">
                                <label for="username" class="form-label">Username</label>
                                <input type="text" class="form-control" id="username" name="username" placeholder="Enter username" required>
                            </div>

                            <!-- Password Field -->
                            <div class="mb-3">
                                <label for="password" class="form-label">Password</label>
                                <input type="password" class="form-control" id="password" name="password" placeholder="Enter password" required>
                            </div>

                            <!-- Role Dropdown -->
                            <div class="mb-3">
                                <label for="role" class="form-label">Login as</label>
                                <select class="form-select" id="role" name="role" required>
                                    <option value="" selected disabled>Choose role</option>
                                    <option value="admin">Admin</option>
                                    <option value="teacher">Teacher</option>
                                    <option value="student">Student</option>
                                </select>
                            </div>

                            <!-- Login Button -->
                            <div class="d-grid gap-2">
                                <button type="submit" class="btn btn-primary">Login</button>
                            </div>
                        </form>

                        <!-- Error Message (if any) -->
                        <c:if test="${not empty errorMessage}">
                            <div class="alert alert-danger mt-3">
                                ${errorMessage}
                            </div>
                        </c:if>

                        <!-- Registration Link -->
                        <hr>
                        <div class="text-center">
                            <p>Not registered yet?</p>
                            <a href="register.jsp" class="btn btn-secondary">Register</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>






