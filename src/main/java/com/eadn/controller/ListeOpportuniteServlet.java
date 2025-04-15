package com.eadn.controller;

import com.eadn.entity.Opportunite;
import com.eadn.service.OpportuniteService;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/opportunite/liste")
public class ListeOpportuniteServlet extends HttpServlet {

    @Inject
    private OpportuniteService opportuniteService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Opportunite> opportunites = (List<Opportunite>) opportuniteService.findAll();
        request.setAttribute("opportunites", opportunites);

        request.getRequestDispatcher("/views/listeOpportunite.jsp").forward(request, response);
    }
}
