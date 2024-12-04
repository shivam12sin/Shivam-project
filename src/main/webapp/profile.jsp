<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }

        .profile-card {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-top: 50px;
        }

        .profile-card h2 {
            text-align: center;
            color: #007bff;
        }

        .table {
            margin-top: 20px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .table th {
            background-color: #007bff;
            color: white;
        }

        .table td {
            padding: 10px;
            text-align: center;
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
<%
    // Retrieve the user's role and other information from session
    String username = (String) session.getAttribute("username");
    String email = (String) session.getAttribute("email");
%>

<nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #007bff;">
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

<!-- Profile Section -->
<div class="container">
    <div class="profile-card">
        <h2>User Profile</h2>

        <p><strong>Username:</strong> <%= username %></p>
        <p><strong>Email:</strong> <%= email %></p>

        <h4>Quizzes Taken and Scores</h4>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Quiz Title</th>
                    <th>Score</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Connection conn = null;
                    PreparedStatement pstmt = null;
                    ResultSet rs = null;
                    try {
                        // Database connection setup
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz", "root", "Shivam123@");

                        // Query to fetch quizzes and scores for the logged-in user
                        String query = "SELECT q.title, qr.score " +
                                       "FROM quiz_result qr " +
                                       "JOIN quizzes q ON qr.quiz_id = q.id " +
                                       "JOIN students s ON qr.student_id = s.id " +
                                       "WHERE s.username = ?";
                        pstmt = conn.prepareStatement(query);
                        pstmt.setString(1, username); // Use session username to fetch data
                        rs = pstmt.executeQuery();

                        // Display quizzes and scores
                        while (rs.next()) {
                            String quizTitle = rs.getString("title");
                            int score = rs.getInt("score");

                            out.println("<tr>");
                            out.println("<td>" + quizTitle + "</td>");
                            out.println("<td>" + score + "</td>");
                            out.println("</tr>");
                        }
                    } catch (Exception e) {
                        out.println("<p style='color: red;'>Error: " + e.getMessage() + "</p>");
                    } finally {
                        // Clean up resources
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


