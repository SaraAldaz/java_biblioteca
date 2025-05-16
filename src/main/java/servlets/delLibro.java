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

@WebServlet("/delLibro")
public class delLibro extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);

        String rutaDatos = getServletContext().getRealPath("/target/data/libros.txt");
        gestionar_libros gestor = new gestionar_libros(rutaDatos);
        
        processRequest(request, response);

        String codigo_Libro = request.getParameter("codigo_Libro");

        gestor.eliminarLibro(codigo_Libro);

        response.sendRedirect("admin.jsp");
    }
}
