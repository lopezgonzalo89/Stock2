<!-- aaa@LopezGonzalo89 - Septiembre 2019-->

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <link rel="stylesheet" href="ventor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="ventor/datatables/DataTables-1.10.18/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="css/estilosProductos.css">
    <link rel="stylesheet" href="css/variables.css">
    <link rel="stylesheet" href="ventor/datatables/DataTables-1.10.18/css/dataTables.bootstrap4.min.css">

    <title>Control de Stock</title>
</head>

<body>
    <div class="container cuerpo">
        <div class="row header">
            <div class="col-2">
                <img class="logo" src="Imagenes/Logo.png" alt="">
            </div>
            <div class="col-8" Id="titulo">
                <h1>CHOPP IN STOCK</h1>
            </div>
            <div class="col-2">
                <img class="logo" src="Imagenes/Logo.png" alt="">
            </div>
        </div>
        <div class="row nav">
            <div class="col-4">
            </div>
            <div class="col-3">
            </div>
            <div class="col-1">
            </div>
            <div class="col-4">
                <a class="btn btn-success" href="movimientos.jsp">MOVIMIENTOS</a>
                <a class="btn btn-success" href="alta.jsp">ALTA PRODUCTOS</a>
            </div>
        </div>
    </div>
    <div class="container contenido">
        <div class="row">
            <div class="col-12">
                <table id="tablaProductos" class="table stripe hover" style="width:100%">
                    <thead>
                        <tr>
                            <th>ESTADO</th>
                            <th>PRODUCTO</th>
                            <th>CANTIDAD</th>
                            <th>UNIDAD</th>
                            <th>Stock Mín</th>
                            <th>Stock Máx</th>
                            <th>CATEGORIA</th>
                        </tr>
                    </thead>
                    <tbody id="tablaContenido">
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="container">
        <footer class="row">
            <div class="col-8"></div>
            <h5>©ChoppIn - Italia 953, San Miguel, Argentina.</h5>
        </footer>
    </div>

    <script src="ventor/jquery/jquery-3.4.1.min.js"></script>
    <script src="ventor/popper/popper.min.js"></script>
    <script src="ventor/bootstrap/js/bootstrap.min.js"></script>
    <script src="ventor/datatables/datatables.min.js"></script>
    <script src="scripts/productosScript.js"></script>
</body>

</html>