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
        <div class="row" style="margin-top: 20px;">
            <div class="col xl11 l11 m11 s11 offset-05">
                <div class="panel panel-danger">
                    <div class="panel-heading registro">
                        <h3 class="panel-title">REGISTRO DE ESTUDIANTE</h3>
                    </div>
                    <div class="panel-body">
                        <ul class="collapsible popout" data-collapsible="accordion">
                            <li>
                                <div class="collapsible-header registro"><i class="material-icons">assignment_ind</i>Datos Generales del Estudiante</div>
                                <div class="collapsible-body">
                                    <div class="row">

                                        <div class="input-field col s6">
                                            <i class="material-icons prefix">account_circle</i>
                                            <input id="nombres" type="text" class="validate">
                                            <label for="nombres">Nombres</label>
                                        </div>
                                        <div class="input-field col s6">
                                            <i class="material-icons prefix">account_box</i>
                                            <input id="apellidos" type="text" class="validate">
                                            <label for="apellidos">Apellidos</label>
                                        </div>
                                        <!--<div class="input-field col s6">
                                            <i class="material-icons prefix">account_box</i>
                                            <select>
                                                <option value="" disabled selected>Tipo de Documento</option>
                                                <option value="1">Option 1</option>
                                                <option value="2">Option 2</option>
                                                <option value="3">Option 3</option>
                                            </select>
                                            <label>Materialize Select</label>
                                        </div>-->
                                        <div class="input-field col s4">
                                            <i class="material-icons prefix">account_box</i>
                                            <input id="codigo" type="number" class="validate">
                                            <label for="codigo">Codigo</label>
                                        </div>
                                        <div class="input-field col s4">
                                            <i class="material-icons prefix">account_box</i>
                                            <input id="documento" type="text" class="validate">
                                            <label for="documento">Documento</label>
                                        </div>
                                        <div class="input-field col s4">
                                            <i class="material-icons prefix">textsms</i>
                                            <input type="text" id="lugarExpedicion" class="autocomplete">
                                            <label for="lugarExpedicion">Lugar de Expedicion</label>
                                        </div>
                                        <div class="input-field col s6">
                                            <i class="material-icons prefix">account_box</i>
                                            <label>Fecha Nacimiento</label>
                                            <input type="date" name="fechaNac" id="fechaNac" class="datepicker" data-value="2000/1/1">
                                        </div>
                                        <div class="input-field col s6">
                                            <i class="material-icons prefix">textsms</i>
                                            <input type="text" id="municipioNacimiento" class="autocomplete">
                                            <label for="municipioNacimiento">Municipiio Nacimiento</label>
                                        </div>
                                        <div class="input-field col s6">
                                            <i class="material-icons prefix">account_box</i>
                                            <input id="direccionResidencia" type="text" class="validate">
                                            <label for="direccionResidencia">Direccion de Residencia</label>
                                        </div>
                                        <div class="input-field col s6">
                                            <i class="material-icons prefix">textsms</i>
                                            <input type="text" id="municipioResidencia" class="autocomplete">
                                            <label for="municipioResidencia">Municipiio Residencia</label>
                                        </div>
                                        <div class="input-field col s4">
                                            <i class="material-icons prefix">account_box</i>
                                            <select id="estrato">
                                                <option value="n" disabled selected>Estrato</option>
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                            </select>
                                            <label>Estrato</label>
                                        </div>
                                        <div class="input-field col s4">
                                            <i class="material-icons prefix">account_box</i>
                                            <select id="estadoCivil">
                                                <option value="n" disabled selected>Estado Civil</option>
                                                <option value="1">Soltero</option>
                                                <option value="2">Casado</option>
                                                <option value="3">Viudo</option>
                                                <option value="3">Divorciado</option>
                                            </select>
                                            <label>Estado Civil</label>
                                        </div>
                                        <div class="input-field col s4">
                                            <i class="material-icons prefix">account_box</i>
                                            <select id="numeroHijos">
                                                <option value="n" disabled selected>Numero de Hijos</option>
                                                <option value="0">0</option>
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">+5</option>
                                            </select>
                                            <label>Numero de Hijos</label>
                                        </div>

                                        <div class="input col s2">
                                            <i class="material-icons prefix">account_box</i>
                                            <label for="icon_prefix" style="margin-left: 0px;">Grupo Etnico</label>
                                            <div class="switch">
                                                <label>
                                                    No
                                                    <input type="checkbox" id="grupoEtnico">
                                                    <span class="lever"></span>
                                                    Si
                                                </label>
                                            </div>
                                        </div>
                                        <div class="input-field col s4">
                                            <i class="material-icons prefix">account_box</i>
                                            <input id="email" type="email" class="validate">
                                            <label for="email">Email</label>
                                        </div>
                                        <div class="input-field col s4">
                                            <i class="material-icons prefix">account_box</i>
                                            <input id="telefono" type="number" class="validate">
                                            <label for="telefono">Telefono</label>
                                        </div>
                                        <div class="input col s2">
                                            <i class="material-icons prefix">account_box</i>
                                            <label for="mujerCabeza" style="margin-left: 0px;">Mujer Cabeza de Familia</label>
                                            <div class="switch">
                                                <label>
                                                    No
                                                    <input type="checkbox" id="mujerCabeza">
                                                    <span class="lever"></span>
                                                    Si
                                                </label>
                                            </div>
                                        </div>
                                        <div class="input col s12" >
                                            <i class="material-icons prefix">account_box</i>
                                            <label for="icon_prefix" style="margin-left: 0px;">Discapacidades</label>
                                            <div style="border: 1px solid #ecf0f1;">
                                                <div class="row" style="margin-top: 10px;">
                                                    <div class="col s2">
                                                        <input type="checkbox" id="test1" />
                                                        <label for="test1">Sordera Profunda</label>
                                                    </div>
                                                    <div class="col s2">
                                                        <input type="checkbox" id="test2" />
                                                        <label for="test2">Lesion Neuromuscular</label>
                                                    </div>
                                                    <div class="col s2">
                                                        <input type="checkbox" id="test3" />
                                                        <label for="test3">Baja Audicion</label>
                                                    </div>
                                                    <div class="col s2">
                                                        <input type="checkbox" id="test4" />
                                                        <label for="test4">Autismo</label>
                                                    </div>
                                                    <div class="col s2">
                                                        <input type="checkbox" id="test5" />
                                                        <label for="test5">Baja Vision</label>
                                                    </div>
                                                    <div class="col s2">
                                                        <input type="checkbox" id="test6" />
                                                        <label for="test6">Retardo Mental</label>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col s2">
                                                        <input type="checkbox" id="test7" />
                                                        <label for="test7">Ceguera</label>
                                                    </div>
                                                    <div class="col s2">
                                                        <input type="checkbox" id="test8" />
                                                        <label for="test8">Sindrome Down</label>
                                                    </div>
                                                    <div class="col s2">
                                                        <input type="checkbox" id="test9" />
                                                        <label for="test9">Mudez</label>
                                                    </div>
                                                    <div class="col s2">
                                                        <input type="checkbox" id="test10" />
                                                        <label for="test10">Paralisis Cerebral</label>
                                                    </div>
                                                    <div class="col s2">
                                                        <input type="checkbox" id="test11" />
                                                        <label for="test11">Paralisis Fisica</label>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col s2">
                                                        <input type="checkbox" id="test12" />
                                                        <label for="test12">No Aplica</label>
                                                    </div>
                                                    <div class="col s2">
                                                        <input type="checkbox" id="test13" />
                                                        <label for="test13">No Reporta</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="input-field col s3">
                                            <i class="material-icons prefix">textsms</i>
                                            <input type="text" id="programaAcademico" class="autocompleteProg">
                                            <label for="programaAcademico">Programa Academico</label>
                                        </div>
                                        <div class="input-field col s3">
                                            <i class="material-icons prefix">account_box</i>
                                            <select id="modalidad">
                                                <option value="n" disabled selected>Modalidad</option>
                                                <option value="1">Diurna</option>
                                                <option value="2">Nocturna</option>
                                            </select>
                                            <label>Modalidad</label>
                                        </div>
                                        <div class="input-field col s3">
                                            <i class="material-icons prefix">account_box</i>
                                            <select id="semestreQueEntro">
                                                <option value="n" disabled selected>Semestre en que entró</option>
                                                <% if (session.getAttribute("semestres") == null || session.getAttribute("semestres").toString().equals("vacio")) {
                                                %>
                                                <script type="text/javascript">
                                                    alert('NO HAY SEMESTRES');
                                                    window.location.href = "principal.jsp";

                                                </script>
                                                <%} else {
                                                        out.print(session.getAttribute("semestres").toString());
                                                    }
                                                %>
                                            </select>
                                            <label>Semestre que Entró</label>
                                        </div>
                                        <div class="input-field col s3">
                                            <i class="material-icons prefix">account_box</i>
                                            <select id="jornada">
                                                <option value="n" disabled selected>Jornada</option>
                                                <option value="1">Diurna</option>
                                                <option value="2">Nocturna</option>
                                                <option value="3">Distancia</option>
                                            </select>
                                            <label>Jornada</label>
                                        </div>
                                        <div class="input-field col s3">
                                            <i class="material-icons prefix">account_box</i>
                                            <input id="hechoVictimizante" type="text" class="validate">
                                            <label for="hechoVictimizante">Hecho Victimizante</label>
                                        </div>
                                        <div class="input-field col s3">
                                            <i class="material-icons prefix">account_box</i>
                                            <select id="acuerdo">
                                                <option value="n" disabled selected>Acuerdo</option>
                                                <% if (session.getAttribute("acuerdos") == null || session.getAttribute("acuerdos").toString().equals("vacio")) {
                                                        System.out.println(session.getAttribute("acuerdos").toString());
                                                %>
                                                <script type="text/javascript">
                                                    alert('NO HAY ACUERDOS');
                                                    window.location.href = "principal.jsp";
                                                </script>
                                                <%} else {
                                                        out.print(session.getAttribute("acuerdos").toString());
                                                    }
                                                %>
                                            </select>
                                            <label>Acuerdo</label>
                                        </div>
                                        <div class="input-field col s4">
                                            <i class="material-icons prefix">account_box</i>
                                            <select id="grupoPerteneciente">
                                                <option value="n" disabled selected>Grupo Perteneciente</option>
                                                <option value="1">Normal</option>
                                                <option value="2">Especial</option>
                                            </select>
                                            <label>Grupo Perteneciente</label>
                                        </div>
                                        <div class="input col s2 hiddendiv">
                                            <i class="material-icons prefix">account_box</i>
                                            <label for="icon_prefix" style="margin-left: 0px;">Activo</label>
                                            <div class="switch">
                                                <label>
                                                    No
                                                    <input type="checkbox" id="estadoActivo">
                                                    <span class="lever"></span>
                                                    Si
                                                </label>
                                            </div>
                                        </div>
                                    </div>    
                                </div>
                            </li>
                            <li>
                                <div class="collapsible-header registro"><i class="material-icons">supervisor_account</i>Informacion del Acudiente</div>
                                <div class="collapsible-body">
                                    <div class="row">
                                        <div class="input-field col s5">
                                            <i class="material-icons prefix">account_circle</i>
                                            <input id="nombresAcudiente" type="text" class="validate">
                                            <label for="nombresAcudiente">Nombres</label>
                                        </div>
                                        <div class="input-field col s5">
                                            <i class="material-icons prefix">account_box</i>
                                            <input id="apellidosAcudiente" type="text" class="validate">
                                            <label for="apellidosAcudiente">Apellidos</label>
                                        </div>
                                        <!--<div class="input-field col s6">
                                            <i class="material-icons prefix">account_box</i>
                                            <select>
                                                <option value="" disabled selected>Tipo de Documento</option>
                                                <option value="1">Option 1</option>
                                                <option value="2">Option 2</option>
                                                <option value="3">Option 3</option>
                                            </select>
                                            <label>Materialize Select</label>
                                        </div>-->
                                        <div class="input-field col s2">
                                            <i class="material-icons prefix">account_box</i>
                                            <input id="telefonoAcudiente" type="text" class="validate">
                                            <label for="tenefonoAcudiente">Telefono Acudiente</label>
                                        </div>
                                        <div class="input-field col s6">
                                            <i class="material-icons prefix">account_box</i>
                                            <input id="direccionResidenciaAcudiente" type="text" class="validate">
                                            <label for="direccionResidenciaAcudiente">Direccion de Residencia</label>
                                        </div>
                                        <div class="input-field col s6">
                                            <i class="material-icons prefix">textsms</i>
                                            <input type="text" id="municipioResidenciaAcudiente" class="autocomplete">
                                            <label for="municipioResidenciaAcudiente">Municipiio Residencia</label>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="collapsible-header registro"><i class="material-icons">visibility</i>Funcionario Responsable</div>
                                <div class="collapsible-body">
                                    <div class="row">
                                        <div class="input-field col s5">
                                            <i class="material-icons prefix">account_circle</i>
                                            <input id="nombresResponsable" type="text" class="validate">
                                            <label for="nombresResponsable">Nombres</label>
                                        </div>
                                        <div class="input-field col s5">
                                            <i class="material-icons prefix">account_box</i>
                                            <input id="apellidosResponsable" type="text" class="validate">
                                            <label for="apellidosResponsable">Apellidos</label>
                                        </div>
                                        <!--<div class="input-field col s6">
                                            <i class="material-icons prefix">account_box</i>
                                            <select>
                                                <option value="" disabled selected>Tipo de Documento</option>
                                                <option value="1">Option 1</option>
                                                <option value="2">Option 2</option>
                                                <option value="3">Option 3</option>
                                            </select>
                                            <label>Materialize Select</label>
                                        </div>-->
                                        <div class="input-field col s2">
                                            <i class="material-icons prefix">account_box</i>
                                            <input id="telefonoResponsable" type="number" class="validate">
                                            <label for="telefonoResponsable">Telefono</label>
                                        </div>
                                        <div class="input-field col s6">
                                            <i class="material-icons prefix">account_box</i>
                                            <input id="direccionResidenciaResponsable" type="text" class="validate">
                                            <label for="direccionResidenciaResponsable">Direccion de Residencia</label>
                                        </div>
                                        <div class="input-field col s6">
                                            <i class="material-icons prefix">textsms</i>
                                            <input type="text" id="municipioResidenciaResponsable" class="autocomplete">
                                            <label for="municipioResidenciaResponsable">Municipiio Residencia</label>
                                        </div>
                                        <div class="input-field col s6">
                                            <i class="material-icons prefix">account_box</i>
                                            <input id="emailResponsable" type="email" class="validate">
                                            <label for="emailResponsable">Email</label>
                                        </div>
                                        <div class="input-field col s6">
                                            <i class="material-icons prefix">account_box</i>
                                            <input type="text" id="cargoResponsable">
                                            <label for="cargoResponsable">Cargo</label>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="collapsible-header registro"><i class="material-icons">wc</i>Descripcion Nucleo Familiar</div>
                                <div class="collapsible-body">
                                    <div class="row">
                                        <div class="input-field col s2">
                                            <i class="material-icons prefix">account_box</i>
                                            <select id="numeroHermanos">
                                                <option value="n" disabled selected>Numero de Hermanos</option>
                                                <option value="0">0</option>
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="5+">5+</option>
                                            </select>
                                            <label>Numero de Hermanos</label>
                                        </div>
                                        <div class="input-field col s2">
                                            <i class="material-icons prefix">account_box</i>
                                            <select id="posicionHermanos">
                                                <option value="n" disabled selected>Posicion entre Hermanos</option>
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="5+">5+</option>
                                            </select>
                                            <label>Materialize Select</label>
                                        </div>
                                        <div class="input-field col s4">
                                            <i class="material-icons prefix">account_box</i>
                                            <input id="direccionResidenciaFamiliar" type="text" class="validate">
                                            <label for="direccionResidenciaFamiliar">Direccion de Residencia</label>
                                        </div>
                                        <div class="input-field col s4">
                                            <i class="material-icons prefix">textsms</i>
                                            <input type="text" id="municipioResidenciaFamiliar" class="autocomplete">
                                            <label for="municipioResidenciaFamiliar">Municipiio Residencia</label>
                                        </div>
                                        <div class="input-field col s3">
                                            <i class="material-icons prefix">account_box</i>
                                            <select id="tipoViviendaFamiliar">
                                                <option value="n" disabled selected>Tipo de Vivienda</option>
                                                <option value="1">Propia</option>
                                                <option value="2">Arrendada</option>
                                            </select>
                                            <label>Tipo Vivienda</label>
                                        </div>
                                        <div class="input-field col s3">
                                            <i class="material-icons prefix">account_box</i>
                                            <select id="estratoFamiliar">
                                                <option value="n" disabled selected>Estrato</option>
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                            </select>
                                            <label>Estrato</label>
                                        </div>
                                        <div class="input-field col s3">
                                            <i class="material-icons prefix">account_box</i>
                                            <select id="zonaUbicacionFamiliar">
                                                <option value="n" disabled selected>Zona Ubicacion</option>
                                                <option value="1">Urbana</option>
                                                <option value="2">Rural</option>
                                            </select>
                                            <label>Zona Ubicacion</label>
                                        </div>
                                        <div class="input-field col s3">
                                            <i class="material-icons prefix">account_box</i>
                                            <select id="tendenciaFamiliar">
                                                <option value="n" disabled selected>Tendencia</option>
                                                <option value="1">Desconocida</option>
                                            </select>
                                            <label>Tendencia ¡?</label>
                                        </div>
                                        <div class="input-field col s3">
                                            <i class="material-icons prefix">textsms</i>
                                            <input type="number" id="telefonoFamiliar">
                                            <label for="telefonoFamiliar">Telefono</label>
                                        </div>
                                        <div class="input-field col s3">
                                            <i class="material-icons prefix">textsms</i>
                                            <select id="permanenciaVivienda">
                                                <option value="n" disabled selected>Permanencia en la Vivienda</option>
                                                <option value="1">1 año</option>
                                                <option value="2">2 años</option>
                                                <option value="3">3 años</option>
                                                <option value="4">4 años</option>
                                                <option value="5">5 años</option>
                                            </select>
                                            <label>Permanencia Vivienda</label>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="collapsible-header registro"><i class="material-icons">recent_actors</i>Situacion Laboral de la Familia</div>
                                <div class="collapsible-body">
                                    <jsp:include page="laboralFamilia.jsp" />
                                </div>
                            </li>
                            <li>
                                <div class="collapsible-header registro"><i class="material-icons">attach_money</i>Sostenimiento del Estudiante</div>
                                <div class="collapsible-body">
                                    <div class="row">
                                        <div class="input col s2">
                                            <i class="material-icons prefix">account_box</i>
                                            <label for="icon_prefix" style="margin-left: 0px;">Trabaja</label>
                                            <div class="switch">
                                                <label>
                                                    No
                                                    <input type="checkbox" id="trabaja">
                                                    <span class="lever"></span>
                                                    Si
                                                </label>
                                            </div>
                                        </div>
                                        <div class="input-field col s6">
                                            <i class="material-icons prefix">account_box</i>
                                            <input id="lugarTrabajo" type="text" class="validate">
                                            <label for="lugarTrabajo">Lugar de Trabajo</label>
                                        </div>
                                        <div class="input-field col s4">
                                            <i class="material-icons prefix">account_box</i>
                                            <input id="presupuestoMensual" type="text" class="validate">
                                            <label for="presupuestoMensual">Presupuesto Mensual</label>
                                        </div>
                                        <div class="input-field col s6">
                                            <i class="material-icons prefix">mode_edit</i>
                                            <textarea id="comoSostiene" class="materialize-textarea" maxlength="150" data-length="150"></textarea>
                                            <label for="comoSostiene">Como se Sostiene?</label>
                                        </div>
                                        <div class="input-field col s6">
                                            <i class="material-icons prefix">mode_edit</i>
                                            <textarea id="observaciones" class="materialize-textarea" maxlength="150" data-length="150"></textarea>
                                            <label for="observaciones">Observaciones</label>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="collapsible-header registro"><i class="material-icons">event_seat</i>Caracterizacion Situacion Psicologica del Estudiante</div>
                                <div class="collapsible-body">
                                    <div class="row">
                                        <div class="input-field col s12">
                                            <i class="material-icons prefix">mode_edit</i>
                                            <textarea id="situacionPsicologica" class="materialize-textarea" maxlength="1000" data-length="1000"></textarea>
                                            <label for="situacionPsicologica">Situacion Psicosocial del Estudiante</label>
                                        </div>
                                        <div class="input-field col s12">
                                            <i class="material-icons prefix">mode_edit</i>
                                            <textarea id="riesgosPermanencia" class="materialize-textarea" maxlength="100" data-length="100"></textarea>
                                            <label for="riesgosPermanencia">Riesgos que puedan afectar la permanencia del estudiante</label>
                                        </div>

                                    </div>
                                </div>
                            </li>
                        </ul>
                        <div align="center">
                            <a class="btn waves-effect waves-light green lighten-1" onclick="cargarRegistroEstudiante()">Finalizar</a>
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
        <!--<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.0.3/sweetalert2.all.js"></script>

        <script type="text/javascript">
                                $(document).ready(function () {
                                    $('.collapsible').collapsible();
                                    $('select').material_select();
                                });
        </script>
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
            });
        </script>

        <script type="text/javascript">
            $(document).ready(function () {
                $('input.autocomplete').autocomplete({
                    data: {
                        "Cucuta": null,
                        "Villa del Rosario": null,
                        "Los Patios": null,
                        "Pamplona": null,
                        "Cacota": null,
                        "Bochalema": null,
                        "El Zulia": null,
                        "Ocaña": null,
                        "Durania": null,
                        "Chinacota": null,
                        "Herran": null,
                        "Pamplonita": null,
                        "Silos": null,
                        "Mutiscua": null,
                        "Salazar": null,
                        "Santiago": null,
                        "Cornejo": null,
                        "San Cayetano": null,
                        "Gramalote": null,
                        "Lourdes": null,
                        "Arboledas": null,
                        "Bogota": null,
                        "Medellin": null,
                        "Cali": null,
                        "Bucaramanga": null,
                        "Cartagena": null,
                        "Barranquilla": null,
                        "Santa Marta": null,
                        "Tunja": null
                    },
                    limit: 20, // The max amount of results that can be shown at once. Default: Infinity.
                    onAutocomplete: function (val) {
                        // Callback function when value is autcompleted.
                    },
                    minLength: 1, // The minimum length of the input for the autocomplete to start. Default: 1.
                });

                $('input.autocompleteProg').autocomplete({
                    data: {
                        "Ing Sistemas": null,
                        "Ing Industrial": null,
                        "Ing Mecanica": null,
                        "Ing Civil": null,
                        "Ing Ambiental": null,
                        "Ing Electronica": null,
                        "Ing Minas": null,
                        "Enfermeria": null,
                        "Contaduria": null,
                        "Administracion": null,
                        "Derecho": null
                    },
                    limit: 20, // The max amount of results that can be shown at once. Default: Infinity.
                    onAutocomplete: function (val) {
                        // Callback function when value is autcompleted.
                    },
                    minLength: 1, // The minimum length of the input for the autocomplete to start. Default: 1.
                });
            });
        </script>
    </body>
</html>
