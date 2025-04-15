package com.eadn.controller;

import com.eadn.service.OpportuniteService;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/opportunite/delete")
public class SupprimerOpportuniteServlet extends HttpServlet {

    @Inject
    private OpportuniteService service;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Long id = Long.parseLong(request.getParameter("id"));
        service.delete(id);
        request.setAttribute("successMessage", "Opportunité supprimée avec succès !");
        response.sendRedirect(request.getContextPath() + "/opportunite/liste");
    }
}
