package com.eadn.controller;

import com.eadn.service.ProjetService;
import com.eadn.service.UtilisateurService;
import com.eadn.entity.Projet;
import com.eadn.entity.Utilisateur;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/projet/liste")
public class ListeProjetServlet extends HttpServlet {

    @Inject
    private ProjetService projetService;

    @Inject
    private UtilisateurService utilisateurService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            List<Projet> projets = projetService.findAll();
            List<Utilisateur> responsables = utilisateurService.findAll();

            request.setAttribute("projets", projets);
            request.setAttribute("responsables", responsables);

            request.getRequestDispatcher("/views/listeProjet.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Erreur lors du chargement des projets.");
            request.getRequestDispatcher("/views/listeProjet.jsp").forward(request, response);
        }
    }
}
