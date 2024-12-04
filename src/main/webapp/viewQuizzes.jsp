<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Quizzes</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }

        .container {
            margin-top: 50px;
        }

        .table {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .table th {
            background-color: #007bff;
            color: white;
        }

        .table td {
            padding: 15px;
            vertical-align: middle;
        }

        button {
            padding: 6px 12px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #218838;
        }

        .page-title {
            text-align: center;
            color: #343a40;
            margin-bottom: 30px;
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
    // Retrieve the user's role from session
    String role = (String) session.getAttribute("role");
    String homeLink = "index.jsp"; // Default link

    // Check the user's role and set the home link accordingly
    if ("student".equalsIgnoreCase(role)) {
        homeLink = "studentDashboard.jsp"; // Redirect to student dashboard
    } else if ("admin".equalsIgnoreCase(role)) {
        homeLink = "adminDashboard.jsp"; // Redirect to admin dashboard
    }
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
                    <a class="nav-link" href="<%= homeLink %>">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="viewQuizzes.jsp">Quizzes</a>
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

<!-- Container for the content -->
<div class="container">
    <h1 class="page-title">Available Quizzes</h1>

    <%
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            // Database connection setup
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz", "root", "Shivam123@");

            // Query to fetch quizzes
            String query = "SELECT id, title, description FROM quizzes";
            pstmt = conn.prepareStatement(query);
            rs = pstmt.executeQuery();

            // Display quizzes in a table
            out.println("<table class='table table-striped'>");
            out.println("<thead>");
            out.println("<tr><th>ID</th><th>Title</th><th>Description</th><th>Action</th></tr>");
            out.println("</thead>");
            out.println("<tbody>");
            while (rs.next()) {
                int quizId = rs.getInt("id");
                String title = rs.getString("title");
                String description = rs.getString("description");

                out.println("<tr>");
                out.println("<td>" + quizId + "</td>");
                out.println("<td>" + title + "</td>");
                out.println("<td>" + description + "</td>");
                out.println("<td>");
                out.println("<form action='take_quiz.jsp' method='get'>");
                out.println("<input type='hidden' name='quizId' value='" + quizId + "' />");
                out.println("<button type='submit'>Take Quiz</button>");
                out.println("</form>");
                out.println("</td>");
                out.println("</tr>");
            }
            out.println("</tbody>");
            out.println("</table>");
        } catch (Exception e) {
            out.println("<p style='color: red;'>Error: " + e.getMessage() + "</p>");
        } finally {
            // Clean up resources
            if (rs != null) try { rs.close(); } catch (SQLException ignored) {}
            if (pstmt != null) try { pstmt.close(); } catch (SQLException ignored) {}
            if (conn != null) try { conn.close(); } catch (SQLException ignored) {}
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
