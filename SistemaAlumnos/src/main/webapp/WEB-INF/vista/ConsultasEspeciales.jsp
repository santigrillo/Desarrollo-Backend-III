<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultas Especiales JPQL</title>
        <style>
            table { border-collapse: collapse; width: 75%; margin: 20px auto; font-family: sans-serif; }
            th, td { border: 1px solid #ddd; padding: 10px; text-align: left; }
            th { background-color: #2c6e80; color: white; }
            tr:nth-child(even) { background-color: #f9f9f9; }
            h2 { text-align: center; color: #2c6e80; font-family: sans-serif; margin-top: 35px; }
            .jpql-code { text-align: center; font-family: monospace; color: #555; background-color: #f0f0f0; width: 75%; margin: 5px auto; padding: 6px; border-radius: 4px; font-size: 13px; }
        </style>
    </head>
    <body>
        <h1 style="text-align: center; font-family: sans-serif;">Consultas Especiales (JPQL)</h1>

        <!-- Consulta 1 -->
        <h2>1. Mesas de examen del turno de julio</h2>
        <div class="jpql-code">SELECT e FROM Examen e WHERE EXTRACT(MONTH FROM e.fecha) = 7</div>
        <table>
            <tr>
                <th>ID</th>
                <th>Alumno</th>
                <th>Materia</th>
                <th>Fecha</th>
                <th>Nota</th>
            </tr>
            <c:forEach var="ex" items="${examenesJulio}">
                <tr>
                    <td>${ex.idexamen}</td>
                    <td>${ex.alumnoIdalumno.nombre} (${ex.alumnoIdalumno.registro})</td>
                    <td>${ex.materiaIdmateria.nombre}</td>
                    <td>${ex.fecha}</td>
                    <td>${ex.nota}</td>
                </tr>
            </c:forEach>
        </table>

        <!-- Consulta 2 -->
        <h2>2. Alumnos que no hayan rendido ninguna materia en el año en curso (${anioActual})</h2>
        <div class="jpql-code">SELECT a FROM Alumno a WHERE NOT EXISTS (SELECT e FROM Examen e WHERE e.alumnoIdalumno = a AND EXTRACT(YEAR FROM e.fecha) = :anio)</div>
        <table>
            <tr>
                <th>ID</th>
                <th>Registro</th>
                <th>Nombre</th>
                <th>Carrera</th>
                <th>Facultad</th>
            </tr>
            <c:forEach var="al" items="${alumnosSinRendir}">
                <tr>
                    <td>${al.idalumno}</td>
                    <td>${al.registro}</td>
                    <td>${al.nombre}</td>
                    <td>${al.carreraIdcarrera.nombre}</td>
                    <td>${al.carreraIdcarrera.facultadIdfacultad.nombre}</td>
                </tr>
            </c:forEach>
        </table>

        <!-- Consulta 3 -->
        <h2>3. Docentes que dictan más de dos materias</h2>
        <div class="jpql-code">SELECT d FROM Docente d WHERE SIZE(d.materiaCollection) > 2</div>
        <table>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Cargo</th>
                <th>Cant. Materias</th>
                <th>Materias</th>
            </tr>
            <c:forEach var="doc" items="${docentesMasDos}">
                <tr>
                    <td>${doc.iddocente}</td>
                    <td>${doc.nombre}</td>
                    <td>${doc.cargo}</td>
                    <td>${doc.materiaCollection.size()}</td>
                    <td>
                        <c:forEach var="mat" items="${doc.materiaCollection}">
                            ${mat.nombre}<br/>
                        </c:forEach>
                    </td>
                </tr>
            </c:forEach>
        </table>

        <p style="text-align: center; font-family: sans-serif; margin-top: 30px;">
            <a href="${pageContext.request.contextPath}/index.jsp">Volver al inicio</a>
        </p>
    </body>
</html>
