package Stock.Servlet;

import Stock.Conecction.Updates;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RecetasController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

            Updates up = new Updates();

            String IdProducto = request.getParameter("idProd");
            String IdProductoVenta = request.getParameter("idProdVenta");
            String Cantidad = request.getParameter("cantidad");            

            boolean resp = up.Receta(IdProducto, IdProductoVenta, Cantidad);
            if (resp == true) {
                request.setAttribute("estado", "Cargado correctamente");
                RequestDispatcher rd;
                rd = request.getRequestDispatcher("/recetas.jsp");
                rd.forward(request, response);

                response.sendRedirect("movimientos.jsp");
            } else {
                request.setAttribute("estado", "Fallo al cargar");
                RequestDispatcher rd;
                rd = request.getRequestDispatcher("/recetas.jsp");
                rd.forward(request, response);
            }
        } catch (IOException | ServletException e) {
        }
    }
}
