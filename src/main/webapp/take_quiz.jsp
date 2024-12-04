<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Take Quiz</title>
    <!-- Bootstrap CSS for styling -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
        }

        h1 {
            text-align: center;
            margin-bottom: 40px;
            color: #007bff;
        }

        .question {
            margin-bottom: 20px;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .options {
            margin-left: 20px;
        }

        .question p {
            font-size: 18px;
            font-weight: bold;
        }

        .options input[type="radio"] {
            margin-right: 10px;
        }

        button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 12px 20px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
            width: 100%;
        }

        button:hover {
            background-color: #0056b3;
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

        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }

        .footer-sec {
            padding: 20px 0;
            background-color: #007bff;
            color: white;
            text-align: center;
            margin-top: 40px;
        }

        .alert {
            text-align: center;
            margin-top: 20px;
        }

        .timer {
            font-size: 24px;
            font-weight: bold;
            color: #ffffff; /* White text color */
            text-align: center;
            margin-top: 20px;
            background-color: #ff5733; /* Red background */
            padding: 10px;
            border-radius: 5px;
            width: 100%;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
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

<div class="container">
    <%
        String quizId = request.getParameter("quizId");
        if (quizId == null) {
            out.println("<div class='alert alert-danger'>Error: No quiz selected!</div>");
        } else {
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            try {
                // Database connection setup
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz", "root", "Shivam123@");

                // Query to fetch questions for the selected quiz
                String query = "SELECT id, question_text, option_a, option_b, option_c, option_d FROM questions WHERE quiz_id = ?";
                pstmt = conn.prepareStatement(query);
                pstmt.setInt(1, Integer.parseInt(quizId));
                rs = pstmt.executeQuery();

                // Display quiz questions
                out.println("<h1>Take Quiz</h1>");
                out.println("<form id='quizForm' action='submit_quiz.jsp' method='post'>");
                out.println("<input type='hidden' name='quizId' value='" + quizId + "' />");

                int questionCount = 0;
                while (rs.next()) {
                    questionCount++;
                    int questionId = rs.getInt("id");
                    String questionText = rs.getString("question_text");
                    String optionA = rs.getString("option_a");
                    String optionB = rs.getString("option_b");
                    String optionC = rs.getString("option_c");
                    String optionD = rs.getString("option_d");

                    out.println("<div class='question'>");
                    out.println("<p>" + questionCount + ". " + questionText + "</p>");
                    out.println("<div class='options'>");
                    out.println("<input type='radio' name='question_" + questionId + "' value='A'> " + optionA + "<br>");
                    out.println("<input type='radio' name='question_" + questionId + "' value='B'> " + optionB + "<br>");
                    out.println("<input type='radio' name='question_" + questionId + "' value='C'> " + optionC + "<br>");
                    out.println("<input type='radio' name='question_" + questionId + "' value='D'> " + optionD + "<br>");
                    out.println("</div>");
                    out.println("</div>");
                }

                if (questionCount == 0) {
                    out.println("<p>No questions available for this quiz.</p>");
                } else {
                    out.println("<button type='submit'>Submit Quiz</button>");
                }

                out.println("</form>");
            } catch (Exception e) {
                out.println("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException ignored) {}
                if (pstmt != null) try { pstmt.close(); } catch (SQLException ignored) {}
                if (conn != null) try { conn.close(); } catch (SQLException ignored) {}
            }
        }
    %>

    <!-- Timer Display -->
    <div class="timer" id="timerDisplay">Time remaining: 1:00</div>
</div>

<!-- Footer -->
<footer class="footer-sec">
    <p>&copy; 2024 QuizMaster. Ready to learn something new today?</p>
</footer>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
    // Set the countdown time in seconds (60 seconds = 1 minute)
    let timeLeft = 60;
    const timerDisplay = document.getElementById('timerDisplay');
    const quizForm = document.getElementById('quizForm');

    // Function to update the timer
    function updateTimer() {
        let minutes = Math.floor(timeLeft / 60);
        let seconds = timeLeft % 60;

        // Adding leading zero for seconds if it is less than 10
        seconds = seconds < 10 ? '0' + seconds : seconds;

        // Displaying the timer in the correct format
        timerDisplay.innerHTML = `Time remaining: ${minutes}:${seconds}`;

        // If time is up, submit the form
        if (timeLeft <= 0) {
            quizForm.submit();  // Automatically submit the form when time runs out
        } else {
            timeLeft--;  // Decrement the time left
        }
    }

    // Start the countdown and display timer immediately
    setInterval(updateTimer, 1000);  // Update timer every second
</script>

</body>
</html>







