$(document).ready(function () {
    $("#titulo").append("<h1>CHOPP IN STOCK</h1>");
    getProductos();
});
function getProductos() {
    console.log("en stock script");
    $("#tablaContenido").append('');
    $.ajax({
        type: "post",
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
                $("#tablaContenido").append('<tr id="tablaValores"><td>' + estado + '</td><td>' + valor.Nombre + '</td><td>' + valor.Cantidad + '</td><td>' + valor.unidad.Unidad + '</td>        <td>' + valor.Minimo + '</td>        <td>' + valor.Maximo + '</td><td>' + valor.categoria.Categoria + '</td>    </tr>');
            }
            $("#tablaProductos").DataTable({
                scrollY: '570px',
                scrollCollapse: true,
                paging: false
            });
        }
    });
}

function actualizar() {
    $.ajax({
        type: "get",
        url: "ActualizarController",
        async: true,
        cache: false,
        dateType: "json",
        success: function () {            
            alert("Actualizado");
            getProductos();            
        }
    });
}
