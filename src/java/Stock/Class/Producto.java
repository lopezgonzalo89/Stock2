package Stock.Class;

public class Producto {

    private int IdProducto;
    private String Nombre;    
    private int Minimo;
    private int Maximo;
    private Categoria categoria;    
    private Unidad unidad;
    private float Cantidad;

    public Producto(int IdProducto, String Nombre, int Minimo, int Maximo, Categoria categoria, Unidad unidad, float Cantidad) {
        this.IdProducto = IdProducto;
        this.Nombre = Nombre;
        this.Minimo = Minimo;
        this.Maximo = Maximo;
        this.categoria = categoria;
        this.unidad = unidad;
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

    public Categoria getCategoria() {
        return categoria;
    }

    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }

    public Unidad getUnidad() {
        return unidad;
    }

    public void setUnidad(Unidad unidad) {
        this.unidad = unidad;
    }

    public float getCantidad() {
        return Cantidad;
    }

    public void setCantidad(float Cantidad) {
        this.Cantidad = Cantidad;
    }       
}