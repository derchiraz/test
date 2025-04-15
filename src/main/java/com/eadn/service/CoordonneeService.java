package com.eadn.service;

import com.eadn.entity.Coordonnee;
import com.eadn.entity.Utilisateur;
import jakarta.ejb.Stateless;
import jakarta.persistence.*;
import java.util.List;

@Stateless
public class CoordonneeService {

    @PersistenceContext
    private EntityManager em;

    // 🔹 Créer ou mettre à jour les coordonnées (upsert)
    public Coordonnee saveOrUpdate(Coordonnee coordonnee) {
        if (coordonnee.getId() == null) {
            em.persist(coordonnee);
            return coordonnee;
        } else {
            return em.merge(coordonnee);
        }
    }

    // 🔹 Trouver par ID
    public Coordonnee findById(Long id) {
        return em.find(Coordonnee.class, id);
    }

    // 🔹 Supprimer
    public void delete(Long id) {
        Coordonnee coordonnee = findById(id);
        if (coordonnee != null) {
            em.remove(coordonnee);
        }
    }

    // 🔹 Lister toutes les coordonnées
    public List<Coordonnee> findAll() {
        return em.createQuery("SELECT c FROM Coordonnee c", Coordonnee.class)
                 .getResultList();
    }

    // 🔹 Trouver les coordonnées associées à un utilisateur
    public Coordonnee findByUtilisateur(Utilisateur utilisateur) {
        try {
            return em.createQuery(
                    "SELECT c FROM Coordonnee c WHERE c.utilisateur = :utilisateur", Coordonnee.class)
                    .setParameter("utilisateur", utilisateur)
                    .getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
    }

    public Coordonnee findByUtilisateurId(Long id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
