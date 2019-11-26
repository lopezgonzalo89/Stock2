package Stock.Entities;

public class TipoMovimiento {
    private String movimiento;
    private int idMovimiento;

    public TipoMovimiento(String movimiento, int idMovimiento) {
        this.movimiento = movimiento;
        this.idMovimiento = idMovimiento;
    }

    public int getIdMovimiento() {
        return idMovimiento;
    }

    public void setIdMovimiento(int idMovimiento) {
        this.idMovimiento = idMovimiento;
    }

    public String getMovimiento() {
        return movimiento;
    }

    public void setMovimiento(String movimiento) {
        this.movimiento = movimiento;
    }    
}
