<!-- @LopezGonzalo89 - Septiembre 2019-->

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">

        <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="vendor/select2/css/select2.min.css">
        <link rel="stylesheet" href="css/layout.css">
        <link rel="stylesheet" href="css/estilosMovimientos.css">

        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <script src="vendor/jquery/jquery-3.4.1.min.js"></script>
        <script src="scripts/movimientosScript.js"></script>
        <script src="vendor/select2/js/select2.js"></script>

        <title>Control de Stock</title>
    </head>

    <body>
        <%@include file="templates/header.jsp" %>

        <div class="container contenido">
            <div class="formulario">
                <form action="movimientos" method="GET">
                    <div id="form">
                        <br>
                        <label> Fecha </label> &nbsp;&nbsp; <input type ="date" name="fecha"/>
                        <br>        
                        <br>                    
                        <label >Producto</label> &nbsp;
                        <select name="idProd" class="cuadroProd">
                        </select>                    
                        <br> 
                        <br>                                    
                        <label for="">Cantidad</label> &nbsp;
                        <input type="number" name="cant" id="cuadroNum"/> &nbsp;&nbsp;
                        <br>
                        <br>        
                        <label for="">Tipo de movimiento</label> &nbsp;
                        <select name="idTipoMov" class="cuadroMov">
                        </select>
                        <br><br>
                        <textarea name="nota" id="idNota" cols="70" rows="2" placeholder="NOTA"></textarea> <br>
                        <input type="submit" class="btn btn-info" id="btnCargar" value="Cargar"/>
                    </div>

                    <h3>${estado}</h3>
                    
                </form>
            </div>
            <br>             
        </div>

        <%@include file="templates/footer.jsp" %>

    </body>
</html>