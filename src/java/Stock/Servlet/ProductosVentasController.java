package Stock.Servlet;

import Stock.Conecction.Consultas;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ProductosVentasController extends HttpServlet {
    //CARGA LOS PRODUCTOS VENTAS EN EL COMBO DE RECETAS
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");
        try {
            PrintWriter out = response.getWriter();
            Consultas consulta = new Consultas();
            ArrayList resp;
            resp = consulta.getProductosVenta();
            
            String json = new Gson().toJson(resp);
            out.println(json);
            
        } catch (IOException e) {
        }
    }
}
