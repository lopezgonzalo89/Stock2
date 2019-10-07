<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="ventor/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/variables.css">
        <link rel="stylesheet" href="css/estilosMovimientos.css">
        <link rel="stylesheet" href="ventor/select2/css/select2.min.css">
        <title>Control de Stock</title>
    </head>

    <body>
        <div class="container cuerpo">
            <div class="row header">
                <div class="col-2">
                    <img class="logo" src="Imagenes/Logo.png" alt="">
                </div>
                <div class="col-8" Id="titulo">
                    <h1>MOVIMIENTOS</h1>
                </div>
                <div class="col-2">
                    <img class="logo" src="Imagenes/Logo.png" alt="">
                </div>
            </div>
            <div class="row nav">
                <div class="col-9">
                </div>
                <div class="col-3">
                    <a class="btn btn-success" href="productos.jsp">STOCK</a>
                    <a class="btn btn-success" href="alta.jsp">ALTA PRODUCTOS</a>
                </div>
            </div>
        </div>
        <div class="container contenido">
            <div class="formulario">
                <form action="movimientosController">
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
                        <input type="number" name="cant" id="cuadroNum" required /> &nbsp;&nbsp;
                        <br>
                        <br>        
                        <label for="">Tipo de movimiento</label> &nbsp;
                        <select name="idTipoMov" class="cuadroMov">
                        </select>
                        <br><br>
                        <textarea name="nota" id="idNota" cols="70" rows="2" placeholder="NOTA"></textarea> <br>
                        <input type="submit" class="btn btn-info" id="btnCargar" value="Cargar" />
                    </div>
                </form>
            </div>
            <h3>${estado}</h3>
            <br>             
        </div>

        <div class="container">
            <footer class="row">
                <div class="col-8"></div>
                <h5>�ChoppIn - Italia 953, San Miguel, Argentina.</h5>
            </footer>
        </div>

        <script src="ventor/jquery/jquery-3.4.1.min.js"></script>
        <script src="ventor/bootstrap/js/bootstrap.min.js"></script>
        <script src="scripts/movimientosScript.js"></script>
        <script src="ventor/select2/js/select2.js"></script>
    </body>

</html>