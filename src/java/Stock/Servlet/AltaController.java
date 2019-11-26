package Stock.Servlet;

import Stock.Conecction.Consultas;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AltaController extends HttpServlet {

    // Carga los combos en la página Alta
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json;charset=UTF-8");

        try {

            PrintWriter out = response.getWriter();

            String action = request.getParameter("action");
            System.out.println("En AltaController");

            switch (action) {
                case "getCategorias":
                    Consultas con = new Consultas();
                    ArrayList resp = con.getCategorias();

                    String json = new Gson().toJson(resp);
                    out.println(json);
            }
            switch (action) {
                case "getUnidades":
                    Consultas con = new Consultas();
                    ArrayList resp2 = con.getUnidades();

                    String json2 = new Gson().toJson(resp2);
                    out.println(json2);
            }
        } catch (IOException | ClassNotFoundException | SQLException e) {
        }
    }
}
