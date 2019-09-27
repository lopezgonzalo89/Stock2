package Stock.Conecction;

import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {
    public java.sql.Connection con;

    public Conexion() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String sourceURL = "jdbc:mysql://localhost:3306/choppin_db?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
            con = DriverManager.getConnection(sourceURL, "root", "");
            System.out.println("Conectado a la base de datos");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error " + e);
        }
    }
}