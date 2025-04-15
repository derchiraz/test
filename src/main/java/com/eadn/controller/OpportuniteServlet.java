package com.eadn.controller;

import com.eadn.entity.Opportunite;
import com.eadn.service.OpportuniteService;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.text.SimpleDateFormat;

@WebServlet("/opportunite/save")
@MultipartConfig
public class OpportuniteServlet extends HttpServlet {

    @Inject
    private OpportuniteService service;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            Opportunite o = new Opportunite("OP001", "Client A", "Entreprise A", "En cours", "01/01/2024", "31/03/2024", "500000 DA");
            o.setNomEntreprise(request.getParameter("nom_entreprise"));
            o.setNomContact(request.getParameter("nom_contact"));
            o.setTelephone(request.getParameter("telephone"));
            o.setEmail(request.getParameter("email"));
            o.setAdresse(request.getParameter("adresse"));
            o.setNomOpportunite(request.getParameter("nom_opportunite"));
            o.setDescriptionOpportunite(request.getParameter("description_opportunite"));
            o.setBudgetEstime(Double.parseDouble(request.getParameter("budget_estime")));
            o.setStatus(request.getParameter("status"));

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            o.setDateDebut(sdf.parse(request.getParameter("dateDebut")));
            o.setDateFin(sdf.parse(request.getParameter("dateFin")));

            o.setObjectifsPrincipaux(request.getParameter("objectifs_principaux"));
            o.setDescriptionArchitecture(request.getParameter("description_architecture"));
            o.setResponsable(request.getParameter("responsable"));
            o.setMembre1(request.getParameter("membre1"));
            o.setMembre2(request.getParameter("membre2"));
            o.setMembre3(request.getParameter("membre3"));

            // Gestion fichier (nom seulement ici)
            Part filePart = request.getPart("file");
            if (filePart != null && filePart.getSize() > 0) {
                String fileName = filePart.getSubmittedFileName();
                o.setNomFichier(fileName);
                // Pour enregistrer le fichier sur le disque, tu peux utiliser filePart.write(...)
            }

            service.create(o);

            request.setAttribute("successMessage", "Opportunité enregistrée avec succès !");
            request.getRequestDispatcher("/views/opportunite.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Erreur lors de l'enregistrement de l'opportunité.");
            request.getRequestDispatcher("/views/opportunite.jsp").forward(request, response);
        }
    }
}
