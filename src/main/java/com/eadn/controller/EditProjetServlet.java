package com.eadn.controller;

import com.eadn.entity.Projet;
import com.eadn.service.CompteService;
import com.eadn.service.ProjetService;
import com.eadn.service.UtilisateurService;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/projet/edit/*") // avec wildcard
public class EditProjetServlet extends HttpServlet {
    @Inject ProjetService service;
    @Inject UtilisateurService utilisateurService;
    @Inject CompteService compteService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long id = Long.parseLong(req.getPathInfo().substring(1));
        Projet projet = service.findById(id);
        req.setAttribute("projet", projet);
        //req.setAttribute("responsables", utilisateurService.findAll());
        req.setAttribute("comptes", compteService.findAll());

        req.getRequestDispatcher("/views/projet.jsp").forward(req, resp);
    }
}
