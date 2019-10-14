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
            System.out.println("Conectado a la base de datos");        
        return dataBaseConnection;
    }
}
