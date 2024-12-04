package in.sp.backend.Controllers;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

@WebServlet("/regform")
public class RegisterFormservlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        String name = req.getParameter("username");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        String role = req.getParameter("role");

        // Validate input parameters
        if (name == null || password == null || email == null || role == null) {
            req.setAttribute("errorMessage", "All fields are required.");
            RequestDispatcher rd = req.getRequestDispatcher("/register.jsp");
            rd.forward(req, resp);
            return;
        }

        String hashedPassword = null;

        // Hash the password using SHA-256, handle NoSuchAlgorithmException
        try {
            hashedPassword = hashPassword(password);
        } catch (NoSuchAlgorithmException e) {
            req.setAttribute("errorMessage", "Error hashing password: " + e.getMessage());
            RequestDispatcher rd = req.getRequestDispatcher("/register.jsp");
            rd.forward(req, resp);
            return;
        }

        // Database connection details
        String jdbcURL = "jdbc:mysql://localhost:3306/quiz";
        String dbUser = "root";
        String dbPassword = "Shivam123@";

        try {
            // Explicitly load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword)) {
                String insertQuery;
                String userTable = "";

                // Determine the table and query based on the role
                switch (role) {
                    case "admin":
                        insertQuery = "INSERT INTO admins (username, password, email) VALUES (?, ?, ?)";
                        userTable = "admins";
                        break;
                    case "teacher":
                        insertQuery = "INSERT INTO teachers (username, password, email) VALUES (?, ?, ?)";
                        userTable = "teachers";
                        break;
                    case "student":
                        insertQuery = "INSERT INTO students (username, password, email) VALUES (?, ?, ?)";
                        userTable = "students";
                        break;
                    default:
                        req.setAttribute("errorMessage", "Invalid role selected.");
                        RequestDispatcher rd = req.getRequestDispatcher("/register.jsp");
                        rd.forward(req, resp);
                        return;
                }

                try (PreparedStatement statement = connection.prepareStatement(insertQuery, PreparedStatement.RETURN_GENERATED_KEYS)) {
                    statement.setString(1, name);
                    statement.setString(2, hashedPassword);
                    statement.setString(3, email);
                    int rowsAffected = statement.executeUpdate();

                    if (rowsAffected > 0) {
                        // Retrieve the generated user ID from the insert operation
                        ResultSet generatedKeys = statement.getGeneratedKeys();
                        if (generatedKeys.next()) {
                            int userId = generatedKeys.getInt(1);

                            // Set userId in session
                            HttpSession session = req.getSession();
                            session.setAttribute("userId", userId);

                            // Registration successful, redirect to login page
                            resp.sendRedirect("index.jsp");
                        } else {
                            // Handle case where no userId was generated
                            req.setAttribute("errorMessage", "Registration failed. Please try again.");
                            RequestDispatcher rd = req.getRequestDispatcher("/register.jsp");
                            rd.forward(req, resp);
                        }
                    } else {
                        // Registration failed, display error message
                        req.setAttribute("errorMessage", "Registration failed. Please try again.");
                        RequestDispatcher rd = req.getRequestDispatcher("/register.jsp");
                        rd.forward(req, resp);
                    }
                }

            }

        } catch (Exception e) {
            e.printStackTrace();
            resp.setContentType("text/html");
            req.setAttribute("errorMessage", "An error occurred while processing your registration.");
            RequestDispatcher rd = req.getRequestDispatcher("/register.jsp");
            rd.forward(req, resp);
        }
    }

    // Method to hash the password using SHA-256
    private String hashPassword(String password) throws NoSuchAlgorithmException {
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        byte[] hash = digest.digest(password.getBytes());
        StringBuilder hexString = new StringBuilder();
        for (byte b : hash) {
            String hex = Integer.toHexString(0xff & b);
            if (hex.length() == 1) {
                hexString.append('0');
            }
            hexString.append(hex);
        }
        return hexString.toString();
    }
}
