package com.eadn.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "projet")
public class Projet implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String nom;
    private String nomCourt;
    private double budget;
    private String status;
    private String description;
    private String responsable;
    private String compte;
    private Date dateDebut;
    private Date dateFin;

    // Getters et Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getNom() { return nom; }
    public void setNom(String nom) { this.nom = nom; }

    public String getNomCourt() { return nomCourt; }
    public void setNomCourt(String nomCourt) { this.nomCourt = nomCourt; }

    public double getBudget() { return budget; }
    public void setBudget(double budget) { this.budget = budget; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getResponsable() { return responsable; }
    public void setResponsable(String responsable) { this.responsable = responsable; }

    public String getCompte() { return compte; }
    public void setCompte(String compte) { this.compte = compte; }

    public Date getDateDebut() { return dateDebut; }
    public void setDateDebut(Date dateDebut) { this.dateDebut = dateDebut; }

    public Date getDateFin() { return dateFin; }
    public void setDateFin(Date dateFin) { this.dateFin = dateFin; }
}
