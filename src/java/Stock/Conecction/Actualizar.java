package Stock.Conecction;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Actualizar {

    public static void main(String[] args) {

        int UltVentaGuardada = 0;

        try {
            // Ultima venta guardada
            Conexion con = Conexion.getConexion();
            Connection conexion = con.getConnectionMySQL();
            Statement stUltVenta = conexion.createStatement();
            ResultSet rsUltVenta = stUltVenta.executeQuery(
                    "select * from ultventa order by IdUltVenta desc limit 1");
            while (rsUltVenta.next()) {
                UltVentaGuardada = rsUltVenta.getInt("IdUltVenta");
            }
            
            // Todas las ventas
            Conexion conexion3 = Conexion.getConexion();
            Connection sqlS = conexion3.getConnectionSQLserver();
            Statement st = sqlS.createStatement();
            String Consulta = "select IdVentaDetalle, VentasDetalles.IdProducto, cantidad from VentasDetalles";
            ResultSet rs = st.executeQuery(Consulta);                        
            
            // Recorre las ventas            
            while (rs.next()) {
                int IdVentaDetalle = rs.getInt("IdVentaDetalle");
                int IdProducto = rs.getInt("IdProducto");
                int Cantidad = rs.getInt("cantidad");

                // Compara si alguna venta es mayor a la última guardada
                if (UltVentaGuardada < IdVentaDetalle) {
                    //Actualiza el Último IdVentaGuardado
                    //PreparedStatement st = conexion.prepareStatement("INSERT INTO `ultventa` (`IdUltVenta`) VALUES ('" + IdVentaDetalle + "')");
                    //st.execute();

                    // Receta según IdProducto en IdVentaDetalle
                    Statement receta = conexion.createStatement();
                    ResultSet rsReceta = receta.executeQuery("Select * from recetas where IdProductoVenta =" + IdProducto);                    
                    while(rsReceta.next()){                        
                        float cant = rsReceta.getFloat("Cantidad");
                        int IdProdInt = rsReceta.getInt("IdProducto");                        
                        float cantTotalInt = cant * Cantidad;
                        
                        String IdProd = String.valueOf(IdProdInt);
                        String cantTotal = String.valueOf(cantTotalInt);
                        
                        //INSERT INTO `movimientos` (`IdMovimiento`, `IdProducto`, `Fecha`, `Cantidad`, `Nota`, `IdTipoMovimiento`) VALUES (NULL, '1', NULL, '2', 'Insertado desde el control Stock', '3')
                        PreparedStatement st2 = conexion.prepareStatement("INSERT INTO `movimientos` (`IdMovimiento`, `IdProducto`, `Fecha`, `Cantidad`, `Nota`, `IdTipoMovimiento`) VALUES (NULL, '"+ IdProd +"', NULL, ' -"+ cantTotal +"', 'Insertado desde el control Stock', '3')");
                        st2.execute();
                    }                                        
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
        }
    }
}
