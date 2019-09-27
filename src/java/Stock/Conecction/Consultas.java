package Stock.Conecction;

import Stock.Class.Productos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class Consultas extends Conexion {

    public ArrayList getProductos() throws SQLException {
        ArrayList<Productos> productos = new ArrayList<>();

        try {
            Statement st = con.createStatement();
            String Consulta = "select * from productos";
            ResultSet rs = st.executeQuery(Consulta);

            while (rs.next()) {
                int IdProducto = rs.getInt("IdProducto");
                String Nombre = rs.getString("Nombre");
                int Minimo = rs.getInt("StockMinimo");
                int Maximo = rs.getInt("StockMaximo");
                int IdUnidad = rs.getInt("IdUnidad");
                int IdCategoria = rs.getInt("IdCategoria");

                Productos tempProd = new Productos(IdProducto, Nombre, IdUnidad, Minimo, Maximo, IdCategoria);

                productos.add(tempProd);
                System.out.println(productos);
            }
        } catch (SQLException e) {
        }
        return productos;
    }

    public static void main(String[] args) throws SQLException {
        Consultas con = new Consultas();
        System.out.println(con.getProductos());
    }

    public boolean Autenticacion(String user, String pass) throws SQLException {
        Statement st = con.createStatement();
        ResultSet rs = null;
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
