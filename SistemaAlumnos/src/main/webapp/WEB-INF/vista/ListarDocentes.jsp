<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado de Docentes</title>
        <style>
            table { border-collapse: collapse; width: 75%; margin: 20px auto; font-family: sans-serif; }
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
        <h1 style="text-align: center;">Listado de Docentes</h1>
        <table>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Cargo</th>
                <th>Materias a Cargo</th>
            </tr>
            <c:forEach var="d" items="${docentes}">
                <tr>
                    <td>${d.iddocente}</td>
                    <td>${d.nombre}</td>
                    <td>${d.cargo}</td>
                    <td>
                        <c:forEach var="m" items="${d.materiaCollection}">
                            ${m.nombre}<br/>
                        </c:forEach>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <p style="text-align: center;">
            <a href="${pageContext.request.contextPath}/index.jsp">Volver al inicio</a>
        </p>
    </body>
</html>
