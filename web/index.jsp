<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" type="text/css" href="diseno/css/materialize.css" media="screen,projection"/> 
        <!--<link rel="stylesheet" type="text/css" href="../diseno/css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="../diseno/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="../diseno/css/bootstrap-grid.css">  
        <link rel="stylesheet" type="text/css" href="../diseno/css/bootstrap-reboot.css">   -->
        <link rel="stylesheet" type="text/css" href="diseno/css/toastr.min.css">
        <link rel="stylesheet" type="text/css" href="diseno/css/estilos.css">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="http://www.cccucuta.org.co/template/images/favicon.png" type="image/png" />
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <title>VICTIMAS</title>
    </head>
    <body>

        <div class="header"></div>
        <div>
            <img src="diseno/img/fondo.png" class="cabeza"/>
        </div>
        <div class="row">
            <div class="col xl6 l6 m8 s12 offset-xl3 offset-l3 offset-m2">
                <div class="panel panel-danger" style="margin-top: 30px;">
                    <div class="panel-body">
                        <div class="row">
                            <div class="input-field col xl8 l8 m10 s12 offset-xl2 offset-l2 offset-m1">
                                <i class="material-icons prefix">account_circle</i>
                                <input id="user" type="email" class="validate">
                                <label for="user">Correo</label>
                            </div>
                            <div class="input-field col xl8 l8 m10 s12 offset-xl2 offset-l2 offset-m1">
                                <i class="material-icons prefix">account_circle</i>
                                <input id="pass" type="password" class="validate">
                                <label for="pass">Contraseña</label>
                            </div>
                            <div style="margin-top: 20px;" align="center">
                                <a class="waves-effect waves-yellow btn red lighten-1" onclick="iniciarSesion();">Iniciar Sesion</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="footerVariable">
        <footer class="page-foote" style="background-color: #B71C1C;">
            <div class="container">
                <div class="row">
                    <div class="col l6 s12">
                        <h5 class="white-text">VictiUFPS</h5>
                        <p class="grey-text text-lighten-4">Sistema para el control del programa de victimas de la UFPS</p>
                    </div>
                    <div class="col l4 offset-l2 s12">
                        <h5 class="white-text">Aplicativos Relacionados</h5>
                        <ul>
                            <li><a class="grey-text text-lighten-3" href="https://rni.unidadvictimas.gov.co/vivanto">Vivanto</a></li>
                            <li><a class="grey-text text-lighten-3" href="https://rni.unidadvictimas.gov.co/visor-geografico">Visor Geografico</a></li>
                            <li><a class="grey-text text-lighten-3" href="http://www.mineducacion.gov.co/sistemasdeinformacion/1735/w3-propertyname-2895.html">Spadies</a></li>
                            
                        </ul>
                    </div>
                </div>
            </div>
            <div class="footer-copyright">
                <div class="container">
                    2017 - Curso de Profundización de Software
                </div>
            </div>
        </footer>
        </div>
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script type="text/javascript" src="diseno/js/materialize.min.js"></script>
        <script type="text/javascript" src="diseno/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="diseno/js/blockUI.js"></script>
        <script type="text/javascript" src="diseno/js/toastr.min.js"></script>
        <script type="text/javascript" src="diseno/js/scripts.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    </body>



</html>
