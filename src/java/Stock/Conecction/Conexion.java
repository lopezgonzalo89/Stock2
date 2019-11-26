package Stock.Conecction;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

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
}
