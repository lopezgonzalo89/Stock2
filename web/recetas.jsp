<!-- @LopezGonzalo89 - Septiembre 2019-->

<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="ventor/bootstrap/css/bootstrap.min.css">    
        <link rel="stylesheet" href="css/layout.css">
        <link rel="stylesheet" href="css/estilosRecetas.css">
        <link rel="stylesheet" href="ventor/select2/css/select2.min.css">

        <script src="ventor/jquery/jquery-3.4.1.min.js"></script>
        <script src="ventor/bootstrap/js/bootstrap.min.js"></script>
        <script src="scripts/recetasScript.js"></script>
        <script src="ventor/select2/js/select2.js"></script>

        <title>Control de Stock</title>
    </head>

    <body>
        <%@include file="templates/header.jsp" %>

        <div class="container contenido">
            <div class="formulario">
                <form action="recetasController">
                    <div id="form">
                        <p>
                            Primero elegir el producto que se va a elaborar su receta. <br>
                            Luego elijo de a un ingrediente a la vez y toco en el boton Cargar. <br>
                            Si el ingrediente no se encuentra en la lista se debe agregar yendo a la página <a
                                href=alta.jsp>Alta</a>
                        </p>
                        <label> Producto </label>                    
                        <select name="idProdVenta" class="cuadroProdVenta">
                        </select>
                        <br>
                        <br>
                        <label> Se elabora con el siguiente ingrediente: </label>
                        <br>
                        <select name="idProd" class="cuadroProd">
                        </select>
                        <br>
                        <br>
                        <label> Cantidad: </label>                    
                        <input type="number" >
                        <br>
                        <label> Tipo de unidad: </label>                    
                        <select name="idUnidad" class="cuadroUnidad">
                        </select>
                        <br>
                        <br>
                        <input type="submit" class="btn btn-info" id="btnCargar" value="Cargar"/>
                    </div>
                </form>
            </div>
        </div>

        <%@include file="templates/footer.jsp" %>

    </body>
</html>