package Stock.Servlet;

import Stock.Conecction.Consultas;
import Stock.Conecction.Updates;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MovimientosController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");

        try {
            PrintWriter out = response.getWriter();

            String action = request.getParameter("action");

            // El action getTiposMovimientos carga el Combo
            if ("getTiposMovimientos".equals(action)) {
                Consultas con = new Consultas();
                ArrayList resp = con.getMovimientos();

                String json = new Gson().toJson(resp);
                out.println(json);

                // Sino hay action, Se carga un movimiento
            } else {
                Updates up = new Updates();

                String fecha = request.getParameter("fecha");
                String idProd = request.getParameter("idProd");
                String cant = request.getParameter("cant");
                String idTipoMov = request.getParameter("idTipoMov");
                String nota = request.getParameter("nota");

                boolean resp = up.Movimiento(fecha, idProd, cant, idTipoMov, nota);
                if (resp == true) {
                    request.setAttribute("estado", "Cargado correctamente");
                    RequestDispatcher rd;
                    rd = request.getRequestDispatcher("/movimientos.jsp");
                    rd.forward(request, response);

                    response.sendRedirect("movimientos.jsp");
                } else {
                    request.setAttribute("estado", "Fallo al cargar");
                    RequestDispatcher rd;
                    rd = request.getRequestDispatcher("/movimientos.jsp");
                    rd.forward(request, response);
                }
            }
        } catch (IOException | ClassNotFoundException | SQLException | ServletException e) {
        }
    }
}
