package com.eadn.controller;

import com.eadn.entity.Ressource;
import com.eadn.service.RessourceService;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.text.SimpleDateFormat;

@WebServlet("/ressource/save")
public class RessourceServlet extends HttpServlet {

    @Inject
    private RessourceService service;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            Ressource r = new Ressource();
            r.setCode(request.getParameter("code"));
            r.setNom(request.getParameter("nom"));
            r.setIdentite(request.getParameter("identite"));
            r.setQualification(request.getParameter("qualification"));
            r.setNationalite(request.getParameter("nationalite"));
            r.setGenre(request.getParameter("genre"));
            r.setPoste(request.getParameter("poste"));
            r.setTelephone(request.getParameter("telephone"));
            r.setEmail(request.getParameter("email"));
            r.setSalaire(Double.parseDouble(request.getParameter("salaire")));
            r.setBranche(request.getParameter("branche"));
            r.setAdresse(request.getParameter("adresse"));
            r.setContrat(request.getParameter("contrat"));

            // Format de date depuis input HTML
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            r.setDateNaissance(sdf.parse(request.getParameter("dateNaissance")));
            r.setDateDebut(sdf.parse(request.getParameter("dateDebut")));
            r.setDateFin(sdf.parse(request.getParameter("dateFin")));

            service.save(r);

            request.setAttribute("successMessage", "Ressource enregistrée avec succès !");
            request.getRequestDispatcher("/views/ressources.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Erreur lors de l'enregistrement de la ressource.");
            request.getRequestDispatcher("/views/ressources.jsp").forward(request, response);
        }
    }
}
