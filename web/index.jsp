<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                getProductos();
            });
            function getProductos() {
                alert("a")
                $.ajax({
                    type: "get",
                    url: "IndexController",
                    async: true,
                    cache: false,
                    /*dateType: "json",*/
                    success: function (resp) {
                        var datos = resp
                        console.log("console.log(datos) = " + datos)
                        console.log("datos.length= " + datos.length)

                        var string = datos
                        var array = string.split("Productos")
                        console.log(array)
                    }
                    /*var productos = resp
                     alert("jsodn: " + productos[3])*/
                });
            }
        </script>
        <title>JSP conectado al Servlet IndexController</title>
    </head>
    <body>
        <h1>JSP index.jsp</h1>
    </body>
</html>