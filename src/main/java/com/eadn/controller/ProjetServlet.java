package com.eadn.controller;


import com.eadn.entity.Projet;

import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.DELETE;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import java.util.List;

@Stateless
@Path("/projets")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class ProjetServlet {
    
    @PersistenceContext
    private EntityManager entityManager;

    @POST
    public Response creerProjet(Projet projet) {
        entityManager.persist(projet);
        return Response.status(Response.Status.CREATED).entity(projet).build();
    }

    @GET
    public List<Projet> obtenirProjets() {
        return entityManager.createQuery("SELECT p FROM Projet p", Projet.class).getResultList();
    }

    @DELETE
    @Path("/{id}")
    public Response supprimerProjet(@PathParam("id") Long id) {
        Projet projet = entityManager.find(Projet.class, id);
        if (projet != null) {
            entityManager.remove(projet);
            return Response.ok().build();
        }
        return Response.status(Response.Status.NOT_FOUND).build();
    }
}
