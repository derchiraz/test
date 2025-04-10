package com.eadn.controller;

import com.eadn.dao.UserDAO;
import com.eadn.entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            User user = (User) userDAO.findByEmail(email);
            if (user != null && verifyPassword(password, user.getPassword())) {
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                response.sendRedirect("dashboard");
            } else {
                request.setAttribute("error", "Invalid credentials");
                request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("error", "An error occurred");
            request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
        }
    }

    private boolean verifyPassword(String inputPassword, String storedPassword) {
        
        return inputPassword.equals(storedPassword); 
    }
}