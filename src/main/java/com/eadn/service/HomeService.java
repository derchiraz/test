package com.eadn.service;

import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

import java.util.Arrays;
import java.util.List;

@Stateless
public class HomeService {

    @PersistenceContext
    private EntityManager em;

    public int getTotalEmployes() {
        Long count = em.createQuery("SELECT COUNT(e) FROM Ressource e", Long.class).getSingleResult();
        return count.intValue();
    }

    public int getNouveauxEmployesCeMois() {
        return em.createQuery("    SELECT COUNT(e) FROM Ressource e\n" + "    WHERE FUNCTION('MONTH', e.dateDebut) = FUNCTION('MONTH', CURRENT_DATE)\n" + "      AND FUNCTION('YEAR', e.dateDebut) = FUNCTION('YEAR', CURRENT_DATE)\n", Long.class).getSingleResult().intValue();
    }

    public int getTotalProjets() {
        Long count = em.createQuery("SELECT COUNT(p) FROM Projet p", Long.class).getSingleResult();
        return count.intValue();
    }

    public int getProjetsActifs() {
        Long count = em.createQuery("SELECT COUNT(p) FROM Projet p WHERE p.status = 'progress'", Long.class).getSingleResult();
        return count.intValue();
    }

    public List<Integer> getEmployesParMois() {
        // Simuler des données mensuelles (ou faire une vraie requête groupée par mois)
        return Arrays.asList(2, 5, 8, 12, 15, 10, 20, 25, 18, 14, 8, 4); // Jan → Déc
    }

    public List<Integer> getStatutsProjet() {
        int enCours = em.createQuery("SELECT COUNT(p) FROM Projet p WHERE p.status = 'progress'", Long.class).getSingleResult().intValue();
        int termine = em.createQuery("SELECT COUNT(p) FROM Projet p WHERE p.status = 'completed'", Long.class).getSingleResult().intValue();
        int enAttente = em.createQuery("SELECT COUNT(p) FROM Projet p WHERE p.status = 'pending'", Long.class).getSingleResult().intValue();

        return Arrays.asList(enCours, termine, enAttente);
    }
}
