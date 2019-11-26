package Stock.Entities;

public class ProductoVenta {
    private int IdProductoVenta;
    private String Nombre;

    public ProductoVenta(int idProducto, String nombre) {
        this.IdProductoVenta = idProducto;
        this.Nombre = nombre;
    }

    public int getIdProductoVenta() {
        return IdProductoVenta;
    }

    public void setIdProductoVenta(int IdProductoVenta) {
        this.IdProductoVenta = IdProductoVenta;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String nombre) {
        this.Nombre = nombre;
    }    
}
