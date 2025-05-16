package servlets;

import Clases.Libros;
import Clases.gestionar_libros;
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
@WebServlet(name = "actLibro", urlPatterns = {"/actLibro"})
public class actLibro extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String rutaDatos = getServletContext().getRealPath("/target/data/libros.txt");
        gestionar_libros gestor = new gestionar_libros(rutaDatos);
        // 1. Obtener los parámetros enviados desde el formulario
        String codigo_Libro = request.getParameter("codigo_Libro"); 
        String nom_Libro = request.getParameter("nom_Libro"); 
        String genero_Libro = request.getParameter("genero_Libro");          
        String descripcion = request.getParameter("descripcion");       
        int año = Integer.parseInt(request.getParameter("año"));          
        int numero_ejemplar = Integer.parseInt(request.getParameter("numero_ejemplar")); 
        Part filePart = request.getPart("icono"); 

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
        Libros miLibro = new Libros(codigo_Libro, nom_Libro, genero_Libro, descripcion, año, numero_ejemplar, filePath);
        gestor.actualizarLibro(miLibro);

        response.sendRedirect("admin.jsp?success=editado");
        
    }
}
