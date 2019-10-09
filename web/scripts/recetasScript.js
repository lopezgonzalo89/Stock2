$(document).ready(function () {
    getProductos();    
    getUnidades();
});

function getProductos() {
    $.ajax({
        type: "get",
        url: "productosController",
        async: true,
        cache: false,
        dateType: "json",
        success: function (resp2) {
            console.log("respuesta de productosController" + resp2);
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

function getUnidades() {
    $.ajax({
        type: "get",
        url: "AltaController?action=getUnidades",
        async: true,
        cache: false,
        dateType: "json",
        success: function (resp2) {
            $(".cuadroUnidad").html("");
            for (let valor of resp2) {
                $(".cuadroUnidad").append('<option value="' + valor.IdUnidad + '">' + valor.Unidad + '</option>');
            }
            $(".cuadroUnidad").select2({
                heigth: 500
            });
        }
    });
};