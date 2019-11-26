package Stock.Conecction;

import Stock.Entities.ProductoVenta;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class Conexion {

    private static Conexion conectado;

    //Evitar instancia mediante "new"
    private Conexion() {
    }

    // Instancia sólo una vez por éste metodo
    public static Conexion getConexion() {
        if (conectado == null) {
            conectado = new Conexion();
        }
        return conectado;
    }

    public Connection getConnectionMySQL() throws ClassNotFoundException, SQLException {
        Connection dataBaseConnection;
        Class.forName("com.mysql.cj.jdbc.Driver");
        String sourceURL = "jdbc:mysql://127.0.0.1:3306/choppin_db?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
        dataBaseConnection = DriverManager.getConnection(sourceURL, "root", "");
        System.out.println("Conectado a MySQL");
        return dataBaseConnection;
    }

    public Connection getConnectionSQLserver() throws ClassNotFoundException, SQLException {
        Connection dataBaseConnection;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String sourceURL = "jdbc:sqlserver://GMACHINE:1433;databaseName=choppin_ventas;";
        dataBaseConnection = DriverManager.getConnection(sourceURL, "GGG", "admin");
        System.out.println("Conectado a SQL Server");
        return dataBaseConnection;
    }

    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        Conexion con = new Conexion();
        Connection sqlS = con.getConnectionSQLserver();
        Statement st = sqlS.createStatement();
        String Consulta = "select IdProducto, Categorias.Nombre, Marcas.Nombre, Productos.Nombre from Productos \n"
                + "inner join Categorias on Productos.IdCategoria = Categorias.IdCategoria \n"
                + "inner join Marcas on Productos.IdMarca = Marcas.IdMarca";
        ResultSet rs = st.executeQuery(Consulta);
        System.out.println("cargo el query");
        ArrayList<ProductoVenta> productoVenta = new ArrayList<>();
        while (rs.next()) {
            String nombre = rs.getString("Nombre");
            int idProd = rs.getInt("IdProducto");

            String nombreFinal = "Hola";
            ProductoVenta tempProdVta = new ProductoVenta(idProd, nombreFinal);

            productoVenta.add(tempProdVta);
            System.out.println(productoVenta);
        }
    }
}
