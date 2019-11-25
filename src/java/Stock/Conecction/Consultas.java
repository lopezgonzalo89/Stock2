package Stock.Conecction;

import Stock.Class.Categoria;
import Stock.Class.TipoMovimiento;
import Stock.Class.Producto;
import Stock.Class.Unidad;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class Consultas {

    public boolean Autenticacion(String user, String pass) throws SQLException, ClassNotFoundException {
        Conexion conexion = Conexion.getConexion();
        Connection con = conexion.getConnectionMySQL();
        Statement st = con.createStatement();
        ResultSet rs;
        String Consulta = "select * from usuarios";
        rs = st.executeQuery(Consulta);
        System.out.println("En consultas validacion");

        while (rs.next()) {
            if (user.equals(rs.getString("Usuario")) && pass.equals(rs.getString("Contrasena"))) {
                return true;
            }
        }
        return false;
    }

    public ArrayList getProductos() throws SQLException, ClassNotFoundException {
        ArrayList<Producto> productos = new ArrayList<>();

        try {
            Conexion conexion = Conexion.getConexion();
            Connection con = conexion.getConnectionMySQL();
            Statement st = con.createStatement();
            String Consulta = "select * from productos INNER JOIN Categorias on productos.IdCategoria = categorias.IdCategoria INNER JOIN unidades on productos.IdUnidad = unidades.IdUnidad ";
            ResultSet rs = st.executeQuery(Consulta);

            while (rs.next()) {
                String Nombre = rs.getString("Nombre");
                int Minimo = rs.getInt("StockMinimo");
                int Maximo = rs.getInt("StockMaximo");
                String Unidad = rs.getString("TipoUnidad");
                int IdUnidad = rs.getInt("IdUnidad");
                String Categoria = rs.getString("Categoria");
                int IdCategoria = rs.getInt("IdCategoria");
                int IdProducto = rs.getInt("IdProducto");
                
                //Categoria de un producto
                Categoria categoria = new Categoria(Categoria, IdCategoria);
                
                //Unidad de un producto                
                Unidad unidad = new Unidad(Unidad, IdUnidad);

                //Cantidad de un producto (suma todos los movimientos)
                Statement stmCantidad = con.createStatement();
                String Consulta2 = "select SUM(cantidad) from movimientos where movimientos.IdProducto = " + IdProducto + "";
                ResultSet rs2 = stmCantidad.executeQuery(Consulta2);

                while (rs2.next()) {
                    float cantidad = rs2.getFloat("SUM(cantidad)");
                    System.out.println("rs2 " + cantidad);

                    Producto tempProd = new Producto(IdProducto, Nombre, Minimo, Maximo, categoria, unidad, cantidad);

                    productos.add(tempProd);
                }
            }
        } catch (SQLException e) {
        }
        return productos;
    }

    public ArrayList getMovimientos() throws SQLException, ClassNotFoundException {
        ArrayList<TipoMovimiento> movimientos = new ArrayList<>();

        try {
            Conexion conexion = Conexion.getConexion();
            Connection con = conexion.getConnectionMySQL();
            Statement st = con.createStatement();
            String Consulta = "SELECT * from tipomovimientos";
            ResultSet rs = st.executeQuery(Consulta);

            while (rs.next()) {
                String mov = rs.getString("TipoMovimiento");
                int idMov = rs.getInt("IdTipoMovimiento");

                TipoMovimiento tempMov = new TipoMovimiento(mov, idMov);

                movimientos.add(tempMov);
                System.out.println(tempMov);
            }
        } catch (SQLException e) {
        }
        return movimientos;
    }

    public ArrayList getCategorias() throws SQLException, ClassNotFoundException {
        ArrayList<Categoria> categorias = new ArrayList<>();
        try {
            Conexion conexion = Conexion.getConexion();
            Connection con = conexion.getConnectionMySQL();
            Statement st = con.createStatement();
            String Consulta = "SELECT * from categorias";
            ResultSet rs = st.executeQuery(Consulta);

            while (rs.next()) {
                String cat = rs.getString("Categoria");
                int idCat = rs.getInt("IdCategoria");

                Categoria tempCat = new Categoria(cat, idCat);

                categorias.add(tempCat);
                System.out.println(tempCat);
            }
        } catch (SQLException e) {
        }
        return categorias;
    }

    public ArrayList getUnidades() throws SQLException, ClassNotFoundException {
        ArrayList<Unidad> unidades = new ArrayList<>();
        try {
            Conexion conexion = Conexion.getConexion();
            Connection con = conexion.getConnectionMySQL();
            Statement st = con.createStatement();
            String Consulta = "SELECT * from unidades";
            ResultSet rs = st.executeQuery(Consulta);

            while (rs.next()) {
                String unid = rs.getString("TipoUnidad");
                int idUnid = rs.getInt("IdUnidad");

                Unidad tempUnid = new Unidad(unid, idUnid);

                unidades.add(tempUnid);
                System.out.println(tempUnid);
            }
        } catch (SQLException e) {
        }
        return unidades;
    }
}
