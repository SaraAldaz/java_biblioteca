<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.*" %>
<%
    String mensaje = null;
    String user = request.getParameter("usuario");
    String pass = request.getParameter("clave");
    boolean accesoConcedido = false;

    if ("POST".equalsIgnoreCase(request.getMethod()) && user != null && pass != null) {
        if (user.equals("SARKA") && pass.equals("admin")) {
            accesoConcedido = true;
        } else {
            mensaje = "❌ Usuario o contraseña incorrectos.";
        }
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Iniciar Sesión - Biblioteca</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #fef6e9, #f6f1eb);
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }

        .login-container {
            display: flex;
            max-width: 900px;
            width: 100%;
            background: #fffaf3;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(128, 76, 39, 0.15);
            overflow: hidden;
        }

        .left-panel {
            background: linear-gradient(135deg, #a36f41, #d2a679);
            color: white;
            padding: 50px 30px;
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            position: relative;
        }

        .left-panel h2 {
            font-size: 32px;
            font-weight: 600;
        }

        .left-panel p {
            font-size: 16px;
            margin-top: 10px;
        }

        .right-panel {
            flex: 1;
            padding: 50px 40px;
            background-color: #fffaf3;
        }

        .form-control {
            border-radius: 10px;
            border: 1px solid #d2bba0;
        }

        .form-control:focus {
            box-shadow: 0 0 5px rgba(128, 76, 39, 0.4);
            border-color: #a36f41;
        }

        .btn-login {
            background-color: #a36f41;
            color: white;
            border: none;
            border-radius: 10px;
            padding: 10px 20px;
            width: 100%;
            font-weight: 500;
            transition: 0.3s ease;
        }

        .btn-login:hover {
            background-color: #804c27;
        }

        .text-small {
            font-size: 13px;
            color: #7b5a44;
        }

        .right-panel h4 {
            color: #5e3b22;
            margin-bottom: 25px;
            font-weight: 600;
        }

        a {
            text-decoration: none;
            color: #a36f41;
        }

        a:hover {
            text-decoration: underline;
            color: #804c27;
        }

        @media (max-width: 768px) {
            .login-container {
                flex-direction: column;
            }
            .left-panel, .right-panel {
                width: 100%;
                text-align: center;
            }
        }
    </style>
</head>
<body>

<div class="login-container">
    <!-- Panel izquierdo -->
    <div class="left-panel">
        <a href="index1.jsp" class="btn btn-light mb-4" style="
            align-self: flex-start;
            background-color: #fffaf3;
            color: #804c27;
            border: none;
            border-radius: 8px;
            padding: 6px 14px;
            font-weight: 500;
            transition: 0.3s;
            text-decoration: none;">
            ← Volver
        </a>
        <h2>¡Panel de administrador!</h2>
        <p>Accede a tu cuenta para gestionar los libros.</p>
    </div>

    <!-- Panel derecho -->
    <div class="right-panel">
        <% if (accesoConcedido) { %>
            <div class="alert alert-success">
                ✅ ¡Bienvenido, <strong><%= user %></strong>! Has iniciado sesión correctamente.
            </div>
            <a href="admin.jsp" class="btn btn-login mt-3">Ir al Panel</a>
        <% } else { %>
            <h4>Iniciar Sesión</h4>
            <% if (mensaje != null) { %>
                <div class="alert alert-danger" role="alert"><%= mensaje %></div>
            <% } %>
            <form method="POST">
                <div class="mb-3">
                    <label class="form-label">Usuario o Correo</label>
                    <input type="text" name="usuario" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Contraseña</label>
                    <input type="password" name="clave" class="form-control" required>
                </div>
                <button type="submit" class="btn btn-login">Iniciar Sesión</button>
            </form>
        <% } %>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
