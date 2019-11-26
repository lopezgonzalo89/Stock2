package Stock.Entities;

public class Unidad {

    private String Unidad;
    private int IdUnidad;

    public Unidad(String Unidad, int IdUnidad) {
        this.Unidad = Unidad;
        this.IdUnidad = IdUnidad;
    }

    public String getUnidad() {
        return Unidad;
    }

    public void setUnidad(String Unidad) {
        this.Unidad = Unidad;
    }

    public int getIdUnidad() {
        return IdUnidad;
    }

    public void setIdUnidad(int IdUnidad) {
        this.IdUnidad = IdUnidad;
    }
}
