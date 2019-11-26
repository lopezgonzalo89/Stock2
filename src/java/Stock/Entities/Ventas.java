package Stock.Entities;

public class Ventas {

    private int IdVentaDetalle;
    private int IdProducto;
    private int Cantidad;

    public Ventas(int IdVentaDetalle, int IdProducto, int Cantidad) {
        this.IdVentaDetalle = IdVentaDetalle;
        this.IdProducto = IdProducto;
        this.Cantidad = Cantidad;
    }

    public int getIdVentaDetalle() {
        return IdVentaDetalle;
    }

    public void setIdVentaDetalle(int IdVentaDetalle) {
        this.IdVentaDetalle = IdVentaDetalle;
    }

    public int getIdProducto() {
        return IdProducto;
    }

    public void setIdProducto(int IdProducto) {
        this.IdProducto = IdProducto;
    }

    public int getCantidad() {
        return Cantidad;
    }

    public void setCantidad(int Cantidad) {
        this.Cantidad = Cantidad;
    }

}
