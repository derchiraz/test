package com.eadn.controller;

import com.eadn.entity.Ressource;
import com.eadn.service.RessourceService;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/ressource/liste")
public class ListeRessourceServlet extends HttpServlet {

    @Inject
    private RessourceService ressourceService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Ressource> ressources = ressourceService.findAll();
        request.setAttribute("ressources", ressources);

        request.getRequestDispatcher("/views/listeRessources.jsp").forward(request, response);
    }
}
