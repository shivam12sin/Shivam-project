package in.sp.backend.Controllers;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

@WebServlet("/loginform")
public class LoginFormServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String role = req.getParameter("role");
        String jdbcURL = "jdbc:mysql://localhost:3306/quiz";
        String dbUser = "root";
        String dbPassword = "Shivam123@";

        try {
            // Hash the password for comparison (for better security, use a library like bcrypt)
            String hashedPassword = hashPassword(password);

            // Explicitly load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword)) {
                String selectQuery = null;

                // Select query based on the role
                switch (role) {
                    case "admin":
                        selectQuery = "SELECT * FROM admins WHERE username = ? AND password = ?";
                        break;
                    case "teacher":
                        selectQuery = "SELECT * FROM teachers WHERE username = ? AND password = ?";
                        break;
                    case "student":
                        selectQuery = "SELECT * FROM students WHERE username = ? AND password = ?";
                        break;
                    default:
                        throw new IllegalArgumentException("Invalid role selected");
                }


                try (PreparedStatement statement = connection.prepareStatement(selectQuery)) {
                    statement.setString(1, username);
                    statement.setString(2, hashedPassword);  // Use hashed password for comparison

                    try (ResultSet rs = statement.executeQuery()) {
                        if (rs.next()) {
                            // User authenticated, create session
                            HttpSession session = req.getSession();
                            session.setAttribute("username", username);
                            session.setAttribute("role", role);

                            // Get the user ID (student, teacher, or admin)
                            int userId = rs.getInt("id");
                            session.setAttribute("userId", userId);  // Store userId in session

                            // Debug logging
//                            System.out.println("Authenticated user: " + username);
//                            System.out.println("Role: " + role);
//                            System.out.println("UserID: " + userId);

                            // Redirect based on role
                            if ("admin".equals(role)) {
                                resp.sendRedirect("adminDashboard.jsp");  // Redirect to admin dashboard
                            } else {
                                resp.sendRedirect(role + "Dashboard.jsp");  // Redirect to student/teacher dashboard
                            }
                        } else {
                            // Invalid credentials
                            req.setAttribute("errorMessage", "Invalid username or password.");
                            RequestDispatcher rd = req.getRequestDispatcher("/index.jsp");
                            rd.forward(req, resp);
                        }
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            resp.setContentType("text/html");
            req.setAttribute("errorMessage", "An error occurred while processing your request.");
            RequestDispatcher rd = req.getRequestDispatcher("/index.jsp");
            rd.forward(req, resp);
        }
    }

    // Method to hash the password using SHA-256 (for simplicity, consider bcrypt for better security)
    private String hashPassword(String password) throws NoSuchAlgorithmException {
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        byte[] hash = digest.digest(password.getBytes());
        StringBuilder hexString = new StringBuilder();
        for (byte b : hash) {
            hexString.append(String.format("%02x", b));
        }
        return hexString.toString();
    }
}



