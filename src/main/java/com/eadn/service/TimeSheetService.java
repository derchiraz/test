package com.eadn.service;




import com.eadn.entity.TimeSheet;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import java.time.LocalDate;
import java.util.List;

@Stateless
public class TimeSheetService {
    
    @PersistenceContext
    private EntityManager entityManager;
    
    public List<TimeSheet> getEntriesByWeek(LocalDate weekStart, Long userId) {
        LocalDate weekEnd = weekStart.plusDays(6);
        return entityManager.createQuery(
            "SELECT t FROM TimeEntry t WHERE t.user.id = :userId " +
            "AND t.date BETWEEN :weekStart AND :weekEnd " +
            "ORDER BY t.date", 
            TimeSheet.class)
            .setParameter("userId", userId)
            .setParameter("weekStart", weekStart)
            .setParameter("weekEnd", weekEnd)
            .getResultList();
    }
    
    public TimeSheet saveTimeEntry(TimeSheet entry) {
        if (entry.getId() == null) {
            entityManager.persist(entry);
            return entry;
        }
        return entityManager.merge(entry);
    }
    
    public void deleteTimeEntry(Long id) {
        TimeSheet entry = entityManager.find(TimeSheet.class, id);
        if (entry != null) {
            entityManager.remove(entry);
        }
    }
    
    public List<TimeSheet> getEntriesByProject(String project, Long userId) {
        return entityManager.createQuery(
            "SELECT t FROM TimeEntry t WHERE t.user.id = :userId " +
            "AND t.project = :project", 
            TimeSheet.class)
            .setParameter("userId", userId)
            .setParameter("project", project)
            .getResultList();
    }
    
    public double getTotalHoursForWeek(LocalDate weekStart, Long userId) {
        LocalDate weekEnd = weekStart.plusDays(6);
        return entityManager.createQuery(
            "SELECT SUM(t.hours) FROM TimeEntry t WHERE t.user.id = :userId " +
            "AND t.date BETWEEN :weekStart AND :weekEnd", 
            Double.class)
            .setParameter("userId", userId)
            .setParameter("weekStart", weekStart)
            .setParameter("weekEnd", weekEnd)
            .getSingleResult();
    }
    
    public void submitTimesheet(LocalDate weekStart, Long userId) {
        entityManager.createQuery(
            "UPDATE TimeEntry t SET t.status = 'SUBMITTED' " +
            "WHERE t.user.id = :userId " +
            "AND t.date BETWEEN :weekStart AND :weekEnd")
            .setParameter("userId", userId)
            .setParameter("weekStart", weekStart)
            .setParameter("weekEnd", weekStart.plusDays(6))
            .executeUpdate();
    }
    
    public boolean validateTimeEntry(TimeSheet entry) {
        // Validate that daily hours don't exceed 24
        double existingHours = entityManager.createQuery(
            "SELECT SUM(t.hours) FROM TimeEntry t WHERE t.user.id = :userId " +
            "AND t.date = :date", 
            Double.class)
            .setParameter("userId", entry.getUser().getId())
            .setParameter("date", entry.getDate())
            .getSingleResult();
            
        return (existingHours + entry.getHours()) <= 24;
    }
}