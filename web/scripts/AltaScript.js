$(document).ready(function () {
    $("#titulo").append("<h1>ALTA</h1>");
    getCategorias();
    getUnidades();
});
function getCategorias() {
    $.ajax({
        type: "post",
        url: "AltaController?action=getCategoriasParaAlta",
        async: true,
        cache: false,
        dateType: "json",
        success: function (resp) {
            console.log("respuesta: " + resp);
            $(".cuadroCat").html("");
            for (let valor of resp) {
                $(".cuadroCat").append('<option value="' + valor.IdCategoria + '">' + valor.Categoria + '</option>');
            }
            $(".cuadroCat").select2({
                heigth: 500
            });
        }
    });
};

function getUnidades() {
    $.ajax({
        type: "post",
        url: "AltaController?action=getUnidades",
        async: true,
        cache: false,
        dateType: "json",
        success: function (resp2) {
            console.log("respuesta2: " + resp2);
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