package com.eadn.service;

import com.eadn.entity.Projet;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import java.util.List;

@Stateless
public class ProjetService {
    
    @PersistenceContext (unitName="my_persistence_unit")
    private EntityManager entityManager;
    
    public void ajouterProjet(Projet projet) {
        entityManager.persist(projet);
    }
    
    public Projet trouverProjet(Long id) {
        return entityManager.find(Projet.class, id);
    }
    
    public List<Projet> listerProjets() {
        return entityManager.createQuery("SELECT p FROM Projet p", Projet.class).getResultList();
    }
    
    public void supprimerProjet(Long id) {
        Projet projet = trouverProjet(id);
        if (projet != null) {
            entityManager.remove(projet);
        }
    }

    public Projet findById(Long id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public void update(Projet projet) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public List<Projet> findAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}

