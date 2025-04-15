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
import java.sql.Date;

@WebServlet("/projet/update")
public class UpdateProjetServlet extends HttpServlet {

    @Inject
    private ProjetService projetService;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {
            Long id = Long.parseLong(req.getParameter("id"));
            Projet projet = projetService.findById(id);

            if (projet != null) {
                projet.setNom(req.getParameter("nom"));
                projet.setNomCourt(req.getParameter("nomCourt"));
                projet.setDescription(req.getParameter("description"));
                projet.setBudget(Double.parseDouble(req.getParameter("budget")));
                projet.setStatus(req.getParameter("status"));
                projet.setDateDebut(Date.valueOf(req.getParameter("dateDebut")));
                projet.setDateFin(Date.valueOf(req.getParameter("dateFin")));

                // Récupération du responsable et du compte comme texte
                projet.setResponsable(req.getParameter("responsable"));
                projet.setCompte(req.getParameter("compte"));

                // Mise à jour
                projetService.update(projet);
            }

            // Redirection après mise à jour
            resp.sendRedirect(req.getContextPath() + "/views/listeProjet.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Erreur lors de la mise à jour du projet.");
            req.getRequestDispatcher("/views/projet.jsp").forward(req, resp);
        }
    }
}
