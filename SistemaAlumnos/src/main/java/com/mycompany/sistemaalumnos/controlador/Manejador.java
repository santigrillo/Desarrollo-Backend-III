/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.sistemaalumnos.controlador;

import com.mycompany.sistemaalumnos.entidades.Alumno;
import com.mycompany.sistemaalumnos.entidades.Carrera;
import com.mycompany.sistemaalumnos.entidades.Facultad;
import com.mycompany.sistemaalumnos.entidades.Materia;
import com.mycompany.sistemaalumnos.sesiones.AlumnoFacade;
import com.mycompany.sistemaalumnos.sesiones.CarreraFacade;
import com.mycompany.sistemaalumnos.sesiones.DocenteFacade;
import com.mycompany.sistemaalumnos.sesiones.ExamenFacade;
import com.mycompany.sistemaalumnos.sesiones.FacultadFacade;
import com.mycompany.sistemaalumnos.sesiones.MateriaFacade;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.Year;

@WebServlet(name = "Manejador", loadOnStartup = 1, urlPatterns = {
    // Rutas Alumno
    "/SolicitarDatos", "/AgregarAlumno", "/Listar", "/EditarAlumno", "/ActualizarAlumno", "/EliminarAlumno",
    // Rutas Carrera
    "/ListarCarreras", "/SolicitarDatosCarrera", "/AgregarCarrera", "/EditarCarrera", "/ActualizarCarrera", "/EliminarCarrera",
    // Rutas Materia
    "/ListarMaterias", "/SolicitarDatosMateria", "/AgregarMateria", "/EditarMateria", "/ActualizarMateria", "/EliminarMateria",
    // Práctico 2: Menú dinámico y Facultades
    "/Facultad",
    // Práctico 2: Consultas JPQL y Docentes
    "/ConsultasEspeciales", "/ListarDocentes"
})
public class Manejador extends HttpServlet {

    @EJB
    private AlumnoFacade alumnoF;

    @EJB
    private CarreraFacade carreraF;

    @EJB
    private MateriaFacade materiaF;

    @EJB
    private FacultadFacade facultadF;

    @EJB
    private DocenteFacade docenteF;

    @EJB
    private ExamenFacade examenF;

    /**
     * Ejercicio 1 - Guiado:
     * Al desplegarse la aplicación, almacena la lista de facultades en el contexto del Servlet
     * para que index.jsp pueda generar el menú dinámicamente.
     */
    @Override
    public void init() throws ServletException {
        super.init();
        if (facultadF != null) {
            getServletContext().setAttribute("facultades", facultadF.findAll());
        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pathUsuario = request.getServletPath();
        String url = "";

        // Asegurar que el contexto tenga las facultades cargadas
        if (getServletContext().getAttribute("facultades") == null && facultadF != null) {
            getServletContext().setAttribute("facultades", facultadF.findAll());
        }

        switch (pathUsuario) {
            // ==================== ALUMNO ====================
            case "/SolicitarDatos":
                request.setAttribute("carreras", carreraF.findAll());
                url = "/WEB-INF/vista/SolicitarDatos.jsp";
                break;

            case "/AgregarAlumno": {
                String nombre = request.getParameter("nombre");
                String registro = request.getParameter("registro");
                String idCarreraStr = request.getParameter("carrera");

                Alumno a = new Alumno();
                a.setNombre(nombre);
                a.setRegistro(registro);
                if (idCarreraStr != null && !idCarreraStr.isEmpty()) {
                    a.setCarreraIdcarrera(carreraF.find(Integer.parseInt(idCarreraStr)));
                }
                alumnoF.create(a);
                url = "Listar";
                break;
            }

            case "/Listar":
                request.setAttribute("lista", alumnoF.findAll());
                url = "/WEB-INF/vista/ListarAlumnos.jsp";
                break;

            case "/EditarAlumno": {
                int id = Integer.parseInt(request.getParameter("id"));
                request.setAttribute("alumno", alumnoF.find(id));
                request.setAttribute("carreras", carreraF.findAll());
                url = "/WEB-INF/vista/EditarAlumno.jsp";
                break;
            }

            case "/ActualizarAlumno": {
                int id = Integer.parseInt(request.getParameter("id"));
                String nombre = request.getParameter("nombre");
                String registro = request.getParameter("registro");
                String idCarreraStr = request.getParameter("carrera");

                Alumno a = alumnoF.find(id);
                a.setNombre(nombre);
                a.setRegistro(registro);
                if (idCarreraStr != null && !idCarreraStr.isEmpty()) {
                    a.setCarreraIdcarrera(carreraF.find(Integer.parseInt(idCarreraStr)));
                } else {
                    a.setCarreraIdcarrera(null);
                }
                alumnoF.edit(a);
                url = "Listar";
                break;
            }

            case "/EliminarAlumno": {
                int id = Integer.parseInt(request.getParameter("id"));
                Alumno a = alumnoF.find(id);
                if (a != null) {
                    alumnoF.remove(a);
                }
                url = "Listar";
                break;
            }

            // ==================== CARRERA ====================
            case "/ListarCarreras":
                request.setAttribute("carreras", carreraF.findAll());
                url = "/WEB-INF/vista/ListarCarreras.jsp";
                break;

            case "/SolicitarDatosCarrera":
                request.setAttribute("facultades", facultadF.findAll());
                url = "/WEB-INF/vista/FormCarrera.jsp";
                break;

            case "/AgregarCarrera": {
                String nombre = request.getParameter("nombre");
                int idFacultad = Integer.parseInt(request.getParameter("facultad"));

                Carrera c = new Carrera();
                c.setNombre(nombre);
                c.setFacultadIdfacultad(facultadF.find(idFacultad));
                carreraF.create(c);
                url = "ListarCarreras";
                break;
            }

            case "/EditarCarrera": {
                int id = Integer.parseInt(request.getParameter("id"));
                request.setAttribute("carrera", carreraF.find(id));
                request.setAttribute("facultades", facultadF.findAll());
                url = "/WEB-INF/vista/FormCarrera.jsp";
                break;
            }

            case "/ActualizarCarrera": {
                int id = Integer.parseInt(request.getParameter("id"));
                String nombre = request.getParameter("nombre");
                int idFacultad = Integer.parseInt(request.getParameter("facultad"));

                Carrera c = carreraF.find(id);
                c.setNombre(nombre);
                c.setFacultadIdfacultad(facultadF.find(idFacultad));
                carreraF.edit(c);
                url = "ListarCarreras";
                break;
            }

            case "/EliminarCarrera": {
                int id = Integer.parseInt(request.getParameter("id"));
                Carrera c = carreraF.find(id);
                if (c != null) {
                    carreraF.remove(c);
                }
                url = "ListarCarreras";
                break;
            }

            // ==================== MATERIA ====================
            case "/ListarMaterias":
                request.setAttribute("materias", materiaF.findAll());
                url = "/WEB-INF/vista/ListarMaterias.jsp";
                break;

            case "/SolicitarDatosMateria":
                request.setAttribute("carreras", carreraF.findAll());
                url = "/WEB-INF/vista/FormMateria.jsp";
                break;

            case "/AgregarMateria": {
                String nombre = request.getParameter("nombre");
                int idCarrera = Integer.parseInt(request.getParameter("carrera"));

                Materia m = new Materia();
                m.setNombre(nombre);
                m.setCarreraIdcarrera(carreraF.find(idCarrera));
                materiaF.create(m);
                url = "ListarMaterias";
                break;
            }

            case "/EditarMateria": {
                int id = Integer.parseInt(request.getParameter("id"));
                request.setAttribute("materia", materiaF.find(id));
                request.setAttribute("carreras", carreraF.findAll());
                url = "/WEB-INF/vista/FormMateria.jsp";
                break;
            }

            case "/ActualizarMateria": {
                int id = Integer.parseInt(request.getParameter("id"));
                String nombre = request.getParameter("nombre");
                int idCarrera = Integer.parseInt(request.getParameter("carrera"));

                Materia m = materiaF.find(id);
                m.setNombre(nombre);
                m.setCarreraIdcarrera(carreraF.find(idCarrera));
                materiaF.edit(m);
                url = "ListarMaterias";
                break;
            }

            case "/EliminarMateria": {
                int id = Integer.parseInt(request.getParameter("id"));
                Materia m = materiaF.find(id);
                if (m != null) {
                    materiaF.remove(m);
                }
                url = "ListarMaterias";
                break;
            }

            // ==================== PRÁCTICO 2: FACULTAD (EJERCICIO 1 Y 2) ====================
            case "/Facultad": {
                String idStr = request.getParameter("id");
                if (idStr == null || idStr.isEmpty()) {
                    idStr = request.getParameter("idFacultad");
                }
                if (idStr != null && !idStr.isEmpty()) {
                    int idFacultad = Integer.parseInt(idStr);
                    Facultad f = facultadF.find(idFacultad);
                    request.setAttribute("facultad", f);
                    request.setAttribute("carreras", carreraF.findPorFacultad(idFacultad));
                }
                url = "/WEB-INF/vista/CarrerasFacultad.jsp";
                break;
            }

            // ==================== PRÁCTICO 2: CONSULTAS JPQL (EJERCICIO 6) ====================
            case "/ConsultasEspeciales": {
                int anioActual = Year.now().getValue();
                request.setAttribute("anioActual", anioActual);
                request.setAttribute("examenesJulio", examenF.findExamenesTurnoJulio());
                request.setAttribute("alumnosSinRendir", alumnoF.findAlumnosSinRendirAnio(anioActual));
                request.setAttribute("docentesMasDos", docenteF.findDocentesConMasDeDosMaterias());
                url = "/WEB-INF/vista/ConsultasEspeciales.jsp";
                break;
            }

            // ==================== PRÁCTICO 2: DOCENTES (EJERCICIO 4 Y 5) ====================
            case "/ListarDocentes": {
                request.setAttribute("docentes", docenteF.findAll());
                url = "/WEB-INF/vista/ListarDocentes.jsp";
                break;
            }
        }

        request.getRequestDispatcher(url).forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
