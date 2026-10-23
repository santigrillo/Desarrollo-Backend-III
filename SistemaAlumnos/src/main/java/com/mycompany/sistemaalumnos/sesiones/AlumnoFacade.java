/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.sistemaalumnos.sesiones;

import com.mycompany.sistemaalumnos.entidades.Alumno;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import java.util.List;

/**
 *
 * @author santiagogrillo
 */
@Stateless
public class AlumnoFacade extends AbstractFacade<Alumno> {

    @PersistenceContext(unitName = "AppAlumnosPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public AlumnoFacade() {
        super(Alumno.class);
    }

    /**
     * Ejercicio 6 - Consulta 2:
     * Obtener un listado de los alumnos que no hayan rendido ninguna materia durante el año en curso.
     * Utiliza JPQL estándar con NOT EXISTS y EXTRACT(YEAR FROM ...).
     */
    public List<Alumno> findAlumnosSinRendirAnio(int anio) {
        return em.createQuery(
            "SELECT a FROM Alumno a WHERE NOT EXISTS (" +
            "  SELECT e FROM Examen e WHERE e.alumnoIdalumno = a AND EXTRACT(YEAR FROM e.fecha) = :anio" +
            ")", Alumno.class)
            .setParameter("anio", anio)
            .getResultList();
    }
}
