package Stock.Class;

public class Producto {

    private String Nombre;
    private String Unidad;
    private int Minimo;
    private int Maximo;
    private String Categoria;
    private int IdProducto;
    private int Cantidad;

    public int getCantidad() {
        return Cantidad;
    }

    public void setCantidad(int Cantidad) {
        this.Cantidad = Cantidad;
    }

    public Producto(String Nombre, String Unidad, int Minimo, int Maximo, String Categoria, int IdProducto, int Cantidad) {
        this.Nombre = Nombre;
        this.Unidad = Unidad;
        this.Minimo = Minimo;
        this.Maximo = Maximo;
        this.Categoria = Categoria;
        this.IdProducto = IdProducto;
        this.Cantidad = Cantidad;
    }


    public int getIdProducto() {
        return IdProducto;
    }

    public void setIdProducto(int IdProducto) {
        this.IdProducto = IdProducto;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getUnidad() {
        return Unidad;
    }

    public void setUnidad(String Unidad) {
        this.Unidad = Unidad;
    }

    public int getMinimo() {
        return Minimo;
    }

    public void setMinimo(int Minimo) {
        this.Minimo = Minimo;
    }

    public int getMaximo() {
        return Maximo;
    }

    public void setMaximo(int Maximo) {
        this.Maximo = Maximo;
    }

    public String getCategoria() {
        return Categoria;
    }

    public void setCategoria(String Categoria) {
        this.Categoria = Categoria;
    }

}
