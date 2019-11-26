package Stock.Conecction;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Updates {

    // Crear un nuevo producto
    public boolean Alta(String nombre, String minimo, String maximo, String idUnidad, String idCategoria) throws SQLException, ClassNotFoundException {
        try {
            Conexion conexion = Conexion.getConexion();
            Connection con = conexion.getConnectionMySQL();
            PreparedStatement st = con.prepareStatement("INSERT INTO `productos` (`IdProducto`, `Nombre`, `StockMinimo`, `StockMaximo`, `IdUnidad`, `IdCategoria`) VALUES (NULL, '" + nombre + "', '" + minimo + "', '" + maximo + "', '" + idUnidad + "', '" + idCategoria + "')");
            st.execute();

            return true;
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error update Alta: " + e);
            return false;
        }
    }

    public boolean Movimiento(String fecha, String idProd, String cant, String idTipoMov, String nota) {
        try {
            Conexion conexion = Conexion.getConexion();
            Connection con = conexion.getConnectionMySQL();
            PreparedStatement st = con.prepareStatement("INSERT INTO `movimientos` (`IdMovimiento`, `IdProducto`, `Fecha`, `Cantidad`, `Nota`, `IdTipoMovimiento`) VALUES (NULL, '" + idProd + "', '" + fecha + "', '" + cant + "', '" + nota + "', '" + idTipoMov + "')");
            st.execute();
            return true;
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error update Movimiento: " + e);
            return false;
        }
    }

    public boolean Venta(String fecha, String idProd, String cant) {
        try {
            Conexion conexion = Conexion.getConexion();
            Connection con = conexion.getConnectionMySQL();
            PreparedStatement st = con.prepareStatement("INSERT INTO `movimientos` (`IdMovimiento`, `IdProducto`, `Fecha`, `Cantidad`, `Nota`, `IdTipoMovimiento`) VALUES (NULL, '" + idProd + "', '" + fecha + "', '" + cant + "', '3')");
            st.execute();
            return true;
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error update Movimiento: " + e);
            return false;
        }
    }

    public boolean Receta(String idProd, String idProdVenta, String cantidad) {
        try {
            Conexion conexion = Conexion.getConexion();
            Connection con = conexion.getConnectionMySQL();
            PreparedStatement st = con.prepareStatement("INSERT INTO `recetas` (`IdProductoVenta`, `IdProducto`, `Cantidad`) VALUES ('" + idProdVenta + "', '" + idProd + "', '" + cantidad + "')");
            st.execute();
            return true;
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error update Movimiento: " + e);
            return false;
        }
    }
}
