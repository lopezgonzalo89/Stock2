$(document).ready(function () {
    getProductos();
});
function getProductos() {
    $.ajax({
        type: "get",
        url: "IndexController",
        async: true,
        cache: false,
        dateType: "json",
        success: function (resp) {
            console.log(resp);
            $("#tablaContenido").html("");
            for (let valor of resp) {
                if (valor.Cantidad < valor.StockMinimo) {
                    estado = "Comprar";
                } else if (valor.Cantidad > valor.StockMaximo) {
                    estado = "Sobra";
                } else {
                    estado = "Hay";
                }
                $("#tablaContenido").append('<tr id="tablaValores"><td>' + estado + '</td><td>' + valor.Nombre + '</td><td> agregar cantidad</td><td>' + valor.Unidad + '</td>        <td>' + valor.Minimo + '</td>        <td>' + valor.Maximo + '</td><td>' + valor.Categoria + '</td>    </tr>');
            }
        }
    });
}
$(document).ready(function () {
    $("#tablaProductos").DataTable({
        scrollY: '570px',
        scrollCollapse: true,
        paging: false
    });
});