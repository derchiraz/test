package com.eadn.controller;

import com.eadn.entity.Coordonnee;
import com.eadn.entity.Utilisateur;
import com.eadn.service.CoordonneeService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/coordonnees")
public class CoordonneeServlet extends HttpServlet {

    private CoordonneeService coordonneeService;

    @Override
    public void init() {
        coordonneeService = new CoordonneeService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Utilisateur utilisateur = (Utilisateur) session.getAttribute("utilisateur");

        if (utilisateur == null) {
            response.sendRedirect(request.getContextPath() + "/views/login.jsp");
            return;
        }

        Coordonnee coordonnee = coordonneeService.findByUtilisateurId(utilisateur.getId());
        request.setAttribute("coordonnee", coordonnee);

        request.getRequestDispatcher("/views/coordonne.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Utilisateur utilisateur = (Utilisateur) session.getAttribute("utilisateur");

        if (utilisateur == null) {
            response.sendRedirect(request.getContextPath() + "/views/login.jsp");
            return;
        }

        String nom = request.getParameter("nom");
        String titre = request.getParameter("titre");
        String service = request.getParameter("service");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String disponibilite = request.getParameter("disponibilite");

        Coordonnee coordonnee = coordonneeService.findByUtilisateurId(utilisateur.getId());

        if (coordonnee == null) {
            coordonnee = new Coordonnee();
            coordonnee.setUtilisateur(utilisateur);
        }

        coordonnee.setNom(nom);
        coordonnee.setTitre(titre);
        coordonnee.setService(service);
        coordonnee.setEmail(email);
        coordonnee.setPhone(phone);
        coordonnee.setDisponibilite(disponibilite);

        try {
            coordonneeService.saveOrUpdate(coordonnee);
            request.setAttribute("message", "Coordonnées mises à jour avec succès");
        } catch (Exception e) {
            request.setAttribute("error", "Erreur lors de la mise à jour des coordonnées");
        }

        request.setAttribute("coordonnee", coordonnee);
        request.getRequestDispatcher("/views/coordonne.jsp").forward(request, response);
    }
}
