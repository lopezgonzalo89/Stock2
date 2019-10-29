package Stock.Servlet;

import Stock.Conecction.Consultas;
import Stock.Conecction.Updates;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MovimientosController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String action = request.getParameter("action");
        
        // El action getTiposMovimientos carga el Combo
        if ("getTiposMovimientos".equals(action)) {
            Consultas con = new Consultas();
            ArrayList resp = con.getMovimientos();

            String json = new Gson().toJson(resp);
            out.println(json);
            
        // Sino hay action, se espera que se active el botón Cargar
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
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(MovimientosController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(MovimientosController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
