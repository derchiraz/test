package com.eadn.service;

import com.eadn.entity.Opportunite;
import jakarta.ejb.Stateless;
import jakarta.persistence.*;
import java.util.List;

@Stateless
public class OpportuniteService {

    @PersistenceContext
    private EntityManager em;

    public Opportunite create(Opportunite opportunite) {
        em.persist(opportunite);
        return opportunite;
    }

    public Opportunite findById(Long id) {
        return em.find(Opportunite.class, id);
    }

    public void update(Opportunite opportunite) {
        em.merge(opportunite);
    }

    public void delete(Long id) {
        Opportunite o = findById(id);
        if (o != null) {
            em.remove(o);
        }
    }
    public List<Opportunite> findAll() {
    return em.createQuery("SELECT o FROM Opportunite o", Opportunite.class)
             .getResultList();
}

}
