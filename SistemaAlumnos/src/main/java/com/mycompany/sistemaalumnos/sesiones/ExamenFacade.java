/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.sistemaalumnos.sesiones;

import com.mycompany.sistemaalumnos.entidades.Examen;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import java.util.List;

/**
 *
 * @author santiagogrillo
 */
@Stateless
public class ExamenFacade extends AbstractFacade<Examen> {

    @PersistenceContext(unitName = "AppAlumnosPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ExamenFacade() {
        super(Examen.class);
    }

    /**
     * Ejercicio 6 - Consulta 1:
     * Listar las mesas de examen del turno de julio, mostrando para cada una los
     * datos del alumno: nombre y nota obtenida.
     * Utiliza la función JPQL EXTRACT (especificación Jakarta Persistence 3.1).
     */
    public List<Examen> findExamenesTurnoJulio() {
        return em.createQuery("SELECT e FROM Examen e WHERE EXTRACT(MONTH FROM e.fecha) = 7", Examen.class)
                 .getResultList();
    }
}
