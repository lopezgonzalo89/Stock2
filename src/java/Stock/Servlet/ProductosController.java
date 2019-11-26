package Stock.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Stock.Conecction.Consultas;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import com.google.gson.Gson;

public class ProductosController extends HttpServlet {

    // CARGA LOS PRODUCTOS EN LA TABLA PRINCIPAL
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("application/json;charset=UTF-8");
        try {
            PrintWriter out = response.getWriter();
            Consultas con = new Consultas();
            ArrayList resp;
            resp = con.getProductos();

            String json = new Gson().toJson(resp);
            out.println(json);
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ProductosController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
