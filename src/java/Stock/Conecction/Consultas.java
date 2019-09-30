package Stock.Conecction;

import Stock.Class.Productos;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class Consultas extends Conexion {

    public ArrayList getProductos() throws SQLException, ClassNotFoundException {
        ArrayList<Productos> productos = new ArrayList<>();

        try {
            Connection con = Conexion.getConnection();
            Statement st = con.createStatement();
            String Consulta = "select * from productos INNER JOIN Categorias on productos.IdCategoria = categorias.IdCategoria INNER JOIN unidades on productos.IdUnidad = unidades.IdUnidad ";
            ResultSet rs = st.executeQuery(Consulta);
         
            while (rs.next()) {
                int IdProducto = rs.getInt("IdProducto");
                String Nombre = rs.getString("Nombre");
                int Minimo = rs.getInt("StockMinimo");
                int Maximo = rs.getInt("StockMaximo");
                String Unidad = rs.getString("TipoUnidad");
                String Categoria = rs.getString("Categoria");

                Productos tempProd = new Productos(Nombre, Unidad, Minimo, Maximo, Categoria);

                productos.add(tempProd);
                System.out.println(productos);
            }
        } catch (SQLException e) {
        }
        return productos;
    }

    public boolean Autenticacion(String user, String pass) throws SQLException, ClassNotFoundException {
        Connection con = Conexion.getConnection();
        Statement st = con.createStatement();
        ResultSet rs;
        String Consulta = "select * from usuarios";
        rs = st.executeQuery(Consulta);

        while (rs.next()) {
            if (user.equals(rs.getString("Usuario")) && pass.equals(rs.getString("Contrasena"))) {
                return true;
            }
        }
        return false;
    }
}
