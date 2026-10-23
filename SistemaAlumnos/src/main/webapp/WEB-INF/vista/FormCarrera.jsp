<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${empty carrera ? 'Nueva' : 'Editar'} Carrera</title>
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
            <h2>${empty carrera ? 'Nueva Carrera' : 'Editar Carrera'}</h2>
            <form action="${pageContext.request.contextPath}/${empty carrera ? 'AgregarCarrera' : 'ActualizarCarrera'}" method="POST">
                <c:if test="${not empty carrera}">
                    <input type="hidden" name="id" value="${carrera.idcarrera}">
                </c:if>
                <div class="form-group">
                    <label for="nombre">Nombre de la Carrera:</label>
                    <input type="text" id="nombre" name="nombre" value="${carrera.nombre}" required>
                </div>
                <div class="form-group">
                    <label for="facultad">Facultad:</label>
                    <select id="facultad" name="facultad" required>
                        <option value="">-- Seleccione una facultad --</option>
                        <c:forEach var="f" items="${facultades}">
                            <option value="${f.idfacultad}" ${f.idfacultad == carrera.facultadIdfacultad.idfacultad ? 'selected' : ''}>
                                ${f.nombre}
                            </option>
                        </c:forEach>
                    </select>
                </div>
                <button type="submit">${empty carrera ? 'Guardar' : 'Actualizar'} Carrera</button>
            </form>
            <p style="text-align: center; margin-top: 15px;">
                <a href="${pageContext.request.contextPath}/ListarCarreras">Cancelar</a>
            </p>
        </div>
    </body>
</html>
