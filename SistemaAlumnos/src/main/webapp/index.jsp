<%-- 
    Document   : index
    Created on : 13 sept 2026, 20:37:48
    Author     : santiagogrillo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistema Alumnos</title>
        
        <!-- FontAwesome para los iconos sociales -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        
        <style>
            * { 
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }
            
            body {
                background-color: #ffffff;
                color: #333;
            }
            
            /* Encabezado */
            .header {
                text-align: center;
                padding: 30px 0px 20px 0px;
            }
            
            .header .logo {
                width: 45px;
                margin-bottom: 10px;
            }
            
            .header h1 {
                font-size: 20px;
                letter-spacing: 5px;
                color: #2c6e80;
                font-weight: 700;
            }
            
            .header h2 {
                font-size: 20px;
                letter-spacing: 5px;
                color: #22998a;
                font-weight: 600;
                margin-top: 5px;
            }
            
            /* Barra de navegacion */
            .navbar {
                display: flex;
                justify-content: center;
                align-items: center;
                margin-top: 15px;
                position: relative;
            }
            
            .nav-list {
                list-style: none;
                display: flex;
                gap: 25px;
                align-items: center;
            }
            
            .nav-list a {
                text-decoration: none;
                color: #333;
                font-size: 13px;
                font-weight: 500;
                padding-bottom: 4px;
                transition: color 0.3s;
            }
            
            /* Menu desplegable para alumnos */
            .dropdown {
                position: relative;
            }

            .dropdown > a {
                border-top: 3px solid #e67e22;
                padding-top: 5px;
            }

            .dropdown-menu {
                display: none;
                position: absolute;
                top: 100%;
                left: 0;
                list-style: none;
                background: #fff;
                padding-top: 8px;
            }

            .dropdown-menu li {
                margin: 6px 0;
            }

            .dropdown-menu a {
                border: none;
                font-size: 12px;
                color: #444;
            }

            .dropdown-menu a:hover {
                color: #e67e22;
            }

            /* Mostrar submenú al pasar el cursor */
            .dropdown:hover .dropdown-menu {
                display: block;
            }

            /* Iconos sociales */
            .social-icons {
                margin-left: 20px;
                display: flex;
                gap: 10px;
            }

            .social-icons a {
                color: #111;
                font-size: 14px;
                text-decoration: none;
            }

            /* Sección de galería / banners inferiores */
            .gallery-container {
                display: flex;
                justify-content: center;
                align-items: center;
                gap: 40px;
                margin-top: 50px;
                padding: 20px;
            }

            .gallery-item {
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .gallery-item img {
                max-width: 250px;
                height: auto;
                object-fit: contain;
            }

            /* Pie de página */
            .footer-tag {
                position: fixed;
                bottom: 5px;
                right: 10px;
                font-size: 11px;
                color: #555;
            }
        </style>
    </head>
    <body>
        <header class="header">
            <!-- Logo y título -->
            <img class="logo" src="https://cdn-icons-png.flaticon.com/512/226/226777.png" alt="Logo">
            <h1>Sistema Alumnos</h1>
            
            <!-- Nav --> 
            <nav class="navbar">
                <ul class="nav-list">
                    <li><a href="${pageContext.request.contextPath}/index.jsp">Inicio</a></li>         
                    
                    <!-- Menú Dinámico de Facultades (Práctico 2 - Ejercicios 1 y 2) -->
                    <li class="dropdown">
                        <a href="#">Facultades</a>
                        <ul class="dropdown-menu">
                            <c:forEach var="fac" items="${facultades}">
                                <li><a href="${pageContext.request.contextPath}/Facultad?id=${fac.idfacultad}">${fac.nombre}</a></li>
                            </c:forEach>
                            <c:if test="${empty facultades}">
                                <li><a href="${pageContext.request.contextPath}/ListarCarreras">Ver Carreras</a></li>
                            </c:if>
                        </ul>
                    </li>

                    <li class="dropdown">
                        <a href="#">Alumnos</a>
                        <ul class="dropdown-menu">
                            <li><a href="${pageContext.request.contextPath}/SolicitarDatos">Agregar</a></li>
                            <li><a href="${pageContext.request.contextPath}/Listar">Listar</a></li>    
                        </ul>
                    </li>
              
                    <li class="dropdown">
                        <a href="#">Carreras</a>
                        <ul class="dropdown-menu">
                            <li><a href="${pageContext.request.contextPath}/SolicitarDatosCarrera">Agregar</a></li>
                            <li><a href="${pageContext.request.contextPath}/ListarCarreras">Listar</a></li>
                        </ul>
                    </li>
              
                    <li class="dropdown">
                        <a href="#">Materias</a>
                        <ul class="dropdown-menu">
                            <li><a href="${pageContext.request.contextPath}/SolicitarDatosMateria">Agregar</a></li>
                            <li><a href="${pageContext.request.contextPath}/ListarMaterias">Listar</a></li>
                        </ul>
                    </li>

                    <li class="dropdown">
                        <a href="#">Docentes</a>
                        <ul class="dropdown-menu">
                            <li><a href="${pageContext.request.contextPath}/ListarDocentes">Listar Equipo</a></li>
                        </ul>
                    </li>

                    <li><a href="${pageContext.request.contextPath}/ConsultasEspeciales" style="background-color: #27ae60; color: white; border-radius: 4px; padding: 6px 12px; margin-left: 5px;">Consultas JPQL</a></li>
                </ul>
                                      
                <div class="social-icons">
                    <a href="#"><i class="fa-brands fa-facebook-f"></i></a>
                    <a href="#"><i class="fa-brands fa-twitter"></i></a>
                </div>
                
            </nav>
        </header>
        
        <main class="gallery-container">
            <div class="gallery-item">
                <img src="https://via.placeholder.com/260x180/f39c12/ffffff?text=Java" alt="Banner 1">
            </div>
            <div class="gallery-item">
                <img src="https://cdn-icons-png.flaticon.com/512/226/226777.png" alt="Java Coffee Cup" style="max-height: 180px;">
            </div>
            <div class="gallery-item">
                <img src="https://via.placeholder.com/260x180/e67e22/ffffff?text=Web+Services" alt="Banner 3">
            </div>
        </main>

        <div class="footer-tag">Desarrollo Backend</div>
    </body>
</html>
