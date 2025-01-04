package in.sp.backend.Controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static jdk.internal.org.objectweb.asm.util.CheckClassAdapter.verify;
import static org.mockito.Mockito.*;
import static org.junit.jupiter.api.Assertions.*;
import static org.powermock.api.mockito.PowerMockito.mock;
import static org.powermock.api.mockito.PowerMockito.when;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginFormServletTest {

   private LoginFormServlet loginFormServlet;
   private HttpServletRequest request;
   private HttpServletResponse response;

   @BeforeEach
   public void setUp() {
       loginFormServlet = new LoginFormServlet();
       request = mock(HttpServletRequest.class);
       response = mock(HttpServletResponse.class);
   }

   @Test
   public void testValidLogin() throws Exception {
       // Mocking request parameters
       when(request.getParameter("username")).thenReturn("testUser");
       when(request.getParameter("password")).thenReturn("testPassword");
       when(request.getParameter("role")).thenReturn("admin");

       // Mocking database result set for a valid user
       Connection connection = mock(Connection.class);
       PreparedStatement preparedStatement = mock(PreparedStatement.class);
       ResultSet resultSet = mock(ResultSet.class);

       when(connection.prepareStatement(anyString())).thenReturn(preparedStatement);
       when(preparedStatement.executeQuery()).thenReturn(resultSet);
       when(resultSet.next()).thenReturn(true);  // Simulating that a valid user is found

       // Simulate servlet behavior
       loginFormServlet.doPost(request, response);

       // Verify that the correct redirection happens (for example, to admin dashboard)
       verify(response).sendRedirect("adminDashboard.jsp");
   }

   @Test
   public void testInvalidLogin() throws Exception {
       // Mocking request parameters
       when(request.getParameter("username")).thenReturn("invalidUser");
       when(request.getParameter("password")).thenReturn("wrongPassword");
       when(request.getParameter("role")).thenReturn("admin");

       // Mocking database result set for an invalid user
       Connection connection = mock(Connection.class);
       PreparedStatement preparedStatement = mock(PreparedStatement.class);
       ResultSet resultSet = mock(ResultSet.class);

       when(connection.prepareStatement(anyString())).thenReturn(preparedStatement);
       when(preparedStatement.executeQuery()).thenReturn(resultSet);
       when(resultSet.next()).thenReturn(false);  // Simulating that no user is found

       // Simulate servlet behavior
       loginFormServlet.doPost(request, response);

       // Verify that the error message is set and forwarded to index.jsp
       verify(request).setAttribute("errorMessage", "Invalid username or password.");
       RequestDispatcher requestDispatcher = mock(RequestDispatcher.class);
       when(request.getRequestDispatcher("/index.jsp")).thenReturn(requestDispatcher);
       verify(requestDispatcher).forward(request, response);
   }

   @Test
   public void testDatabaseError() throws Exception {
       // Mocking request parameters
       when(request.getParameter("username")).thenReturn("testUser");
       when(request.getParameter("password")).thenReturn("testPassword");
       when(request.getParameter("role")).thenReturn("admin");

       // Simulating a database connection error
       when(mock(Connection.class).prepareStatement(anyString())).thenThrow(new IOException("Database error"));

       // Simulate servlet behavior
       loginFormServlet.doPost(request, response);

       // Verify that the error message is set and forwarded to index.jsp
       verify(request).setAttribute("errorMessage", "An error occurred while processing your request.");
       RequestDispatcher requestDispatcher = mock(RequestDispatcher.class);
       when(request.getRequestDispatcher("/index.jsp")).thenReturn(requestDispatcher);
       verify(requestDispatcher).forward(request, response);


   }
}



