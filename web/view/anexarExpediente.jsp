<%-- 
    Document   : inicio
    Created on : 3/10/2017, 08:58:30 AM
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
        <link rel="stylesheet" type="text/css" href="../diseno/css/fileinput.css">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="http://www.cccucuta.org.co/template/images/favicon.png" type="image/png" />
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <title>VICTIMAS</title>
        <style>
            input { 
                text-transform: uppercase;
            }
            ::-webkit-input-placeholder { /* WebKit browsers */
                text-transform: none;
            }
            :-moz-placeholder { /* Mozilla Firefox 4 to 18 */
                text-transform: none;
            }
            ::-moz-placeholder { /* Mozilla Firefox 19+ */
                text-transform: none;
            }
            :-ms-input-placeholder { /* Internet Explorer 10+ */
                text-transform: none;
            }
        </style>
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
            <div class="col xl11 l11 m11 s11 offset-05">
                <i class="material-icons prefix">search</i>
                <input id="documentoCon" type="number" class="validate">
                <label for="documentoCon">DOCUMENTO</label>
            </div>
            <div class="col m2" >
                <a class="btn waves-effect waves-light grey lighten-1" onclick="cargarEstudiante2()" style="margin-top: 15px;"><i class="material-icons prefix">search</i></a>

            </div>
        </div>

        <div class="row" style="margin-top: 10px;">
            <div class="col l10 m10 offset-l1 offset-m1">
                <% if (session.getAttribute("alerta") == null) {
                        out.print("");
                    } else {
                        out.print(session.getAttribute("alerta").toString());
                        session.setAttribute("alerta", "");
                    }
                %>
                <div class="panel panel-danger">
                    <div class="panel-heading registro">
                        <h3 class="panel-title">ACTUALIZACION DEL ESTUDIANTE - <a id="nombreEstudiante">
                                <% if (session.getAttribute("nombreEstudiante") == null) {
                                        out.print("");
                                    } else {
                                        out.print(session.getAttribute("nombreEstudiante").toString());
                                    }
                                %></a></h3>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="input-field col s3">
                                <i class="material-icons prefix">account_box</i>
                                <select id="tipoAnexo">
                                    <option value="n" disabled selected>Tipo de Anexo</option>
                                    <option value="cedula">cedula</option>
                                    <option value="carnet">carnet</option>
                                    <option value="documento">documento</option>
                                    <option value="notas">notas</option>
                                </select>
                                <label>Tipo de Anexo</label>
                            </div>
                            <div class="col s9">
                                <form class="text-left" enctype="multipart/form-data" action="../proc/leerImagen.jsp" method="post" role="form">
                                    <div class="file-field input-field col s9">
                                        <div class="file-path-wrapper">
                                            <input id="picture" name="anexo" type="file" class="file" data-show-upload="false" data-show-caption="true" data-allowed-file-extensions='["pdf"]' required>

                                        </div>
                                    </div>
                                    <div class="col s3">
                                        <button type="submit" class="btn red" onclick="anexarExpediente();">CARGAR</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <jsp:include page="foot.jsp"></jsp:include>
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script type="text/javascript" src="../diseno/js/materialize.min.js"></script>
        <script type="text/javascript" src="../diseno/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="../diseno/js/blockUI.js"></script>
        <script type="text/javascript" src="../diseno/js/toastr.min.js"></script>
        <script type="text/javascript" src="../diseno/js/scripts.js"></script>
        <script type="text/javascript" src="../diseno/js/fileinput.js"></script>
        <!--<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.0.3/sweetalert2.all.js"></script>

        <script type="text/javascript">
                                            $(document).ready(function () {
                                                $('.collapsible').collapsible();
                                                $('select').material_select();
                                                $('.modal').modal();
                                            });
        </script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('select').material_select();
            });
        </script>

    </body>
</html>
