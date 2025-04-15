
package com.eadn.controller;

import com.eadn.entity.Opportunite;
import com.eadn.service.OpportuniteService;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;

@WebServlet("/opportunite/update")
public class UpdateOpportuniteServlet extends HttpServlet {
    @Inject
    OpportuniteService service;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            Long id = Long.parseLong(req.getParameter("id"));
            Opportunite opportunite = service.findById(id);

            if (opportunite != null) {
                opportunite.setNomEntreprise(req.getParameter("nomEntreprise"));
                opportunite.setContact(req.getParameter("contact"));
                opportunite.setTelephone(req.getParameter("telephone"));
                opportunite.setEmail(req.getParameter("email"));
                opportunite.setAdresse(req.getParameter("adresse"));
                opportunite.setNomOpportunite(req.getParameter("nomOpportunite"));
                opportunite.setDescription(req.getParameter("description"));
                opportunite.setBudget(new BigDecimal(req.getParameter("budget")));
                opportunite.setStatut(req.getParameter("statut"));
                opportunite.setDateDebut(Date.valueOf(req.getParameter("dateDebut")));
                opportunite.setDateFin(Date.valueOf(req.getParameter("dateFin")));

                service.update(opportunite);
            }

            resp.sendRedirect(req.getContextPath() + "/opportunite");
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Erreur lors de la mise à jour de l'opportunité.");
            req.getRequestDispatcher("/views/editOpportunite.jsp").forward(req, resp);
        }
    }

    /**
     * Extraire le nom du fichier à partir de l'en-tête content-disposition
     */
    private String getFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        
        for (String item : items) {
            if (item.trim().startsWith("filename")) {
                return item.substring(item.indexOf("=") + 2, item.length() - 1);
            }
        }
        return "";
    }
}