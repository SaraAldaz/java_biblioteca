<%@ page import="Clases.gestionar_libros" %>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Clases.Libros" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Gestión de Libros</title>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                font-family: 'Inter', sans-serif;
                background: linear-gradient(135deg, #fef6e9, #f6f1eb);
                margin: 0;
                padding: 0;
            }

            .sidebar {
                height: 100vh;
                background-color: #fffaf3;
                padding: 20px;
                border-right: 1px solid #e5dccf;
                position: fixed;
                width: 240px;
                top: 0;
                left: 0;
            }

            .sidebar h5 {
                font-weight: 600;
                margin-bottom: 30px;
                color: #5e3b22;
            }

            .sidebar ul {
                list-style: none;
                padding-left: 0;
            }

            .sidebar ul li {
                margin-bottom: 15px;
                font-weight: 500;
                color: #804c27;
                cursor: pointer;
                transition: 0.2s;
            }

            .sidebar ul li:hover {
                color: #a36f41;
            }

            .main-content {
                margin-left: 260px;
                padding: 40px;
            }

            .section-title {
                font-size: 28px;
                font-weight: 600;
                color: #5e3b22;
                margin-bottom: 30px;
            }

            .card-admin {
                background: #fffaf3;
                border-radius: 16px;
                box-shadow: 0 6px 20px rgba(128, 76, 39, 0.1);
                padding: 30px;
                transition: 0.3s;
            }

            .btn-login {
                background-color: #a36f41;
                color: white;
                border: none;
                border-radius: 10px;
                padding: 10px 20px;
                font-weight: 500;
                transition: 0.3s ease;
            }

            .btn-login:hover {
                background-color: #804c27;
            }

            .book-shelf {
                background: #e6d5bd;
                border-radius: 12px;
                padding: 30px;
                box-shadow: inset 0 -10px 10px -10px #bba789;
            }

            .book-row {
                display: flex;
                flex-wrap: wrap;
                gap: 20px;
                padding-bottom: 30px;
                border-bottom: 4px solid #c1a378;
                margin-bottom: 30px;
            }

            .book-card {
                flex: 1 0 180px;
                max-width: 180px;
                background: #fffaf3;
                border-left: 10px solid #a36f41;
                padding: 15px;
                border-radius: 8px;
                position: relative;
                height: 260px;
                display: flex;
                flex-direction: column;
                justify-content: space-between;
                box-shadow: 2px 4px 10px rgba(0, 0, 0, 0.1);
            }

            .book-title {
                font-size: 16px;
                font-weight: 600;
                color: #804c27;
            }

            .book-info, .book-description {
                font-size: 13px;
                color: #5e3b22;
            }

            .book-actions {
                position: absolute;
                bottom: 10px;
                right: 10px;
            }
        </style>
    </head>
    <body>
        <div class="sidebar">
            <h5>📚 Administrador</h5>
            <ul>
                <li onclick="location.href = 'index1.jsp'">🔢 Menú Principal</li>
                <li onclick="location.href = 'crud.jsp'">👥 Lectores</li>
            </ul>
        </div>

        <div class="main-content">
            <div class="section-title">Registrar Nuevo Libro</div>
            <div class="row g-4">
                <div class="col-md-6">
                    <div class="card-admin">
                        <form action="addLibro" enctype="multipart/form-data" method="POST">
                            <input type="text" class="form-control mb-3" name="nom_Libro" placeholder="📖 Nombre del Libro" required>
                            <input type="text" class="form-control mb-3" name="codigo_Libro" placeholder="🔐 Código del Libro" required>
                            <select class="form-select mb-3" name="genero_Libro" required>
                                <option value="" disabled selected>🏷️ Género</option>
                                <option value="Ficción">Ficción</option>
                                <option value="Ciencia">Ciencia</option>
                                <option value="Historia">Historia</option>
                                <option value="Fantasía">Fantasía</option>
                                <option value="Infantil">Infantil</option>
                                <option value="Otro">Otro</option>
                            </select>
                            <textarea class="form-control mb-3" name="descripcion" placeholder="📝 Descripción" rows="3" required></textarea>
                            <div class="row">
                                <div class="col">
                                    <input type="number" class="form-control mb-3" name="año" min="1500" max="2100" placeholder="📅 Año" required>
                                </div>
                                <div class="col">
                                    <input type="number" class="form-control mb-3" name="numero_ejemplar" min="1" placeholder="📚 Ejemplares" required>
                                </div>
                            </div>
                            <input type="file" class="form-control mb-3" name="icono" accept="image/*" required>
                            <button type="submit" class="btn btn-login w-100">Registrar Libro</button>
                        </form>
                    </div>
                </div>
            </div>

            <div class="section-title mt-5">📚 Estantería de Libros</div>
            <div class="book-shelf">
                <div class="book-row">
                    <%
                        String rutaDatos = getServletContext().getRealPath("/target/data/libros.txt");
                        gestionar_libros gestor = new gestionar_libros(rutaDatos);
                        ArrayList<Libros> misLibros = gestor.getMisLibros();
                        if (misLibros != null && !misLibros.isEmpty()) {
                            for (Libros libro : gestor.getMisLibros()) {
                    %>
                    <div class="book-card">
                        <div>
                            <div class="book-title"><%= libro.getNom_Libro()%></div>
                            <div class="book-info"><strong>Código:</strong> <%= libro.getCodigo_Libro()%></div>
                            <div class="book-info"><strong>Género:</strong> <%= libro.getGenero_Libro()%></div>
                            <div class="book-info"><strong>Año:</strong> <%= libro.getAño()%></div>
                            <div class="book-info"><strong>Ejemplares:</strong> <%= libro.getNumero_ejemplar()%></div>
                            <div class="book-description mt-2"><%= libro.getDescripción()%></div>
                            <div class="book-info"><strong>Imagen:</strong><br>
                            <img src="<%= libro.getIcono()%>" width="50" height="50" alt="icono" />
                            </div>
                        </div>
                        <div class="book-actions">
                            <button class="btn btn-sm btn-outline-primary" data-bs-toggle="modal" data-bs-target="#modalEditar"
                                    onclick="cargarLibro('<%= libro.getCodigo_Libro()%>', '<%= libro.getNom_Libro()%>', '<%= libro.getGenero_Libro()%>', '<%= libro.getDescripción()%>', '<%= libro.getAño()%>', '<%= libro.getNumero_ejemplar()%>', '<%= libro.getIcono()%>')">✏️</button>
                            <button class="btn btn-sm btn-outline-danger"
                                    onclick="confirmarEliminacion('<%= libro.getCodigo_Libro()%>')">🗑️</button>
                        </div>
                    </div>
                    <%
                        }
                    } else {
                    %>
                    <p class="text-muted text-center w-100">No hay libros registrados.</p>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>


        <!-- MODAL EDITAR LIBRO -->
        <div class="modal fade" id="modalEditar" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <form action="actLibro" enctype="multipart/form-data" method="POST">
                        <div class="modal-header">
                            <h5 class="modal-title">✏️ Editar Libro</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                        </div>
                        <div class="modal-body">
                            <input type="text" class="form-control mb-3" name="nom_Libro" placeholder="📖 Nombre del Libro" required>
                            <input type="text" class="form-control mb-3" name="codigo_Libro" placeholder="🔐 Código del Libro" required>
                            <select class="form-select mb-3" name="genero_Libro" required>
                                <option value="" disabled selected>🏷️ Género</option>
                                <option value="Ficción">Ficción</option>
                                <option value="Ciencia">Ciencia</option>
                                <option value="Historia">Historia</option>
                                <option value="Fantasía">Fantasía</option>
                                <option value="Infantil">Infantil</option>
                                <option value="Otro">Otro</option>
                            </select>
                            <textarea class="form-control mb-3" name="descripcion" placeholder="📝 Descripción" rows="3" required></textarea>
                            <div class="row">
                                <div class="col">
                                    <input type="number" class="form-control mb-3" name="año" min="1500" max="2100" placeholder="📅 Año" required>
                                </div>
                                <div class="col">
                                    <input type="number" class="form-control mb-3" name="numero_ejemplar" min="1" placeholder="📚 Ejemplares" required>
                                </div>
                            </div>
                            <input type="file" class="form-control mb-3" name="icono" accept="image/*" required>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                            <button type="submit" class="btn btn-login">Guardar Cambios</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- MODAL CONFIRMAR ELIMINACIÓN -->
        <div class="modal fade" id="modalConfirmarEliminacion" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">🗑️ Confirmar Eliminación</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                        ¿Estás seguro de que deseas eliminar este libro?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                        <a id="btnConfirmarEliminar" href="#" class="btn btn-danger">Eliminar</a>
                    </div>
                </div>
            </div>
        </div>

        <script>
            function confirmarEliminacion(codigo) {
                const btn = document.getElementById("btnConfirmarEliminar");
                btn.href = "delLibro?codigo_Libro=" + codigo;
                const modal = new bootstrap.Modal(document.getElementById('modalConfirmarEliminacion'));
                modal.show();
            }

            function cargarLibro(codigo, nombre, genero, descripcion, año, ejemplar) {
                document.getElementById("edit_codigo").value = codigo;
                document.getElementById("edit_nombre").value = nombre;
                document.getElementById("edit_genero").value = genero;
                document.getElementById("edit_descripcion").value = descripcion;
                document.getElementById("edit_año").value = año;
                document.getElementById("edit_ejemplar").value = ejemplar;
            }
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>

