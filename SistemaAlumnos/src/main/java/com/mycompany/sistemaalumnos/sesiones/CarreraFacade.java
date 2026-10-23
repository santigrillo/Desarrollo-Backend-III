/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.sistemaalumnos.sesiones;

import com.mycompany.sistemaalumnos.entidades.Carrera;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import java.util.List;

/**
 *
 * @author santiagogrillo
 */
@Stateless
public class CarreraFacade extends AbstractFacade<Carrera> {

    @PersistenceContext(unitName = "AppAlumnosPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CarreraFacade() {
        super(Carrera.class);
    }

    /**
     * Ejercicio 2:
     * Listar todas las carreras disponibles para la facultad elegida.
     */
    public List<Carrera> findPorFacultad(int idFacultad) {
        return em.createQuery("SELECT c FROM Carrera c WHERE c.facultadIdfacultad.idfacultad = :idFacultad", Carrera.class)
                 .setParameter("idFacultad", idFacultad)
                 .getResultList();
    }
}
