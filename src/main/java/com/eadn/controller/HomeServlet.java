package com.eadn.controller;

import com.eadn.service.HomeService;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/home")
public class HomeServlet extends HttpServlet {

    @Inject
    private HomeService dashboardService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Exemple : récupérer l'utilisateur connecté depuis la session
        HttpSession session = request.getSession();
        String utilisateurId = (String) session.getAttribute("userId");

        // Statistiques globales
        int totalEmployes = dashboardService.getTotalEmployes();
        int nouveauxEmployes = dashboardService.getNouveauxEmployesCeMois();
        int totalProjets = dashboardService.getTotalProjets();
        int projetsActifs = dashboardService.getProjetsActifs();

        // Pour graphique
        List<Integer> evolutionMensuelle = dashboardService.getEmployesParMois();
        List<Integer> statsProjets = dashboardService.getStatutsProjet();

        // Affectations
        request.setAttribute("totalEmployes", totalEmployes);
        request.setAttribute("nouveauxEmployes", nouveauxEmployes);
        request.setAttribute("totalProjets", totalProjets);
        request.setAttribute("projetsActifs", projetsActifs);
        request.setAttribute("evolutionMensuelle", evolutionMensuelle);
        request.setAttribute("statsProjets", statsProjets);

        // Redirection vers le dashboard
        request.getRequestDispatcher("/views/home.jsp").forward(request, response);
    }
}
