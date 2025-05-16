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
import java.util.ArrayList;

@WebServlet("/addLibro")
@MultipartConfig
public class addLibro extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String rutaDatos = getServletContext().getRealPath("/target/data/libros.txt");
        gestionar_libros gestor = new gestionar_libros(rutaDatos);
        
        String codigo_Libro = request.getParameter("codigo_Libro");
        String nom_Libro = request.getParameter("nom_Libro");
        String genero_Libro = request.getParameter("genero_Libro");
        String descripcion = request.getParameter("descripcion");
        int año = Integer.parseInt(request.getParameter("año"));
        int numero_ejemplar = Integer.parseInt(request.getParameter("numero_ejemplar"));
        String icono = request.getParameter("icono");

        ArrayList<Libros> misLibros = gestor.getMisLibros();

        for (Libros libro : misLibros) {
            if (libro.getCodigo_Libro().equals(codigo_Libro)) {
                request.setAttribute("accionDuplicacionCodigo", "true");
                request.getRequestDispatcher("libros.jsp").forward(request, response);
                return;
            }
        }

                
        Libros miLibro = new Libros(codigo_Libro, nom_Libro, genero_Libro, descripcion, año, numero_ejemplar, icono);
        gestor.agregarLibro(miLibro);

        response.sendRedirect("admin.jsp");
        
    }
}
