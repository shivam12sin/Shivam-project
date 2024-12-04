<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Teacher Dashboard</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <div class="row">
            <div class="col-12 text-center">
                <h1>Welcome to the Teacher Dashboard</h1>
                <p class="lead">Hello, ${username}! You are logged in as ${role}.</p>
            </div>
        </div>

        <div class="row mt-4">
            <!-- Profile Section -->
            <div class="col-md-4">
                <div class="card">
                    <div class="card-header bg-primary text-white">
                        <h5>Profile</h5>
                    </div>
                    <div class="card-body">
                        <p><strong>Name:</strong> ${username}</p>
                        <p><strong>Role:</strong> ${role}</p>
                        <a href="profile.jsp" class="btn btn-primary">View Profile</a>
                    </div>
                </div>
            </div>

            <!-- Manage Quizzes Section -->
            <div class="col-md-4">
                <div class="card">
                    <div class="card-header bg-success text-white">
                        <h5>Manage Quizzes</h5>
                    </div>
                    <div class="card-body">
                        <p>Create, edit, or delete quizzes for your students.</p>
                        <a href="manageQuizzes.jsp" class="btn btn-success">Manage Quizzes</a>
                    </div>
                </div>
            </div>

            <!-- Settings Section -->
            <div class="col-md-4">
                <div class="card">
                    <div class="card-header bg-warning text-white">
                        <h5>Settings</h5>
                    </div>
                    <div class="card-body">
                        <p>Manage your account and preferences.</p>
                        <a href="teacherSettings.jsp" class="btn btn-warning">View Settings</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Logout Button -->
        <div class="row mt-4">
            <div class="col-12 text-center">
                <a href="logout.jsp" class="btn btn-danger">Logout</a>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
