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
            session.setAttribute("idEstudiante", "");
            session.setAttribute("nombreEstudiante", "");
            session.setAttribute("materiasEstudiante", "");
        %>
        <jsp:include page="head.jsp" />
        <div>
            <jsp:include page="nav.jsp" />
        </div>
        <div class="row">
            <div class="col l2">
                <ul id="slide-out" class="side-nav fixed" style="position: relative;">
                    <li>
                        <div class="user-view">
                            <div class="background" style="opacity: 0.5;">
                                <img src="../diseno/img/paral.jpg" class="responsive-img">
                            </div>
                            <a href="#!user"><img class="circle responsive-img" src="../diseno/img/logo.png"></a>
                            <a href="#!name" style="font-weight: bold;"><span class="black-text name">REPORTES</span></a>
                            <a href="#!email"><span class="black-text email">Modulo de Reportes</span></a>
                        </div>
                    </li>
                    <li><a><i class="material-icons">account_balance_wallet</i>Reportes</a></li>
                    <li onmousemove="pintar(this);" onmouseout="despintar(this);"><a href="#chart_div" onclick="asistenciasxactividad();">Asistencias x Actividad (Actual)</a></li>
                    <li onmousemove="pintar(this);" onmouseout="despintar(this);"><a href="#chart_div" onclick="asistenciasxactividadHis();">Asistencias x Actividad (Historico)</a></li>
                    <li onmousemove="pintar(this);" onmouseout="despintar(this);"><a href="#chart_div" onclick="actividadesxsemestre();">Actividades x Semestre</a></li>
                    <li onmousemove="pintar(this);" onmouseout="despintar(this);"><a href="#chart_div" onclick="estudiantesxsemestre();">Estudiantes x Semestre</a></li>
                    <li onmousemove="pintar(this);" onmouseout="despintar(this);"><div class="divider"></div></li>
                    <li onmousemove="pintar(this);" onmouseout="despintar(this);"><a href="#chart_div" onclick="listadoEstudiantes();">Listado Estudiantes (Total)</a></li>
                    <li onmousemove="pintar(this);" onmouseout="despintar(this);"><a href="#chart_div" onclick="listadoEstudiantesAct();">Listado Estudiantes (Actual)</a></li>
                    <li onmousemove="pintar(this);" onmouseout="despintar(this);"><a href="#chart_div" onclick="estudiantesAprobados();">Estudiantes Aprobados</a></li>
                </ul>
            </div>
            <div class="col l10">
                <div id="chart_div" style="width:90%; height:500px; margin-left: 5%;"></div>
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
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript" src="../diseno/DataTables/datatables.js"></script>
        <script type="text/javascript">
                $(".button-collapse").sideNav();
                $(".dropdown-button").dropdown();
        </script>
        <script type="text/javascript">
            $(document).ready(function () {
                // the "href" attribute of the modal trigger must specify the modal ID that wants to be triggered
                $('.modal').modal();
                $(".button-collapse").sideNav();
            });
        </script>
    </body>



</html>
