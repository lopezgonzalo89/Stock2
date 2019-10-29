<!-- @LopezGonzalo89 - Septiembre 2019-->

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">

        <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="vendor/datatables/DataTables-1.10.18/css/jquery.dataTables.min.css">        
        <link rel="stylesheet" href="vendor/datatables/DataTables-1.10.18/css/dataTables.bootstrap4.min.css">
        <link rel="stylesheet" href="css/layout.css">
        <link rel="stylesheet" href="css/estilosProductos.css">

        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <script src="vendor/jquery/jquery-3.4.1.min.js"></script>
        <script src="vendor/popper/popper.min.js"></script>        
        <script src="vendor/datatables/datatables.min.js"></script>
        <script src="scripts/productosScript.js"></script>

        <title>Control de Stock</title>
    </head>

    <body>
        <%@include file="templates/header.jsp" %>

        <div class="container contenido">            
            <table id="tablaProductos" class="table stripe hover" style="width:100%">
                <thead>
                    <tr>
                        <th>ESTADO</th>
                        <th>PRODUCTO</th>
                        <th>CANTIDAD</th>
                        <th>UNIDAD</th>
                        <th>Stock Mínimo</th>
                        <th>Stock Máximo</th>
                        <th>CATEGORIA</th>
                    </tr>
                </thead>
                <tbody id="tablaContenido">
                </tbody>
            </table>
        </div>

        <%@include file="templates/footer.jsp" %>
    </body>
</html>