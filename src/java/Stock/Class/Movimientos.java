package Stock.Class;

public class Movimientos {
    private String movimiento;
    private Productos producto;

    public Movimientos(String movimiento, Productos producto) {
        this.movimiento = movimiento;
        this.producto = producto;
    }

    public String getMovimiento() {
        return movimiento;
    }

    public void setMovimiento(String movimiento) {
        this.movimiento = movimiento;
    }

    public Productos getProducto() {
        return producto;
    }

    public void setProducto(Productos producto) {
        this.producto = producto;
    }
}
