<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quiz Results</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }
        .result {
            margin-top: 20px;
            padding: 20px;
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .navbar {
            background-color: #007bff;
        }
        .navbar-brand, .nav-link {
            color: white;
        }
        .navbar-nav .nav-link:hover {
            color: #d4d4d4;
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
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">QuizMaster</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="studentDashboard.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="profile.jsp">My Profile</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="logout.jsp">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Results Section -->
<div class="container">
    <h1 class="text-center mt-5">Quiz Results</h1>

    <%
        String quizId = request.getParameter("quizId");

        // Retrieve userId as Integer from session
        Integer studentId = (Integer) session.getAttribute("userId");  // Correct casting to Integer

        // Ensure the userId is not null
        if (studentId == null) {
            out.println("<p class='text-danger'>Error: You must be logged in to view your results. Please <a href='login.jsp'>log in</a>.</p>");
            return;
        }

        out.println("<p>Student ID from session: " + studentId + "</p>");

        if (quizId == null) {
            out.println("<p class='text-danger'>Error: No quiz selected!</p>");
        } else {
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            int totalQuestions = 0;
            int correctAnswers = 0;

            try {
                // Database connection setup
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz", "root", "Shivam123@");

                // Query to fetch questions and correct answers for the quiz
                String query = "SELECT id, correct_option FROM questions WHERE quiz_id = ?";
                pstmt = conn.prepareStatement(query);
                pstmt.setInt(1, Integer.parseInt(quizId));  // Ensure quizId is used correctly
                rs = pstmt.executeQuery();

                // Process each question
                while (rs.next()) {
                    totalQuestions++;
                    int questionId = rs.getInt("id");
                    String correctOption = rs.getString("correct_option");

                    // Get the student's answer
                    String studentAnswer = request.getParameter("question_" + questionId);

                    // Check if the answer is correct
                    if (studentAnswer != null && studentAnswer.equalsIgnoreCase(correctOption)) {
                        correctAnswers++;
                    }
                }

                // Insert result into quiz_result table
                String insertQuery = "INSERT INTO quiz_result (student_id, quiz_id, score, correct_answers, total_questions) VALUES (?, ?, ?, ?, ?)";
                pstmt = conn.prepareStatement(insertQuery);
                pstmt.setInt(1, studentId); // Use studentId as Integer
                pstmt.setInt(2, Integer.parseInt(quizId));
                pstmt.setInt(3, (correctAnswers * 100 / totalQuestions)); // Score as percentage
                pstmt.setInt(4, correctAnswers);
                pstmt.setInt(5, totalQuestions);
                pstmt.executeUpdate();

                // Display the results
                out.println("<div class='result'>");
                out.println("<p><strong>Total Questions:</strong> " + totalQuestions + "</p>");
                out.println("<p><strong>Correct Answers:</strong> " + correctAnswers + "</p>");
                out.println("<p><strong>Your Score:</strong> " + (correctAnswers * 100 / totalQuestions) + "%</p>");
                out.println("</div>");

            } catch (Exception e) {
                out.println("<p class='text-danger'>Error: " + e.getMessage() + "</p>");
            } finally {
                // Clean up resources
                if (rs != null) try { rs.close(); } catch (SQLException ignored) {}
                if (pstmt != null) try { pstmt.close(); } catch (SQLException ignored) {}
                if (conn != null) try { conn.close(); } catch (SQLException ignored) {}
            }
        }
    %>
</div>

<!-- Footer -->
<footer class="footer-sec">
    <p>&copy; 2024 QuizMaster. Ready to learn something new today?</p>
</footer>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>



