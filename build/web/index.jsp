<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">

        <link rel="stylesheet" href="css/styleIndex.css"/>
        <script src="js/scriptIndex.js"></script>
        <link rel="stylesheet" href="ventor/bootstrap/css/bootstrap.min.css">        
        <title>Login</title>
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
            </div>
        </div>
        <div class="container contenido">
            <h1>Login de usuario</h1>
            <div>
                <form action="Validacion" method ="post">
                    <label>Usuario </label> <input type="text" name="user" id="user"> <br>
                    <label> Contraseña </label><input type="password" name="pass" id="pass">
                    <p><input type="submit" name="Entrar" id="Entrar" value="Entrar"></p>
                </form>
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
    </body>
</html>

