
package com.eadn.dao;


import com.eadn.entity.TimeEntry;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import java.time.LocalDate;
import java.util.List;

public class TimeEntryDAO {
    
    private EntityManagerFactory emf;
    private EntityManager em;
    
    public TimeEntryDAO() {
        emf = Persistence.createEntityManagerFactory("TimesheetPU");
        em = emf.createEntityManager();
    }
    
    public List<TimeEntry> getEntriesByWeek(LocalDate weekStart) {
        LocalDate weekEnd = weekStart.plusDays(6);
        return em.createQuery(
            "SELECT t FROM TimeEntry t WHERE t.date BETWEEN :startDate AND :endDate ORDER BY t.date", 
            TimeEntry.class)
            .setParameter("startDate", weekStart)
            .setParameter("endDate", weekEnd)
            .getResultList();
    }
    
    public void saveTimeEntry(TimeEntry entry) {
        try {
            em.getTransaction().begin();
            if (entry.getId() == null) {
                em.persist(entry);
            } else {
                em.merge(entry);
            }
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            throw e;
        }
    }
    
    public void deleteTimeEntry(Long id) {
        try {
            em.getTransaction().begin();
            TimeEntry entry = em.find(TimeEntry.class, id);
            if (entry != null) {
                em.remove(entry);
            }
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            throw e;
        }
    }
    
    public TimeEntry findById(Long id) {
        return em.find(TimeEntry.class, id);
    }
    
    public List<TimeEntry> findByProject(String project) {
        return em.createQuery(
            "SELECT t FROM TimeEntry t WHERE t.project = :project", 
            TimeEntry.class)
            .setParameter("project", project)
            .getResultList();
    }
    
    public double getTotalHoursForDay(LocalDate date) {
        Double total = em.createQuery(
            "SELECT SUM(t.hours) FROM TimeEntry t WHERE t.date = :date", 
            Double.class)
            .setParameter("date", date)
            .getSingleResult();
        return total != null ? total : 0.0;
    }
    
    public void updateStatus(Long id, String status) {
        try {
            em.getTransaction().begin();
            TimeEntry entry = em.find(TimeEntry.class, id);
            if (entry != null) {
                entry.setStatus(status);
            }
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            throw e;
        }
    }
    
    public void close() {
        if (em != null) {
            em.close();
        }
        if (emf != null) {
            emf.close();
        }
    }
    
    @Override
    protected void finalize() throws Throwable {
        close();
        super.finalize();
    }
}