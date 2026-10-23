<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${empty materia ? 'Nueva' : 'Editar'} Materia</title>
        <style>
            body { font-family: sans-serif; margin: 40px; background-color: #f9f9f9; }
            .form-box { max-width: 450px; margin: 0 auto; padding: 25px; border: 1px solid #ccc; border-radius: 8px; background-color: #fff; }
            h2 { text-align: center; color: #2c6e80; }
            .form-group { margin-bottom: 15px; }
            label { display: block; margin-bottom: 5px; font-weight: bold; }
            input[type="text"], select { width: 100%; padding: 8px; box-sizing: border-box; border: 1px solid #ccc; border-radius: 4px; }
            button { width: 100%; padding: 10px; background-color: #2c6e80; color: white; border: none; border-radius: 4px; font-size: 16px; cursor: pointer; }
        </style>
    </head>
    <body>
        <div class="form-box">
            <h2>${empty materia ? 'Nueva Materia' : 'Editar Materia'}</h2>
            <form action="${pageContext.request.contextPath}/${empty materia ? 'AgregarMateria' : 'ActualizarMateria'}" method="POST">
                <c:if test="${not empty materia}">
                    <input type="hidden" name="id" value="${materia.idmateria}">
                </c:if>
                <div class="form-group">
                    <label for="nombre">Nombre de la Materia:</label>
                    <input type="text" id="nombre" name="nombre" value="${materia.nombre}" required>
                </div>
                <div class="form-group">
                    <label for="carrera">Carrera:</label>
                    <select id="carrera" name="carrera" required>
                        <option value="">-- Seleccione una carrera --</option>
                        <c:forEach var="c" items="${carreras}">
                            <option value="${c.idcarrera}" ${c.idcarrera == materia.carreraIdcarrera.idcarrera ? 'selected' : ''}>
                                ${c.nombre}
                            </option>
                        </c:forEach>
                    </select>
                </div>
                <button type="submit">${empty materia ? 'Guardar' : 'Actualizar'} Materia</button>
            </form>
            <p style="text-align: center; margin-top: 15px;">
                <a href="${pageContext.request.contextPath}/ListarMaterias">Cancelar</a>
            </p>
        </div>
    </body>
</html>
