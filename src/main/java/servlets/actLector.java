package servlets;

import Clases.Lectores;
import Clases.gestionar_lectores;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
@MultipartConfig
@WebServlet(name = "actLector", urlPatterns = {"/actLector"})
public class actLector extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String rutaDatos = getServletContext().getRealPath("/target/data/lectores.txt");
        gestionar_lectores gestor = new gestionar_lectores(rutaDatos);
        // 1. Obtener los parámetros enviados desde el formulario
        int id = Integer.parseInt(request.getParameter("id"));           // ID del usuario a actualizar
        String nombre = request.getParameter("nombre");                  // Nuevo nombre del usuario
        int edad = Integer.parseInt(request.getParameter("edad"));      // Nueva edad del usuario
        String correo = request.getParameter("correo");                 // Nuevo correo del usuario
        int telefono = Integer.parseInt(request.getParameter("telefono")); // Nuevo teléfono del usuario
        Part filePart = request.getPart("foto"); 
        
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String uploadPath = getServletContext().getRealPath("") + File.separator + "imagenes"; 
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir(); 
        }
        
        File file = new File(uploadDir, fileName); 
        System.out.println("Guardando archivo en: " + file.getAbsolutePath());
        try (InputStream input = filePart.getInputStream()) {
       
            Files.copy(input, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
        }
        
        System.out.println("Archivo guardado en: " + file.getAbsolutePath());

        String filePath = "imagenes/" + fileName;
        Lectores miLector = new Lectores(id, nombre, correo, edad, telefono, filePath);
        gestor.actualizarLector(miLector);

        response.sendRedirect("crud.jsp?success=editado");
    }

}
