package com.eadn.service;

import com.eadn.entity.Ressource;
import jakarta.ejb.Stateless;
import jakarta.persistence.*;

import java.util.List;

@Stateless
public class RessourceService {

    @PersistenceContext
    private EntityManager em;

    
    public void save(Ressource r) {
        em.persist(r);
    }

    
    public Ressource findById(Long id) {
        return em.find(Ressource.class, id);
    }

    
    public void update(Ressource r) {
        em.merge(r);
    }

    
    public void delete(Long id) {
        Ressource r = em.find(Ressource.class, id);
        if (r != null) {
            em.remove(r);
        }
    }

    
    public List<Ressource> findAll() {
        return em.createQuery("SELECT r FROM Ressource r", Ressource.class)
                 .getResultList();
    }
}
