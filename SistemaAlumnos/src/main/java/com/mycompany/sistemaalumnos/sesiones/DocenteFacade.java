/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.sistemaalumnos.sesiones;

import com.mycompany.sistemaalumnos.entidades.Docente;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import java.util.List;

/**
 *
 * @author santiagogrillo
 */
@Stateless
public class DocenteFacade extends AbstractFacade<Docente> {

    @PersistenceContext(unitName = "AppAlumnosPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public DocenteFacade() {
        super(Docente.class);
    }

    /**
     * Ejercicio 6 - Consulta 3:
     * Mostrar los docentes que dictan más de dos materias.
     */
    public List<Docente> findDocentesConMasDeDosMaterias() {
        return em.createQuery("SELECT d FROM Docente d WHERE SIZE(d.materiaCollection) > 2", Docente.class)
                 .getResultList();
    }
}
