package com.eadn.service;

import com.eadn.entity.Utilisateur;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import java.util.List;

@Stateless
public class UtilisateurService {

    @PersistenceContext
    private EntityManager em;

    public Utilisateur findById(Long id) {
        return em.find(Utilisateur.class, id);
    }

    public List<Utilisateur> findAll() {
        return em.createQuery("SELECT u FROM Utilisateur u", Utilisateur.class).getResultList();
    }
}
