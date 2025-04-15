package com.eadn.controller;


import com.eadn.entity.Opportunite;
import com.eadn.service.OpportuniteService;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/opportunite/edit/*")
public class EditOpportuniteServlet extends HttpServlet {
    @Inject OpportuniteService service;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long id = Long.parseLong(req.getPathInfo().substring(1));
        Opportunite o = service.findById(id);
        req.setAttribute("opportunite", o);
        req.getRequestDispatcher("/views/editOpportunite.jsp").forward(req, resp);
    }
}
