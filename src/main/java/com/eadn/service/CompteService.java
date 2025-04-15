package com.eadn.service;

import com.eadn.entity.Compte;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import java.util.List;

@Stateless
public class CompteService {

    @PersistenceContext
    private EntityManager em;

    public Compte findById(Long id) {
        return em.find(Compte.class, id);
    }

    public List<Compte> findAll() {
        return em.createQuery("SELECT c FROM Compte c", Compte.class).getResultList();
    }
}
