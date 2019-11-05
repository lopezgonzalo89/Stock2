package Stock.Servlet;

import Stock.Conecction.Updates;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class CargarProducto extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        
            Updates up = new Updates();

            String nombre = request.getParameter("nombre");
            String minimo = request.getParameter("minimo");
            String maximo = request.getParameter("maximo");
            String idUnidad = request.getParameter("idUnidad");
            String idCategoria = request.getParameter("idCategoria");

            boolean resp = up.Alta(nombre, minimo, maximo, idUnidad, idCategoria);
            if (resp == true) {
                request.setAttribute("estado", "Cargado correctamente");
                RequestDispatcher rd;
                rd = request.getRequestDispatcher("/alta.jsp");
                rd.forward(request, response);

                response.sendRedirect("movimientos.jsp");
            } else {
                request.setAttribute("estado", "Fallo al cargar");
                RequestDispatcher rd;
                rd = request.getRequestDispatcher("/alta.jsp");
                rd.forward(request, response);
            }                       
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(CargarProducto.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(CargarProducto.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
