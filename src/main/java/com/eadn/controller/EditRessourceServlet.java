package com.eadn.controller;

import com.eadn.entity.Ressource;
import com.eadn.service.RessourceService;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/ressource/edit/*")
public class EditRessourceServlet extends HttpServlet {

    @Inject
    private RessourceService service;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long id = Long.parseLong(req.getPathInfo().substring(1));
        Ressource r = service.findById(id);
        req.setAttribute("ressource", r);
        req.getRequestDispatcher("/views/editRessource.jsp").forward(req, resp);
    }
}
