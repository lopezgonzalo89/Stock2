package Stock.Servlet;

import Stock.Conecction.Consultas;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class VentasController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        /*
                Obtengo la ultVentaGuardada de mi tabla en mySQL
                Obtengo la ultVentaGuardada del programa en sqlServer
         */
        try {
            Consultas consulta = new Consultas();
            int UltVentaGuardada = consulta.ultVentaGuardada();
            System.out.println("La ult venta " + UltVentaGuardada);

            
            

        } catch (Exception e) {
        }
    }
}
