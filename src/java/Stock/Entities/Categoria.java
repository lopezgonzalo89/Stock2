package Stock.Entities;

public class Categoria {

    private String Categoria;
    private int IdCategoria;

    public Categoria(String categoria, int idCategoria) {
        this.Categoria = categoria;
        this.IdCategoria = idCategoria;
    }

    public String getCategoria() {
        return Categoria;
    }

    public void setCategoria(String categoria) {
        this.Categoria = categoria;
    }

    public int getIdCategoria() {
        return IdCategoria;
    }

    public void setIdCategoria(int idCategoria) {
        this.IdCategoria = idCategoria;
    }

}
