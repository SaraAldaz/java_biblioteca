<%@ page import="Clases.gestionar_libros" %>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Clases.Libros" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Alquiler de Libros</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #fef6e9, #f6f1eb);
            margin: 0;
            padding: 0;
        }

        .header-bar {
            background-color: #a36f41;
            color: white;
            padding: 16px 24px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header-bar h4 {
            margin: 0;
            font-weight: 600;
        }

        .btn-volver {
            background-color: #fffaf3;
            color: #5e3b22;
            border: none;
            padding: 6px 14px;
            border-radius: 6px;
            font-weight: 500;
        }

        .btn-volver:hover {
            background-color: #f1e6d7;
        }

        .table-container {
            padding: 30px 60px;
        }

        .table {
            background: #fffaf3;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 6px 20px rgba(128, 76, 39, 0.1);
        }

        .table thead {
            background-color: #a36f41;
            color: white;
        }

        .table th, .table td {
            vertical-align: middle;
            font-size: 14px;
            color: #5e3b22;
        }

        .btn-alquilar {
            background-color: #a36f41;
            color: white;
            border: none;
            border-radius: 6px;
            padding: 6px 14px;
            font-weight: 600;
        }

        .btn-alquilar:hover {
            background-color: #804c27;
        }

        #toast-container {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            z-index: 9999;
        }

        .toast-message {
            background-color: #fffaf3;
            color: #5e3b22;
            padding: 20px 30px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
            font-size: 16px;
            text-align: center;
            max-width: 400px;
        }
    </style>
</head>
<body>

<div class="header-bar">
    <h4>📚 Lista de Libros Disponibles</h4>
    <a href="index1.jsp" class="btn-volver">← Volver</a>
</div>

<div class="table-container">
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Código</th>
                <th>Imagen</th>
                <th>Nombre del Libro</th>
                <th>Género</th>
                <th>Descripción</th>
                <th>Año</th>
                <th>Ejemplares</th>
                <th>Acción</th>
            </tr>
        </thead>
        <tbody>
        <%
            String rutaDatos = getServletContext().getRealPath("/target/data/libros.txt");
            gestionar_libros gestor = new gestionar_libros(rutaDatos);
            ArrayList<Libros> misLibros = gestor.getMisLibros();
            if (misLibros != null && !misLibros.isEmpty()) {
                for (Libros libro : gestor.getMisLibros()) {
        %>
            <tr>
                <td><%= libro.getCodigo_Libro() %></td>
                <td><img src="<%= libro.getIcono() %>" alt="icono" width="50" height="50"></td>
                <td><%= libro.getNom_Libro() %></td>
                <td><%= libro.getGenero_Libro() %></td>
                <td><%= libro.getDescripción() %></td>
                <td><%= libro.getAño() %></td>
                <td><%= libro.getNumero_ejemplar() %></td>
                <td><button class="btn-alquilar" onclick="preguntarDias('<%= libro.getNom_Libro() %>')">Alquilar</button></td>
            </tr>
        <%
                }
            } else {
        %>
            <tr><td colspan="7" class="text-center text-muted">No hay libros disponibles.</td></tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>

<div id="toast-container"></div>

<script>
function preguntarDias(nombreLibro) {
        mostrarToast(`✅ Has alquilado Este libro.`);
}

function mostrarToast(mensaje) {
    const container = document.getElementById('toast-container');
    container.innerHTML = '';
    const toast = document.createElement('div');
    toast.className = 'toast-message';
    toast.innerText = mensaje;
    container.appendChild(toast);
    setTimeout(() => toast.remove(), 2000);
}
</script>

</body>
</html>