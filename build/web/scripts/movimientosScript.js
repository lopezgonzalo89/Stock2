var productos = [{
        "IdProducto": 1,
        "Nombre": "Cerveza Heineken"
    },
    {
        "IdProducto": 2,
        "Nombre": "Segundo"
    },
    {
        "IdProducto": 3,
        "Nombre": "Tercero"
    },
    {
        "IdProducto": 4,
        "Nombre": "Cuarto"
    },
    {
        "IdProducto": 5,
        "Nombre": "Quinto"
    },
    {
        "IdProducto": 6,
        "Nombre": "Sexto"
    }
];
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

// Carga tipo de unidad a mano
var unidad = null;
$(document).ready(function () {
    if (unidad == null) {
        $(".unidad").append('<option>UNIDAD</option>')
    } else if (unidad == 1) {
        $(".unidad").append('<option>Unidades</option>')
    } else if (unidad == 2) {
        $(".unidad").append('<option>Mililitros</option>')
    } else if (unidad == 3) {
        $(".unidad").append('<option>Kilogramos</option>')
    } else if (unidad == 4) {
        $(".unidad").append('<option>Gramos</option>')
    }
});

// Carga tipo de categoria a mano
var categoria = null;
$(document).ready(function () {
    if (categoria === null) {
        $(".categoria").append('<option>CATEGORIA</option>');
    } else if (categoria === 1) {
        $(".categoria").append('<option>Cerveza tirada</option>');
    } else if (categoria === 2) {
        $(".categoria").append('<option>Cerveza de litro</option>');
    } else if (categoria === 3) {
        $(".categoria").append('<option>Porrones</option>');
    } else if (categoria === 4) {
        $(".categoria").append('<option>Destilados</option>');
    } else if (categoria === 5) {
        $(".categoria").append('<option>Aperitivos</option>');
    } else if (categoria === 6) {
        $(".unidad").append('<option>Licores</option>');
    } else if (categoria === 7) {
        $(".categoria").append('<option>Bebidas sin alcohol</option>');
    }
});

