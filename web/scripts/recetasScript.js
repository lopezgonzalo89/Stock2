$(document).ready(function () {
    $("#titulo").append("<h1>RECETAS</h1>");
    getProductos();
    getProductosVentas();
});


// PREGUNTAR SI ESTÁ BIEN LLAMAR A OTRO CONTROLLER PARA USAR SU MÉTODO
function getProductos() {
    $.ajax({
        type: "post",
        url: "productosController",
        async: true,
        cache: false,
        dateType: "json",
        success: function (resp) {
            console.log("en el ajax");
            console.log(resp);
            $(".cuadroProd").html("");
            for (let valor of resp) {
                $(".cuadroProd").append('<option value="' + valor.IdProducto + '">' + valor.Nombre + '</option>');
            }
            $(".cuadroProd").select2({
                heigth: 500
            });
        }
    });
}

function getProductosVentas() {
    $.ajax({
        type: "post",
        url: "ProductosVentasController",
        async: true,
        cache: false,
        dateType: "json",
        success: function (resp) {
            $(".cuadroProdVenta").html("");
            for (let valor of resp) {
                $(".cuadroProdVenta").append('<option value="' + valor.IdProductoVenta + '">' + valor.Nombre + '</option>');
            }
            $(".cuadroProd").select2({
                heigth: 500
            });
        }
    });
}
