<%@ page import="Clases.gestionar_lectores" %>
<%@ page import="Clases.Lectores" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!-- Fuentes y Bootstrap -->
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
 body {
    font-family: 'Inter', sans-serif;
    background: linear-gradient(135deg, #fef6e9, #f6f1eb);
    min-height: 100vh;
    margin: 0;
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

.lector-row {
    background-color: #fffaf3;
    border-radius: 12px;
    padding: 20px;
    margin-bottom: 15px;
    display: flex;
    align-items: center;
    box-shadow: 0 4px 8px rgba(163, 111, 65, 0.1);
    transition: all 0.3s ease;
    cursor: pointer;
}

.lector-row:hover {
    transform: translateY(-3px);
    box-shadow: 0 6px 12px rgba(128, 76, 39, 0.15);
}

.lector-img {
    width: 48px;
    height: 48px;
    border-radius: 50%;
    margin-right: 15px;
    border: 2px solid #d2a679;
}

.lector-info {
    flex-grow: 1;
}

.lector-info h6 {
    margin: 0;
    font-weight: 600;
    color: #5e3b22;
}

.lector-info p {
    margin: 0;
    font-size: 14px;
    color: #7b5a44;
}

.badge-young {
    background-color: #fae7c2;
    color: #5e3b22;
}

.badge-adult {
    background-color: #f0d6b2;
    color: #5e3b22;
}

.badge-senior {
    background-color: #e6bfae;
    color: #5e3b22;
}

.form-card {
    background: #fffaf3;
    padding: 30px;
    border-radius: 16px;
    box-shadow: 0 8px 20px rgba(128, 76, 39, 0.08);
}

.form-card h5 {
    font-weight: 600;
    margin-bottom: 25px;
    color: #804c27;
}

.form-control {
    border-radius: 8px;
    border: 1px solid #d2bba0;
}

.form-control:focus {
    border-color: #a36f41;
    box-shadow: 0 0 6px rgba(163, 111, 65, 0.4);
}

.btn-custom {
    background-color: #a36f41;
    color: white;
    border-radius: 8px;
    font-weight: 500;
    transition: 0.3s;
}

.btn-custom:hover {
    background-color: #804c27;
}

.section-title {
    font-size: 22px;
    font-weight: 600;
    color: #5e3b22;
    margin-bottom: 20px;
}

</style>

<!-- SIDEBAR -->
<div class="sidebar">
    <h5>📚 Biblioteca</h5>
    <ul>
     <li onclick="location.href='index.jsp'">🏠 Inicio</li>
     <li onclick="location.href='index1.jsp'">🔢 Menú Principal</li>
        
    </ul>
</div>

<!-- CONTENIDO -->
<div class="main-content">
    <div class="row g-4">
        <!-- FORMULARIO -->
        <div class="col-md-4">
            <div class="form-card">
                <h5 class="text-center">📋 Registro de Lector</h5>
                <form action="addLector" method="POST">
                    <div class="mb-3">
                        <label for="id" class="form-label">ID</label>
                        <input type="number" id="id" name="id" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label for="nombre" class="form-label">Nombre</label>
                        <input type="text" id="nombre" name="nombre" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label for="edad" class="form-label">Edad</label>
                        <input type="number" id="edad" name="edad" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label for="correo" class="form-label">Correo</label>
                        <input type="email" id="correo" name="correo" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label for="telefono" class="form-label">Teléfono</label>
                        <input type="text" id="telefono" name="telefono" class="form-control" required>
                    </div>
                    <input type="file" class="form-control mb-3" name="icono" accept="image/*" required>
                    <button type="submit" class="btn btn-custom w-100">Registrar</button>
                </form>
            </div>
        </div>

        <!-- LISTADO DE LECTORES -->
        <div class="col-md-8">
            <div class="section-title">👥 Lista de Lectores</div>
            <%
                String rutaDatos = getServletContext().getRealPath("/target/data/lectores.txt");
                gestionar_lectores gestor = new gestionar_lectores(rutaDatos);
                ArrayList<Lectores> misLectores = gestor.getMisLectores();
                if (misLectores != null && !misLectores.isEmpty()) {
                    for (Lectores lector : gestor.getMisLectores()) {
            %>
            <div class="lector-row">
                <img src="https://cdn-icons-png.flaticon.com/512/4213/4213477.png" class="lector-img" alt="Foto">
                <div class="lector-info">
                    <h6><%= lector.getNombre() %></h6>
                    <p><%= lector.getCorreo() %></p>
                    <p><%= lector.getTelefono() %></p>
                </div>
                <div class="book-info"><strong>Imagen:</strong><br>
                <img src="<%= lector.getFoto()%>" width="50" height="50" alt="foto"/>
                </div>
                
                <!-- Botones -->
                <div class="ms-3 d-flex flex-column">
                    <button
                        class="btn btn-sm btn-outline-primary mb-1"
                        data-bs-toggle="modal"
                        data-bs-target="#modalActualizar"
                        onclick="cargarDatos('<%= lector.getId() %>', '<%= lector.getNombre() %>', '<%= lector.getEdad() %>', '<%= lector.getCorreo() %>', '<%= lector.getTelefono() %>')">
                        ✏️
                    </button>

                 
                <button
                    class="btn btn-sm btn-outline-danger"
                    onclick="confirmarEliminacion(<%= lector.getId() %>, '<%= lector.getNombre() %>')">
                    🗑️
                </button>

                </div>
            </div>
            <%      }
                } else {
            %>
            <p class="text-muted">No hay lectores registrados.</p>
            <% } %>
        </div>
    </div>
</div>

<!-- MODAL ACTUALIZAR -->
<div class="modal fade" id="modalActualizar" tabindex="-1" aria-labelledby="modalActualizarLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content" style="border-radius: 12px;">
      <form action="actLector" enctype="multipart/form-data" method="POST">
        <div class="modal-header bg-light">
          <h5 class="modal-title text-primary" id="modalActualizarLabel">✏️ Actualizar Lector</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
        </div>
        <div class="modal-body">
            <input type="hidden" name="id" id="modal-id">

            <div class="mb-3">
                <label for="modal-nombre" class="form-label">Nombre</label>
                <input type="text" name="nombre" class="form-control" id="modal-nombre" placeholder="" required>
            </div>
            <div class="mb-3">
                <label for="modal-edad" class="form-label">Edad</label>
                <input type="number" name="edad" class="form-control" id="modal-edad" placeholder=""  required>
            </div>
            <div class="mb-3">
                <label for="modal-correo" class="form-label">Correo</label>
                <input type="email" name="correo" class="form-control" id="modal-correo" placeholder=""  required>
            </div>
            <div class="mb-3">
                <label for="modal-telefono" class="form-label">Teléfono</label>
                <input type="text" name="telefono" class="form-control" id="modal-telefono" placeholder=""  required>
            </div>
            <div class="mb-3">
                <label for="modal-foto" class="form-label">Foto</label>
                <input type="file" name="foto" class="form-control" id="modal-foto" placeholder=""  required>
            </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
          <button type="submit" class="btn btn-custom">Guardar Cambios</button>
        </div>
      </form>
    </div>
  </div>
</div>

<!-- MODAL DE CONFIRMACIÓN DE ELIMINACIÓN -->
<div class="modal fade" id="modalConfirmarEliminar" tabindex="-1" aria-labelledby="eliminarLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content" style="border-radius: 12px; background-color: #fffaf3;">
      <form action="delLector" method="GET">
        <div class="modal-header">
          <h5 class="modal-title" id="eliminarLabel">🗑️ Confirmar eliminación</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
        </div>
        <div class="modal-body">
          <p>¿Estás seguro de que deseas eliminar al lector <strong id="nombreLectorEliminar"></strong>?</p>
          <input type="hidden" name="id" id="idLectorEliminar">
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
          <button type="submit" class="btn btn-danger">Eliminar</button>
        </div>
      </form>
    </div>
  </div>
</div>

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
function cargarDatos(id, nombre, edad, correo, telefono) {
    document.getElementById("modal-id").value = id;
    document.getElementById("modal-nombre").value = nombre;
    document.getElementById("modal-edad").value = edad;
    document.getElementById("modal-correo").value = correo;
    document.getElementById("modal-telefono").value = telefono;
}

function confirmarEliminacion(id, nombre) {
    document.getElementById("idLectorEliminar").value = id;
    document.getElementById("nombreLectorEliminar").textContent = nombre;
    var modal = new bootstrap.Modal(document.getElementById('modalConfirmarEliminar'));
    modal.show();
}
</script>
