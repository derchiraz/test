package com.eadn.controller;

import com.eadn.dao.TimeEntryDAO;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
import com.eadn.entity.TimeEntry;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/timesheet")
public class TimesheetServlet extends HttpServlet {
    private final TimeEntryDAO timeEntryDAO = new TimeEntryDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String weekParam = request.getParameter("week");
        LocalDate weekStart = weekParam != null ? 
            LocalDate.parse(weekParam) : 
            LocalDate.now().minusDays(LocalDate.now().getDayOfWeek().getValue() - 1);

        List<TimeEntry> entries = timeEntryDAO.getEntriesByWeek(weekStart);
        request.setAttribute("entries", entries);
        request.setAttribute("weekStart", weekStart);
        request.getRequestDispatcher("/WEB-INF/views/timesheet.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String project = request.getParameter("project");
        String role = request.getParameter("role");
        LocalDate date = LocalDate.parse(request.getParameter("date"));
        double hours = Double.parseDouble(request.getParameter("hours"));

        TimeEntry entry = new TimeEntry(project, role, date, hours);
        timeEntryDAO.saveTimeEntry(entry);

        response.sendRedirect(request.getContextPath() + "/timesheet");
    }
}