package com.eadn.entity;

import jakarta.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

@Entity
@Table(name = "opportunites")
public class Opportunite implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    // Informations client
    private String nomEntreprise;
    private String nomContact;
    private String telephone;
    private String email;
    private String adresse;

    // Détails opportunité
    private String nomOpportunite;

    @Column(length = 2000)
    private String descriptionOpportunite;

    private double budgetEstime;
    private String status;

    // Planification
    @Temporal(TemporalType.DATE)
    private Date dateDebut;

    @Temporal(TemporalType.DATE)
    private Date dateFin;

    @Column(length = 2000)
    private String objectifsPrincipaux;

    // Architecture
    @Column(length = 2000)
    private String descriptionArchitecture;

    private String nomFichier;

    // Suivi interne
    private String responsable;
    private String membre1;
    private String membre2;
    private String membre3;

    // ✅ Constructeur par défaut requis par JPA
    public Opportunite() {}

    // ✅ Constructeur personnalisé (facultatif)
    public Opportunite(String nomOpportunite, String nomContact, String nomEntreprise, String status,
                       String descriptionOpportunite, String objectifsPrincipaux, String nomFichier) {
        this.nomOpportunite = nomOpportunite;
        this.nomContact = nomContact;
        this.nomEntreprise = nomEntreprise;
        this.status = status;
        this.descriptionOpportunite = descriptionOpportunite;
        this.objectifsPrincipaux = objectifsPrincipaux;
        this.nomFichier = nomFichier;
    }

    // Getters et Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNomEntreprise() {
        return nomEntreprise;
    }

    public void setNomEntreprise(String nomEntreprise) {
        this.nomEntreprise = nomEntreprise;
    }

    public String getNomContact() {
        return nomContact;
    }

    public void setNomContact(String nomContact) {
        this.nomContact = nomContact;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAdresse() {
        return adresse;
    }

    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }

    public String getNomOpportunite() {
        return nomOpportunite;
    }

    public void setNomOpportunite(String nomOpportunite) {
        this.nomOpportunite = nomOpportunite;
    }

    public String getDescriptionOpportunite() {
        return descriptionOpportunite;
    }

    public void setDescriptionOpportunite(String descriptionOpportunite) {
        this.descriptionOpportunite = descriptionOpportunite;
    }

    public double getBudgetEstime() {
        return budgetEstime;
    }

    public void setBudgetEstime(double budgetEstime) {
        this.budgetEstime = budgetEstime;
    }

    public void setBudget(BigDecimal budget) {
        this.budgetEstime = budget.doubleValue();
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setStatut(String statut) {
        this.status = statut;
    }

    public Date getDateDebut() {
        return dateDebut;
    }

    public void setDateDebut(Date dateDebut) {
        this.dateDebut = dateDebut;
    }

    public Date getDateFin() {
        return dateFin;
    }

    public void setDateFin(Date dateFin) {
        this.dateFin = dateFin;
    }

    public String getObjectifsPrincipaux() {
        return objectifsPrincipaux;
    }

    public void setObjectifsPrincipaux(String objectifsPrincipaux) {
        this.objectifsPrincipaux = objectifsPrincipaux;
    }

    public String getDescriptionArchitecture() {
        return descriptionArchitecture;
    }

    public void setDescriptionArchitecture(String descriptionArchitecture) {
        this.descriptionArchitecture = descriptionArchitecture;
    }

    public String getNomFichier() {
        return nomFichier;
    }

    public void setNomFichier(String nomFichier) {
        this.nomFichier = nomFichier;
    }

    public String getResponsable() {
        return responsable;
    }

    public void setResponsable(String responsable) {
        this.responsable = responsable;
    }

    public String getMembre1() {
        return membre1;
    }

    public void setMembre1(String membre1) {
        this.membre1 = membre1;
    }

    public String getMembre2() {
        return membre2;
    }

    public void setMembre2(String membre2) {
        this.membre2 = membre2;
    }

    public String getMembre3() {
        return membre3;
    }

    public void setMembre3(String membre3) {
        this.membre3 = membre3;
    }

    // Pour compatibilité avec ancien code (ex: JSF/Servlets)
    public void setContact(String contact) {
        this.nomContact = contact;
    }

    public void setDescription(String description) {
        this.descriptionOpportunite = description;
    }
}
