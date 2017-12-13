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

        <!-- DataTables -->
        <link rel="stylesheet" type="text/css" href="../diseno/DataTables/datatables.css">
        <link rel="stylesheet" type="text/css" href="../diseno/DataTables/DataTables-1.10.16/css/jquery.dataTables.css">
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
                        <h3 class="panel-title">INICIO DE ACTIVIDADES</h3>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col s12">
                                <table class="striped centered bordered" id="myTabla">
                                    <thead>
                                        <tr>
                                            <th>Nombre</th>
                                            <th>Fecha</th>
                                            <th>Lugar</th>
                                            <th>Tipo Evento</th>
                                            <th><i class="material-icons">done_all</i></th>
                                            <th><i class="material-icons">visibility_off</i></th>
                                            <th><i class="material-icons">assignment</i></th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <% if (session.getAttribute("actsini") == null) {
                                                out.print("");
                                            } else {
                                                out.print(session.getAttribute("actsini").toString());
                                            }
                                        %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="foot.jsp"></jsp:include>
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="../diseno/js/materialize.min.js"></script>
        <!--<script type="text/javascript" src="../diseno/js/bootstrap.min.js"></script>-->
        <script type="text/javascript" src="../diseno/js/blockUI.js"></script>
        <script type="text/javascript" src="../diseno/js/toastr.min.js"></script>
        <script type="text/javascript" src="../diseno/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.0.3/sweetalert2.all.js"></script>
        <!-- Datatables -->

        <script type="text/javascript" src="../diseno/DataTables/datatables.js"></script>

        <script type="text/javascript">
            $(document).ready(function () {
                $('#myTabla').DataTable({
                    "language": {
                        "sProcessing": "Procesando...",
                        "sLengthMenu": "Mostrar _MENU_ registros",
                        "sZeroRecords": "No se encontraron resultados",
                        "sEmptyTable": "Ningún dato disponible en esta tabla",
                        "sInfo": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                        "sInfoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
                        "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
                        "sInfoPostFix": "",
                        "sSearch": "Buscar:",
                        "sUrl": "",
                        "sInfoThousands": ",",
                        "sLoadingRecords": "Cargando...",
                        "oPaginate": {
                            "sFirst": "Primero",
                            "sLast": "Último",
                            "sNext": "Siguiente",
                            "sPrevious": "Anterior"
                        },
                        "oAria": {
                            "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
                            "sSortDescending": ": Activar para ordenar la columna de manera descendente"
                        }
                    }
                });
            });
        </script>

        <script type="text/javascript">
            $(document).ready(function () {
                $('select').material_select();
            });
        </script>
    </body>
</html>
