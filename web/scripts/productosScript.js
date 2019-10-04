$(document).ready(function () {
    getProductos();
});
function getProductos() {
    console.log("en stock script");
    $.ajax({
        type: "get",
        url: "productosController",
        async: true,
        cache: false,
        dateType: "json",
        success: function (resp) {
            console.log(resp);
            $("#tablaContenido").html("");
            for (let valor of resp) {
                if (valor.Cantidad < valor.Minimo) {
                    estado = "Comprar";
                } else if (valor.Cantidad > valor.Maximo) {
                    estado = "Sobra";
                } else {
                    estado = "Hay";
                }
                $("#tablaContenido").append('<tr id="tablaValores"><td>' + estado + '</td><td>' + valor.Nombre + '</td><td>' + valor.Cantidad + '</td><td>' + valor.Unidad + '</td>        <td>' + valor.Minimo + '</td>        <td>' + valor.Maximo + '</td><td>' + valor.Categoria + '</td>    </tr>');
            }
            $("#tablaProductos").DataTable({
                scrollY: '570px',
                scrollCollapse: true,
                paging: false
            });
        }
    });
}
