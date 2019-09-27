package Stock.Class;

public class Productos {

    private int IdProducto;
    private String Nombre;
    private int Unidad;
    private int Minimo;
    private int Maximo;
    private int Categoria;

    public Productos(int idProducto, String nombre, int unidad, int minimo, int maximo, int categoria) {
        super();
        IdProducto = idProducto;
        Nombre = nombre;
        Unidad = unidad;
        Minimo = minimo;
        Maximo = maximo;
        Categoria = categoria;
    }

    public Productos(String nombre, int unidad, int minimo, int maximo, int categoria) {
        super();
        Nombre = nombre;
        Unidad = unidad;
        Minimo = minimo;
        Maximo = maximo;
        Categoria = categoria;
    }

    @Override
    public String toString() {
        return "Productos [IdProducto=" + IdProducto + ", Nombre=" + Nombre + ", Unidad="
                + Unidad + ", Minimo=" + Minimo + ", Maximo=" + Maximo + ", Categoria=" + Categoria + "]";
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

    public int getUnidad() {
        return Unidad;
    }

    public void setUnidad(int Unidad) {
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

    public int getCategoria() {
        return Categoria;
    }

    public void setCategoria(int Categoria) {
        this.Categoria = Categoria;
    }

}
