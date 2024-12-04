<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    // Invalidate the current session
    if (session != null) {
        session.invalidate();
    }

    // Redirect to the login page (or home page)
    String loginPage = "index.jsp";
    response.sendRedirect(loginPage);
%>
