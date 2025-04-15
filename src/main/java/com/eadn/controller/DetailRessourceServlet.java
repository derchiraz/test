package com.eadn.controller;

import com.eadn.entity.Ressource;
import com.eadn.service.RessourceService;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/ressource/detail/*")
public class DetailRessourceServlet extends HttpServlet {

    @Inject
    private RessourceService service;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {
            Long id = Long.parseLong(req.getPathInfo().substring(1));
            Ressource ressource = service.findById(id);

            if (ressource != null) {
                req.setAttribute("ressource", ressource);
                req.getRequestDispatcher("/views/detailRessource.jsp").forward(req, resp);
            } else {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Ressource introuvable.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erreur lors de l'accès à la ressource.");
        }
    }
}
