package com.eadn.controller;


import com.eadn.entity.Projet;
import com.eadn.service.ProjetService;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/projet/valider")
public class ValiderProjetServlet extends HttpServlet {

    @Inject
    ProjetService projetService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long id = Long.parseLong(req.getParameter("id"));
        Projet projet = projetService.findById(id);

        if (projet != null) {
            projet.setStatus("validated");
            projetService.update(projet);
        }

        resp.sendRedirect(req.getContextPath() + "/views/listeProjet.jsp");
    }
}
