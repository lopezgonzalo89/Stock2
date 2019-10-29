package Stock.Conecction;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {
    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Connection dataBaseConnection;
            Class.forName("com.mysql.cj.jdbc.Driver");
            String sourceURL = "jdbc:mysql://127.0.0.1:3306/choppin_db?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
            dataBaseConnection = DriverManager.getConnection(sourceURL, "root", "");
            System.out.println("Conectado a MySQL");        
        return dataBaseConnection;
    }
    public static Connection getConnectionSQLserver() throws ClassNotFoundException, SQLException {
        Connection dataBaseConnection;
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String sourceURL = "jdbc:sqlserver://GMACHINE\\GGG:1433;databaseName=Choppin_ventas;";
            dataBaseConnection = DriverManager.getConnection(sourceURL, "sa", "");
            System.out.println("Conectado a SQL Server");        
        return dataBaseConnection;
    }
    
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        Conexion con = new Conexion();
        Conexion.getConnectionSQLserver();
    }
}
