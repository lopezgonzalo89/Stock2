package Stock.Servlet;

import Stock.Conecction.Conexion;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MovimientosControllera extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            Connection con = Conexion.getConnection();
            
            String fecha = request.getParameter("fecha");
            String idProd = request.getParameter("idProd");
            String cant = request.getParameter("cant");
            String idTipoMov = request.getParameter("idTipoMov");
            String nota = request.getParameter("nota");

            PreparedStatement st = con.prepareStatement("INSERT INTO `movimientos` (`IdMovimiento`, `IdProducto`, `Fecha`, `Cantidad`, `Nota`, `IdTipoMovimiento`) VALUES (NULL, '"+ idProd +"', '"+ fecha +"', '"+ cant +"', '"+ nota +"', '"+ idTipoMov +"')");
            st.execute();
            System.out.println(st);
            response.sendRedirect("movimientos.html"); 
                    
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error " + e);
        }
    }
}
