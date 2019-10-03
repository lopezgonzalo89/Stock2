$(document).ready(function () {
    getCategorias();
    getUnidades();
});
function getCategorias() {
    $.ajax({
        type: "get",
        url: "AltaController?action=getCategorias",
        async: true,
        cache: false,
        dateType: "json",
        success: function (resp) {
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