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

@WebServlet("/addLector")
@MultipartConfig
public class addLector extends HttpServlet {
 protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     
        String rutaDatos = getServletContext().getRealPath("/target/data/lectores.txt");
        gestionar_lectores gestor = new gestionar_lectores(rutaDatos);
        
        int id = Integer.parseInt(request.getParameter("id"));
        String nombre = request.getParameter("nombre");         
        int edad = Integer.parseInt(request.getParameter("edad"));        
        String correo = request.getParameter("correo");          
        int telefono = Integer.parseInt(request.getParameter("telefono"));
        String foto = request.getParameter("foto");
        
        ArrayList<Lectores> misLectores = gestor.getMisLectores();
        
        for (Lectores miLector : misLectores) {
            if (miLector.getId() == id) {
                request.setAttribute("accionDuplicacionID", "true");
                request.getRequestDispatcher("crud.jsp").forward(request, response);
                return;
            }
        }
        
        Lectores miLector = new Lectores(id, nombre, correo, edad, telefono, foto);
        gestor.agregarLector(miLector);

        response.sendRedirect("crud.jsp");
        
    }

}
