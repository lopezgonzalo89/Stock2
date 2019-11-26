package Stock.Servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Stock.Conecction.Consultas;

public class LoginController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String user = request.getParameter("user");
        String pass = request.getParameter("pass");
        try {
            Consultas con = new Consultas();
            if (con.Autenticacion(user, pass)) {
                response.sendRedirect("productos.jsp");
            } else {
                //toDO: Mostrar mensaje al usuario
                response.sendRedirect("index.jsp");
            }
        } catch (IOException | ClassNotFoundException | SQLException e) {
                //toDO: Guardar exepción
            System.out.println("Error " + e);
            response.sendRedirect("index.jsp");
        }
    }
}
