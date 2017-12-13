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
        <div class="row">
            <div class="col xl11 l11 m11 s11 offset-05">
                <div class="panel panel-danger">
                    <div class="panel-heading registro">
                        <h3 class="panel-title">TOMAR LISTA</h3>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col s10 offset-s1">
                                <input type="text" class="hiddendiv" id="cantidadEst" value="<% if (session.getAttribute("cantidadEst") == null) {
                                            out.print("");
                                        } else {
                                            out.print(session.getAttribute("cantidadEst").toString());
                                        }%>">
                                <input type="text" class="hiddendiv" id="index" value="<% if (session.getAttribute("indexAct") == null) {
                                            out.print("");
                                        } else {
                                            out.print(session.getAttribute("indexAct").toString());
                                        }%>">
                                <table class="striped centered bordered" id="myTabla">
                                    <thead>
                                        <tr>
                                            <th>Nombre</th>
                                            <th>Documento</th>
                                            <th>¿Asistio?</th>
                                        </tr>
                                    </thead>
                                    <% if (session.getAttribute("listEst") == null) {
                                            out.print("");
                                        } else {
                                            out.print(session.getAttribute("listEst").toString());
                                        }
                                    %>
                                    <tbody>
                                    <tfoot>
                                    <th></th>
                                    <th></th>
                                    <th><div align="center"><a class="btn waves-effect waves-light blue lighten-1" onclick="guardarListado();">GUARDAR</a></div></th>
                                    </tfoot>
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
                                            $('select').material_select();
                                        });
        </script>
    </body>
</html>
