package Stock.Conecction;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Updates {

    public boolean Autenticacion(String nombre, String minimo, String maximo, String idUnidad, String idCategoria) throws SQLException, ClassNotFoundException {
        try {
            Connection con = Conexion.getConnection();
            PreparedStatement st = con.prepareStatement("INSERT INTO `productos` (`IdProducto`, `Nombre`, `StockMinimo`, `StockMaximo`, `IdUnidad`, `IdCategoria`) VALUES (NULL, '"+ nombre +"', '"+ minimo + "', '"+ maximo +"', '"+ idUnidad +"', '"+ idCategoria +"')");
            st.execute();
            
            return true;
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error " + e);
        }
        return false;
    }
}
