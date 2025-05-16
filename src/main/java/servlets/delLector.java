package servlets;

import Clases.Lectores;
import Clases.gestionar_lectores;
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

@WebServlet("/delLector")
public class delLector extends HttpServlet {
    
     protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Llama al método processRequest para configuraciones iniciales (opcional)
        String rutaDatos = getServletContext().getRealPath("/target/data/lectores.txt");
        gestionar_lectores gestor = new gestionar_lectores(rutaDatos);
        
        processRequest(request, response);

        int id = Integer.parseInt(request.getParameter("id"));
        
        gestor.eliminarLector(id);

        response.sendRedirect("crud.jsp");
        
    }

}
