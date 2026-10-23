<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Alumno</title>
        <style>
            body { font-family: sans-serif; margin: 40px; background-color: #f9f9f9; }
            .form-box { max-width: 450px; margin: 0 auto; padding: 25px; border: 1px solid #ccc; border-radius: 8px; background-color: #fff; }
            h2 { text-align: center; color: #2c6e80; }
            .form-group { margin-bottom: 15px; }
            label { display: block; margin-bottom: 5px; font-weight: bold; }
            input[type="text"], select { width: 100%; padding: 8px; box-sizing: border-box; border: 1px solid #ccc; border-radius: 4px; }
            button { width: 100%; padding: 10px; background-color: #e67e22; color: white; border: none; border-radius: 4px; font-size: 16px; cursor: pointer; }
        </style>
    </head>
    <body>
        <div class="form-box">
            <h2>Editar Alumno</h2>
            <form action="${pageContext.request.contextPath}/ActualizarAlumno" method="POST">
                <input type="hidden" name="id" value="${alumno.idalumno}">
                <div class="form-group">
                    <label for="registro">Registro:</label>
                    <input type="text" id="registro" name="registro" value="${alumno.registro}" required>
                </div>
                <div class="form-group">
                    <label for="nombre">Nombre:</label>
                    <input type="text" id="nombre" name="nombre" value="${alumno.nombre}" required>
                </div>
                <div class="form-group">
                    <label for="carrera">Carrera:</label>
                    <select id="carrera" name="carrera" required>
                        <c:forEach var="c" items="${carreras}">
                            <option value="${c.idcarrera}" ${c.idcarrera == alumno.carreraIdcarrera.idcarrera ? 'selected' : ''}>
                                ${c.nombre} (${c.facultadIdfacultad.nombre})
                            </option>
                        </c:forEach>
                    </select>
                </div>
                <button type="submit">Actualizar Alumno</button>
            </form>
            <p style="text-align: center; margin-top: 15px;">
                <a href="${pageContext.request.contextPath}/Listar">Cancelar</a>
            </p>
        </div>
    </body>
</html>
