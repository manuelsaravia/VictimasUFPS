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
        <div class="row" style="margin-top: 20px;">
            <div class="col xl11 l11 m11 s11 offset-05">
                <div class="panel panel-danger">
                    <div class="panel-heading registro">
                        <h3 class="panel-title">REGISTRO DE ACTIVIDADES</h3>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="input-field col s2">
                                <i class="material-icons prefix">account_box</i>
                                <select id="obligatoriedad">
                                    <option value="" disabled selected>Tipo de Evento</option>
                                    <option value="1">Reunion</option>
                                    <option value="2">Actividad</option>

                                </select>
                                <label>Tipo de Evento</label>
                            </div>
                            <div class="input-field col s3">
                                <i class="material-icons prefix">account_circle</i>
                                <input id="nombre" type="text" class="validate">
                                <label for="nombre">Nombre</label>
                            </div>
                            <div class="input-field col s2">
                                <i class="material-icons prefix">account_box</i>
                                <label>Fecha del Evento</label>
                                <input type="date" name="fecha" id="fecha" class="datepicker" data-value="2000/1/1">
                            </div>
                            <div class="input-field col s2">
                                <i class="material-icons prefix">account_box</i>
                                <label>Hora del Evento</label>
                                <input type="text" class="timepicker" id="hora" placeholder="12:00">
                            </div>
                            <div class="input-field col s3">
                                <i class="material-icons prefix">account_circle</i>
                                <input id="lugar" type="text" class="validate">
                                <label for="lugar">Lugar de Realizacion</label>
                            </div>
                            <!--<div class="input col s2">
                                <i class="material-icons prefix">account_box</i>
                                <label for="icon_prefix" style="margin-left: 0px;">Grupo Etnico</label>
                                <div class="switch">
                                    <label>
                                        No
                                        <input type="checkbox">
                                        <span class="lever"></span>
                                        Si
                                    </label>
                                </div>
                            </div>-->
                            <div class="col s3 offset-s5">
                                <a class="waves-effect waves-purple btn red lighten-1" onclick="registrarActividad();">REGISTRAR</a>
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.0.3/sweetalert2.all.js"></script>

        <script type="text/javascript">
                                    $(document).ready(function () {
                                        $('select').material_select();
                                    });
        </script>
        <script type="text/javascript">
            $(document).ready(function () {
                $(document).ready(function () {
                    $('select').material_select();
                });
                $('.datepicker').pickadate({
                    selectMonths: true, // Creates a dropdown to control month
                    selectYears: 100, // Creates a dropdown of 15 years to control year
                    // Strings and translations
                    monthsFull: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
                    monthsShort: ['Ene', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
                    weekdaysFull: ['Domingo', 'Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes', 'Sabado'],
                    weekdaysShort: ['Dom', 'Lun', 'Mar', 'Mier', 'Jue', 'Vie', 'Sab'],
                    showMonthsShort: undefined,
                    showWeekdaysFull: undefined,
                    weekdaysLetter: ['D', 'L', 'M', 'X', 'J', 'V', 'S'],
                    format: 'yyyy-mm-dd',
                    format_submit: false,
// Buttons
                    today: 'Hoy',
                    clear: 'Limpiar',
                    close: 'Aceptar',
// Accessibility labels
                    labelMonthNext: 'Mes Siguiente',
                    labelMonthPrev: 'Mes Anterior',
                    labelMonthSelect: 'Seleccione un Mes',
                    labelYearSelect: 'Seleccione un Año'
                });
                $('.timepicker').pickatime({
                    default: 'now', // Set default time: 'now', '1:30AM', '16:30'
                    fromnow: 0, // set default time to * milliseconds from now (using with default = 'now')
                    twelvehour: true, // Use AM/PM or 24-hour format
                    donetext: 'Aceptar', // text for done-button
                    cleartext: 'Limpiar', // text for clear-button
                    canceltext: 'Cancelar', // Text for cancel-button
                    autoclose: false, // automatic close timepicker
                    ampmclickable: true, // make AM PM clickable
                    aftershow: function () {
                    } //Function for after opening timepicker
                });
            });
        </script>
    </body>
</html>
