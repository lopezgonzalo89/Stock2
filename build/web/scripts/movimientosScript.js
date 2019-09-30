$(document).ready(function () {
    getMovimientos();
    getProductos();
});
function getMovimientos() {
    $.ajax({
        type: "get",
        url: "MovimientosIndex",
        async: true,
        cache: false,
        dateType: "json",
        success: function (resp) {
            console.log("ajax en coller" + resp);
            $(".cuadroMov").html("");
            for (let valor of resp) {
                $(".cuadroMov").append('<option value= ' + valor.idMovimiento + '>' + valor.movimiento + '</option>');
            }
            $(".cuadroMov").select2();
        }
    });
}
function getProductos() {
    $.ajax({
        type: "get",
        url: "IndexController",
        async: true,
        cache: false,
        dateType: "json",
        success: function (resp2) {
            console.log("addddddddddd" + resp2);
            $(".cuadroProd").html("");
            for (let valor of resp2) {
                $(".cuadroProd").append('<option value="' + valor.IdProducto + '">' + valor.Nombre + '</option>');
            }
            $(".cuadroProd").select2({
                heigth: 500
            });
        }
    });
}

