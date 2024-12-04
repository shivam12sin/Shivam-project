package com.Shivam.registration;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/register") // Map the servlet to "/register" URL
public class RegistrationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException ,IOException {
        // Set response content type
//        response.setContentType("text/html");

        // Get PrintWriter to send a response
        PrintWriter out = response.getWriter();
        out.print("Registration Servlet is working!");
    }
}


