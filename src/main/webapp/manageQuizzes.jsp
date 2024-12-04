<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Quizzes</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }

        .quiz-card {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-top: 50px;
        }

        .quiz-card h2 {
            text-align: center;
            color: #007bff;
        }

        .footer-sec {
            padding: 20px 0;
            background-color: #007bff;
            color: white;
            text-align: center;
            margin-top: 40px;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #007bff;">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">QuizMaster</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="teacherDashboard.jsp">Dashboard</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="ManageQuizzes.jsp">Manage Quizzes</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="logout.jsp">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Quiz Management Section -->
<div class="container">
    <div class="quiz-card">
        <h2>Manage Quizzes</h2>

        <!-- Create Quiz Form -->
        <form action="manageQuizzes.jsp" method="post">
            <div class="mb-3">
                <label for="quizTitle" class="form-label">Quiz Title</label>
                <input type="text" name="quizTitle" id="quizTitle" class="form-control" required>
            </div>
            <button type="submit" name="action" value="create" class="btn btn-primary">Create Quiz</button>
        </form>

        <hr>

        <!-- Existing Quizzes Table -->
        <h4>Your Quizzes</h4>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Quiz ID</th>
                    <th>Quiz Title</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    // Declare the connection and statement objects
                    Connection conn = null;
                    PreparedStatement pstmt = null;
                    ResultSet rs = null;
                    String action = request.getParameter("action");
                    String quizTitle = request.getParameter("quizTitle");
                    String quizId = request.getParameter("quizId");
                    String username = (String) session.getAttribute("username");

                    try {
                        // Establish the connection
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz", "root", "Shivam123@");

                        // Get the teacher ID
                        int teacherId = 0;
                        String teacherQuery = "SELECT id FROM teachers WHERE username = ?";
                        pstmt = conn.prepareStatement(teacherQuery);
                        pstmt.setString(1, username);
                        rs = pstmt.executeQuery();
                        if (rs.next()) {
                            teacherId = rs.getInt("id");
                        }

                        // Handle the action (create or delete quiz)
                        if ("create".equals(action)) {
                            String insertQuizQuery = "INSERT INTO quizzes (title, teacher_id, created_at) VALUES (?, ?, NOW())";
                            pstmt = conn.prepareStatement(insertQuizQuery);
                            pstmt.setString(1, quizTitle);
                            pstmt.setInt(2, teacherId);
                            pstmt.executeUpdate();
                        } else if ("delete".equals(action)) {
                            String deleteQuizQuery = "DELETE FROM quizzes WHERE id = ?";
                            pstmt = conn.prepareStatement(deleteQuizQuery);
                            pstmt.setInt(1, Integer.parseInt(quizId));
                            pstmt.executeUpdate();
                        }

                        // Fetch the quizzes for the teacher
                        String fetchQuizzesQuery = "SELECT id, title FROM quizzes WHERE teacher_id = ?";
                        pstmt = conn.prepareStatement(fetchQuizzesQuery);
                        pstmt.setInt(1, teacherId);
                        rs = pstmt.executeQuery();

                        // Display the quizzes in a table
                        while (rs.next()) {
                            int quizIdFromDb = rs.getInt("id");
                            String quizTitleFromDb = rs.getString("title");
                %>
                <tr>
                    <td><%= quizIdFromDb %></td>
                    <td><%= quizTitleFromDb %></td>
                    <td>
                        <form action="manageQuizzes.jsp" method="post" class="d-inline">
                            <input type="hidden" name="quizId" value="<%= quizIdFromDb %>">
                            <button type="submit" name="action" value="delete" class="btn btn-danger btn-sm">Delete</button>
                        </form>
                    </td>
                </tr>
                <%
                        }
                    } catch (Exception e) {
                        out.println("<p style='color: red;'>Error: " + e.getMessage() + "</p>");
                    } finally {
                        if (rs != null) try { rs.close(); } catch (SQLException ignored) {}
                        if (pstmt != null) try { pstmt.close(); } catch (SQLException ignored) {}
                        if (conn != null) try { conn.close(); } catch (SQLException ignored) {}
                    }
                %>
            </tbody>
        </table>
    </div>
</div>

<!-- Footer -->
<footer class="footer-sec">
    <p>&copy; 2024 QuizMaster. Ready to learn something new today?</p>
</footer>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

