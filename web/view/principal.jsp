<%-- 
    Document   : principal
    Created on : 23/11/2017, 02:20:58 PM
    Author     : Manuel
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
        <%
            session.setAttribute("idEstudiante","");
        session.setAttribute("nombreEstudiante","");
        session.setAttribute("materiasEstudiante","");
            %>
        <jsp:include page="head.jsp" />
        <div>
            <jsp:include page="nav.jsp" />
        </div>
        <div class="row">
            <div class="col m10 offset-m1">
                <h5>ESTUDIANTE</h5>
                <div class="linea"></div>
                <div class="row" style="margin-top: 20px;">
                    <a href="../proc/cargarRegistroEstudiante.jsp" class="col xl2 l2 m2 s12 borde">
                        <div class="center-align">
                            <i class="material-icons md-120 center-block">face</i>
                        </div>
                        <div class="center-align">
                            <label class="center-align leyenda">Registrar<br> Estudiante</label>
                        </div>
                    </a>
                    <a href="consultarEstudiante.jsp" class="col xl2 l2 m2 s12 borde">
                        <div class="center-align">
                            <i class="material-icons md-120 center-block">view_carousel</i>
                        </div>
                        <div class="center-align">
                            <label class="center-align leyenda">Consultar<br> Estudiante</label>
                        </div>
                    </a>
                    <a href="seguimiento.jsp" class="col xl2 l2 m2 s12 borde">
                        <div class="center-align">
                            <i class="material-icons md-120 center-block">supervisor_account</i>
                        </div>
                        <div class="center-align">
                            <label class="center-align leyenda">Seguir al <br>Estudiante</label>
                        </div>
                    </a>
                    <a href="acompanamiento.jsp" class="col xl2 l2 m2 s12 borde">
                        <div class="center-align">
                            <i class="material-icons md-120 center-block">record_voice_over</i>
                        </div>
                        <div class="center-align">
                            <label class="center-align leyenda">Acompañar <br>Estudiante</label>
                        </div>
                    </a>
                    <a href="anexarExpediente.jsp" class="col xl2 l2 m2 s12 borde">
                        <div class="center-align">
                            <i class="material-icons md-120 center-block">open_in_browser</i>
                        </div>
                        <div class="center-align">
                            <label class="center-align leyenda">Anexar al <br>Expediente</label>
                        </div>
                    </a>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col m10 offset-m1">
                <h5>ACTIVIDAD</h5>
                <div class="linea"></div>
                <div class="row" style="margin-top: 20px;">
                    <a href="actividad.jsp" class="col xl2 l2 m2 s12 borde">
                        <div class="center-align">
                            <i class="material-icons md-120 center-block">library_add</i>
                        </div>
                        <div class="center-align">
                            <label class="center-align leyenda">Registrar <br>Actividad</label>
                        </div>
                    </a>
                    <a href="#" class="col xl2 l2 m2 s12 borde" onclick="cargarActividades()">
                        <div class="center-align">
                            <i class="material-icons md-120 center-block">video_library</i>
                        </div>
                        <div class="center-align">
                            <label class="center-align leyenda">Procesar<br> Actividad</label>
                        </div>
                    </a>
                    <!--<a href="#" class="col m1 offset-m1 borde" onclick="cargarActividadesFin()">
                        <i class="material-icons md-120 center-block">pan_tool</i>
                        <div class="center-align">
                            <label class="center-align leyenda">Finalizar Actividad</label>
                        </div>
                    </a>-->
                    <a href="#" class="col xl2 l2 m2 s12 borde" onclick="cargarActividadesHis()">
                        <div class="center-align">
                            <i class="material-icons md-120 center-block">library_books</i>
                        </div>
                        <div class="center-align">
                            <label class="center-align leyenda">Historial <br>Actividades</label>
                        </div>
                    </a>
                    <!--<a class="col m1 offset-m1 borde" onclick="cargarActividadesLis()">
                        <i class="material-icons md-120 center-block">assignment</i>
                        <div class="center-align">
                            <label class="center-align leyenda">Tomar<br> Lista</label>
                        </div>
                    </a>-->
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col m10 offset-m1">
                <h5>SEMESTRE</h5>
                <div class="linea"></div>
                <div class="row" style="margin-top: 20px;">
                    <a href="semestre.jsp" class="col xl2 l2 m2 s12 borde">
                        <div class="center-align">
                            <i class="material-icons md-120 center-block">event</i>
                        </div>
                        <div class="center-align">
                            <label class="center-align leyenda">Crear<br> Semestre</label>
                        </div>
                    </a>
                    <a href="#" class="col xl2 l2 m2 s12 borde" onclick="cargarSemestres();">
                        <div class="center-align">
                            <i class="material-icons md-120 center-block">playlist_add_check</i>
                        </div>
                        <div class="center-align">
                            <label class="center-align leyenda">Activar<br> Semestre</label>
                        </div>
                    </a>
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.0.3/sweetalert2.all.js"></script>
        <script type="text/javascript">
            $(".button-collapse").sideNav();
            $(".dropdown-button").dropdown();
        </script>
        <script type="text/javascript">
            $(document).ready(function () {
                // the "href" attribute of the modal trigger must specify the modal ID that wants to be triggered
                $('.modal').modal();
            });
        </script>
    </body>



</html>
