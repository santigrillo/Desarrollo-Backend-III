<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado de Alumnos</title>
        <style>
            table { border-collapse: collapse; width: 85%; margin: 20px auto; font-family: sans-serif; }
            th, td { border: 1px solid #ddd; padding: 10px; text-align: left; }
            th { background-color: #2c6e80; color: white; }
            tr:nth-child(even) { background-color: #f9f9f9; }
            .btn { padding: 5px 10px; text-decoration: none; border-radius: 4px; font-size: 13px; margin-right: 5px; }
            .btn-edit { background-color: #e67e22; color: white; }
            .btn-del { background-color: #c0392b; color: white; }
            .btn-add { background-color: #27ae60; color: white; display: inline-block; margin-bottom: 15px; }
        </style>
    </head>
    <body>
        <h1 style="text-align: center;">Listado de Alumnos</h1>
        <div style="text-align: center;">
            <a class="btn btn-add" href="${pageContext.request.contextPath}/SolicitarDatos">+ Nuevo Alumno</a>
        </div>
        <table>
            <tr>
                <th>Registro</th>
                <th>Nombre</th>
                <th>Carrera</th>
                <th>Facultad</th>
                <th>Acciones</th>
            </tr>
            <c:forEach var="a" items="${lista}">
                <tr>
                    <td>${a.registro}</td>
                    <td>${a.nombre}</td>
                    <td>${a.carreraIdcarrera.nombre}</td>
                    <td>${a.carreraIdcarrera.facultadIdfacultad.nombre}</td>
                    <td>
                        <a class="btn btn-edit" href="${pageContext.request.contextPath}/EditarAlumno?id=${a.idalumno}">Editar</a>
                        <a class="btn btn-del" href="${pageContext.request.contextPath}/EliminarAlumno?id=${a.idalumno}" onclick="return confirm('¿Desea eliminar este alumno?');">Eliminar</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <p style="text-align: center;">
            <a href="${pageContext.request.contextPath}/index.jsp">Volver al inicio</a>
        </p>
    </body>
</html>