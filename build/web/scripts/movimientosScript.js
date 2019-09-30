/*
INSERT INTO `movimientos` 
(`IdMovimiento`, `IdProducto`, `Fecha`, `Cantidad`, `Nota`, `IdTipoMovimiento`) 
VALUES (NULL, '1', '2019-09-10', '50000', 'Primer carga, desde MySQL', '11')
*/

var productos = [{
    "IdProducto": 1,
    "Nombre": "Equum Honey"
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
var movimientos = [{
    "IdTipoMov": 1,
    "TipoMov": "Compra"
},
{
    "IdTipoMov": 2,
    "TipoMov": "Venta"
},
{
    "IdTipoMov": 3,
    "TipoMov": "Gonzalo"
},
{
    "IdTipoMov": 4,
    "TipoMov": "Omar"
},
{
    "IdTipoMov": 5,
    "TipoMov": "Sebastian"
}
];


// Carga los productos
$(document).ready(function () {
    $(".cuadroProd").html("");
    for (let valor of productos) {
        $(".cuadroProd").append('<option value="' + valor.IdProducto + '">' + valor.Nombre + '</option>');
    }       
    $(".cuadroProd").select2({  
        heigth: 500
                      
    });
});

// Carga los tipos de movimientos
$(document).ready(function () {
    $(".cuadroMov").html("");
    for (let valor of movimientos) {
        $(".cuadroMov").append('<option value="' + valor.IdTipoMov + '">' + valor.TipoMov + '</option>');
    }
    $(".cuadroMov").select2();
});

//Carga la fecha
$(document).ready(function () {
    $(".fecha").append("<input type='text' name='fecha' class='fecha' value='" + new Date().getFullYear() + "-" + new Date().getMonth() + "-" + new Date().getDate() +"'/>");
});

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

// Carga para agregar nuevo producto
/*$("#btnAgregar").click(function () {
    $(".agregar").append('    <br>    <label for="">Producto</label>    <select name="idProd" class="cuadroProd">    </select> <br>    <label for="">Cantidad</label>    <input type="number" name="cant" id="cuadroNum" min="0" /> <br>    <label for="">Unidad</label>    <select class="unidad">    </select> <br>    <label for="">Categoria</label>    <select class="categoria">    </select> <br>    <label for="">Tipo de movimiento</label>    <select name="idTipoMov" class="cuadroMov">    </select> <br>    <label for="">Nota</label>    <textarea name="nota" id="idNota" cols="30" rows=""></textarea> <br>    <input type="date" name="Fecha" id="">Fecha  <br>');
    for (let valor of productos) {
        $(".cuadroProd").append('<option value="' + valor.id + '">' + valor.Nombre + '</option>');
    }
    $(".cuadroProd").select2();
});
*/