<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Alumno</title>
        <style>
            body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; margin: 40px; background-color: #f9f9f9; }
            .form-box { max-width: 450px; margin: 0 auto; padding: 25px; border: 1px solid #ccc; border-radius: 8px; background-color: #fff; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
            h2 { text-align: center; color: #2c6e80; margin-bottom: 20px; }
            .form-group { margin-bottom: 15px; }
            label { display: block; margin-bottom: 5px; font-weight: 600; color: #333; }
            input[type="text"], select { width: 100%; padding: 8px; box-sizing: border-box; border: 1px solid #ccc; border-radius: 4px; font-size: 14px; }
            button { width: 100%; padding: 10px; background-color: #2c6e80; color: white; border: none; border-radius: 4px; font-size: 16px; cursor: pointer; margin-top: 10px; }
            button:hover { background-color: #22998a; }
            .back-link { display: block; text-align: center; margin-top: 15px; text-decoration: none; color: #666; font-size: 14px; }
            .back-link:hover { color: #2c6e80; }
        </style>
    </head>
    <body>
        <div class="form-box">
            <h2>Nuevo Alumno</h2>
            <form action="${pageContext.request.contextPath}/AgregarAlumno" method="POST">
                <div class="form-group">
                    <label for="registro">Registro:</label>
                    <input type="text" id="registro" name="registro" required placeholder="Ej: REG-2001">
                </div>
                <div class="form-group">
                    <label for="nombre">Nombre:</label>
                    <input type="text" id="nombre" name="nombre" required placeholder="Ej: Carlos López">
                </div>
                <div class="form-group">
                    <label for="carrera">Carrera:</label>
                    <select id="carrera" name="carrera" required>
                        <option value="">-- Seleccione una carrera --</option>
                        <c:forEach var="c" items="${carreras}">
                            <option value="${c.idcarrera}">${c.nombre} (${c.facultadIdfacultad.nombre})</option>
                        </c:forEach>
                    </select>
                </div>
                <button type="submit">Guardar Alumno</button>
            </form>
            <a class="back-link" href="${pageContext.request.contextPath}/index.jsp">Volver al inicio</a>
        </div>
    </body>
</html>
