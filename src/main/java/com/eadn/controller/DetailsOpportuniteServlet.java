package com.eadn.controller;

import com.eadn.entity.Opportunite;
import com.eadn.service.OpportuniteService;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/opportunite/details/*")
public class DetailsOpportuniteServlet extends HttpServlet {

    @Inject
    private OpportuniteService service;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String pathInfo = request.getPathInfo(); // /{id}
        if (pathInfo != null && pathInfo.length() > 1) {
            Long id = Long.parseLong(pathInfo.substring(1));
            Opportunite o = service.findById(id);
            request.setAttribute("opportunite", o);
            request.getRequestDispatcher("/views/detailsOpportunite.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/opportunite/liste");
        }
    }
}
