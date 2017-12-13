<%-- 
    Document   : actividad
    Created on : 27/10/2017, 11:17:07 AM
    Author     : j_saravia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" type="text/css" href="../diseno/css/materialize.css" media="screen,projection"/> 
        <!--<link rel="stylesheet" type="text/css" href="../diseno/css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="../diseno/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="../diseno/css/bootstrap-grid.css">  
        <link rel="stylesheet" type="text/css" href="../diseno/css/bootstrap-reboot.css">   -->
        <link rel="stylesheet" type="text/css" href="../diseno/css/toastr.min.css">
        <link rel="stylesheet" type="text/css" href="../diseno/css/estilos.css">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="http://www.cccucuta.org.co/template/images/favicon.png" type="image/png" />
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <title>VICTIMAS</title>
    </head>
    <body>
        <%
            if(session.getAttribute("idAdministrador") == null || session.getAttribute("idAdministrador").toString().isEmpty()){
                response.sendRedirect("../index.jsp");
            }
            %>
        <jsp:include page="head.jsp" />
        <div>
            <jsp:include page="nav.jsp" />
        </div>
        <div class="row" style="margin-top: 10px;">
            <div class="col m2 offset-m8 input-field">
                <i class="material-icons prefix">search</i>
                <input id="documentoCon" type="number" class="validate">
                <label for="documentoCon">DOCUMENTO</label>
            </div>
            <div class="col m2" >
                <a class="btn waves-effect waves-light grey lighten-1" onclick="cargarEstudiante3()" style="margin-top: 15px;"><i class="material-icons prefix">search</i></a>
                <a href="#" class="" onclick="abrirMenu()"><i class="material-icons">help_outline</i></a>
            </div>
        </div>
        <div class="row" style="margin-top: 20px;">
            <div class="col xl11 l11 m11 s11 offset-05">
                <div class="panel panel-danger">
                    <div class="panel-heading registro">
                        <h3 class="panel-title">ACOMPAÑAMIENTO DE:  - <a id="nombreEstudiante"></a></h3>
                    </div>
                    <div class="panel-body" id="contenido">

                    </div>
                </div>
            </div>
        </div>
        <div align="center">
            <a class="btn waves-effect waves-light green lighten-1" onclick="guardarAcompanamiento();" style="margin-top: 15px;" id="btnGuardar" disabled>GUARDAR</a>
        </div>




        <!-- Tap Target Structure -->
        <div class="tap-target" data-activates="adicion">
            <div class="tap-target-content">
                <h5>AGREGAR</h5>
                <p>Este boton permite agregar otro acompañamiento</p>
            </div>
        </div>
        <div class="fixed-action-btn" style="bottom: 45px; right: 24px;">
            <a class="btn-floating btn-large red waves-effect waves-green" id="adicion" onclick="crearFila();" disabled>
                <i class="material-icons">add</i>
            </a>

        </div> 
        <jsp:include page="foot.jsp"></jsp:include>

        <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script type="text/javascript" src="../diseno/js/materialize.min.js"></script>
        <script type="text/javascript" src="../diseno/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="../diseno/js/blockUI.js"></script>
        <script type="text/javascript" src="../diseno/js/toastr.min.js"></script>
        <script type="text/javascript" src="../diseno/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.0.3/sweetalert2.all.js"></script>


    </body>
</html>
