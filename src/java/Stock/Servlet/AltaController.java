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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AltaController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String action = request.getParameter("action");

        if ("getCategorias".equals(action)) {
            Consultas con = new Consultas();
            ArrayList resp = con.getCategorias();

            String json = new Gson().toJson(resp);
            out.println(json);
        }
        if ("getUnidades".equals(action)) {
            Consultas con = new Consultas();
            ArrayList resp2 = con.getUnidades();

            String json2 = new Gson().toJson(resp2);
            out.println(json2);
        } else {
            System.out.println("En el else");
            Updates up = new Updates();

            String nombre = request.getParameter("nombre");
            String minimo = request.getParameter("minimo");
            String maximo = request.getParameter("maximo");
            String idUnidad = request.getParameter("idUnidad");
            String idCategoria = request.getParameter("idCategoria");

            boolean resp = up.Alta(nombre, minimo, maximo, idUnidad, idCategoria);
            response.sendRedirect("alta.jsp");
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
            Logger.getLogger(productosController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(productosController.class.getName()).log(Level.SEVERE, null, ex);
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
