<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="ventor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/variables.css">
    <link rel="stylesheet" href="css/estilosAlta.css">
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
                <h1>ALTA de PRODUCTOS</h1>
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
                <a class="btn btn-success" href="movimientos.jsp">MOVIMIENTOS</a>
            </div>
        </div>
    </div>
    <div class="container contenido">
        <div class="formulario">
            <form action="cargarMovimiento">
                <div id="form">      
                    <br>                    
                    <label>Producto</label> &nbsp;
                    <input type="text" name="nombre">
                    <br> 
                    <br>                                    
                    <label>Stock Mínimo</label> &nbsp;
                    <input type="number" name="minimo" id="cuadroMin" required /> &nbsp;&nbsp;
                    <br>
                    <label>Stock Máximo</label> &nbsp;
                    <input type="number" name="maximo" id="cuadroMax" required /> &nbsp;&nbsp;
                    <br>                              
                    <br>        
                    <label>Unidad</label> &nbsp;
                    <select name="idUnidad" class="cuadroUnidad">
                    </select>
                    <br><br>    
                    <label>Categoria</label> &nbsp;
                    <select name="idCategoria" class="cuadroCat">
                    </select>
                    <br><br>
                    <input type="submit" class="btn btn-info" id="btnCargar" value="Cargar" />

                    <div class="agregar">
                        <!-- Select -->
                    </div>
                </div>
            </form>
        </div>
        <h3> ${estado}</h3>
        <br>
    </div>

    <div class="container">
        <footer class="row">
            <div class="col-8"></div>
            <h5>©ChoppIn - Italia 953, San Miguel, Argentina.</h5>
        </footer>
    </div>

    <script src="ventor/jquery/jquery-3.4.1.min.js"></script>
    <script src="ventor/bootstrap/js/bootstrap.min.js"></script>
    <script src="scripts/AltaScript.js"></script>
    <script src="ventor/select2/js/select2.js"></script>
</body>

</html>