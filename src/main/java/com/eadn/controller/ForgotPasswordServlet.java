package com.eadn.controller;

import com.eadn.dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.UUID;

@WebServlet("/forgot-password")
public class ForgotPasswordServlet extends HttpServlet {
    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String email = request.getParameter("email");

        try {
            String resetToken = UUID.randomUUID().toString();
            userDAO.updateResetToken(email, resetToken);
            
            // Here you would normally send an email with the reset link
            // For demonstration, we'll just show a success message
            request.setAttribute("message", "Reset link has been sent to your email");
            request.getRequestDispatcher("/WEB-INF/views/forgot-password.jsp")
                  .forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "An error occurred");
            request.getRequestDispatcher("/WEB-INF/views/forgot-password.jsp")
                  .forward(request, response);
        }
    }
}